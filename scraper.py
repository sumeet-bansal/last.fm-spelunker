# partially adapted from Matt Lewis's scraper

import requests
import sys
import collections
import dataset
from datetime import datetime

class Scraper:

	def __init__(self, username):
		self.USER = username
		self.API_KEY = '2bf228a2ce0167b5b857dd53ea6f39c1'
		self.ROOT_URL = 'https://ws.audioscrobbler.com/2.0/'
		self.PER_PAGE = 200		# max allowed by last.fm
		self.RECENT_URL = self.ROOT_URL + '/?method=user.getrecenttracks&user=' + username
		self.RECENT_URL += '&api_key=' + self.API_KEY + '&format=json&page=%s&limit=%s'
		self.ARTIST_URL = self.ROOT_URL + '/?method=artist.getinfo&api_key=' + self.API_KEY + '&artist=%s&format=json'

	# flattens the JSON into a uniform depth (i.e. a series of keys and non-nested values)
	# modified from http://stackoverflow.com/a/6027615/254187 to strip pound symbols
	def flatten(self, d, parent_key=''):
		items = []
		for k, v in d.items():
			new_key = parent_key + '_' + k if parent_key else k
			if isinstance(v, collections.MutableMapping):
				items.extend(self.flatten(v, new_key).items())
			else:
				new_key = new_key.replace('#', '')
				items.append((new_key, v))
		return dict(items)

	# removes all matching properties in the `props` list from the json object
	def clean(self, json, props):
		for prop in props:
			if prop in json:
				del json[prop]
		return json

	# processes scrobble for SQL insertion
	def process_scrobble(self, scrobble):

		# removes unnecessary attributes
		props = ['image', 'streamable', 'url', '@attr', 'mbid']
		scrobble = self.clean(scrobble, props)

		# flattens the track JSON
		flattened = self.flatten(scrobble)
		for key, val in flattened.items():
			if val == '':
				flattened[key] = None

		del flattened['artist_mbid']
		del flattened['album_mbid']

		flattened['artist'] = flattened.pop('artist_text')
		flattened['track'] = flattened.pop('name')
		flattened['album'] = flattened.pop('album_text')

		if 'date_uts' in flattened:
			flattened['timestamp'] = int(flattened.pop('date_uts'))
			flattened['timestamp_text'] = flattened.pop('date_text')
			dt = datetime.fromtimestamp(flattened['timestamp'])
			flattened['play_year'] = dt.year
			flattened['play_month'] = dt.month
			flattened['play_date'] = dt.day
			flattened['play_hour'] = dt.hour
		else:
			flattened = None
		return flattened

	# processes artist for SQL insertion
	def process_artist(self, artist):

		# removes unnecessary attributes
		props = ['ontour', 'image', 'streamable', 'url', 'bio', 'mbid']
		artist = self.clean(artist, props)

		# compresses related artists to a single value
		related = None
		if 'similar' in artist:
			related = []
			for relatedArtist in artist['similar']['artist']:
				relatedArtist = self.process_artist(relatedArtist)
				related.append(relatedArtist['name'].replace(',', ''))
			del artist['similar']

		# compresses artist tags to a single value
		tags = None
		if 'tags' in artist:
			tags = []
			for tag in artist['tags']['tag']:
				tags.append(tag['name'])
			del artist['tags']

		# converts all artist stats to ints
		if 'stats' in artist:
			for stat in artist['stats']:
				artist['stats'][stat] = int(artist['stats'][stat])

		# flattens the track JSON
		flattened = flatten(artist)
		for key, val in flattened.items():
			if val == '':
				flattened[key] = None

		if related is not None:
			flattened['related'] = ", ".join(related)
		if tags is not None:
			flattened['tags'] = ", ".join(tags)

		return flattened

	def get_all_scrobbles(self):

		# gets total num of pages in last.fm user history
		resp = requests.get(self.RECENT_URL % (1, self.PER_PAGE)).json()
		try:
			TOTAL_PAGES = int(resp['recenttracks']['@attr']['totalPages'])
		except KeyError:
			print("[ERROR] Invalid last.fm username.")
			quit()

		# adds all scrobbles to a list
		for page in reversed(range(1, TOTAL_PAGES + 1)):
			scrobbles = requests.get(self.RECENT_URL % (page, self.PER_PAGE)).json()['recenttracks']['track']
			sys.stdout.write("\rRetrieving scrobble history...\t%d of %d\tfor %s." % (TOTAL_PAGES - page + 1, TOTAL_PAGES, self.USER))
			sys.stdout.flush()
			self.insert_scrobbles(reversed(scrobbles))
		print("\rRetrieved scrobble history.")

	def update_scrobbles(self):

		with dataset.connect('sqlite:///last-fm.db') as db:
			rts = db.query('SELECT MAX(timestamp) as recent from %s' % self.USER).next()['recent']

		# gets total num of pages in last.fm user history
		UPDATE_URL = self.RECENT_URL + ('&from=%d' % (rts + 1))
		resp = requests.get(UPDATE_URL % (1, self.PER_PAGE)).json()
		try:
			TOTAL_PAGES = int(resp['recenttracks']['@attr']['totalPages'])
		except KeyError:
			print("[ERROR] Invalid last.fm username.")
			quit()
		inserted = 0
		for page in reversed(range(1, TOTAL_PAGES + 1)):
			scrobbles = requests.get(UPDATE_URL % (page, self.PER_PAGE)).json()['recenttracks']['track']
			inserted += self.insert_scrobbles(reversed(scrobbles))
			sys.stdout.write("\rUpdated scrobble history with %d new scrobble(s) for %s." % (inserted, self.USER))
			sys.stdout.flush()
		if inserted != 0:
			print()

	def insert_scrobbles(self, scrobbles):

		inserted = 0

		# iterates through, processes, and inserts each scrobble
		with dataset.connect('sqlite:///last-fm.db') as db:
			for scrobble in scrobbles:
				processed = self.process_scrobble(scrobble)
				if processed is not None:
					db[self.USER].insert(processed)
					inserted += 1

		return inserted

	def artists(self):

		# grabs and inserts info for all distinct scrobbled artists
		with dataset.connect('sqlite:///last-fm.db') as db:
			errors = []
			result = db['scrobbles'].distinct('artist')
			sql = 'SELECT COUNT(DISTINCT artist) AS count FROM scrobbles'
			totalArtists = int(db.query(sql).next()['count'])
			for index, row in enumerate(result):
				artist = requests.get(ARTIST_URL % row['artist']).json()
				sys.stdout.write("\rRetrieving artist info...\t%s of %s" % (str(index), str(totalArtists)))
				sys.stdout.flush()
				try:
					processed = self.process_artist(artist['artist'])
					db['artists'].insert(processed)
				except KeyError:
					errors.append(row['artist'])
			sys.stdout.write("\rRetrieving artist info...\t{0} of {0}".format(str(totalArtists)))
			sys.stdout.flush()
			print("\rRetrieved artist info.")
			if errors:
				print("\nThe following artists could not be located within the last.fm database: \n  " + "\n  ".join(errors))

if __name__ == '__main__':

	if len(sys.argv) == 1:
		print("[ERROR] No last.fm username specified.")
		quit()

	if sys.argv[1] == '--all':
		with dataset.connect('sqlite:///last-fm.db') as db:
			sql = 'SELECT name as username FROM sqlite_master WHERE type=\'table\''
			usernames = [row['username'] for row in db.query(sql)]
	else:
		usernames = sys.argv[1:]

	for username in usernames:
		scr = Scraper(username)
		with dataset.connect('sqlite:///last-fm.db') as db:
			sql = 'SELECT COUNT(name) as count FROM sqlite_master WHERE type=\'table\' AND name=\'%s\'' % username
			exists = int(db.query(sql).next()['count'])
		if exists:
			scr.update_scrobbles()
		else:
			scr.get_all_scrobbles()