# partially adapted from Matt Lewis's scraper

import requests
import sys
import collections
import dataset
from datetime import datetime

# constants
try:
	USER = sys.argv[1]
except IndexError:
	print("[ERROR] No last.fm username specified.")
	quit()
API_KEY = '2bf228a2ce0167b5b857dd53ea6f39c1'
ROOT_URL = 'https://ws.audioscrobbler.com/2.0/'
PER_PAGE = 200
RECENT_URL = ROOT_URL + '/?method=user.getrecenttracks&user=' + USER + '&api_key=' + API_KEY + '&format=json&page=%s&limit=%s'
ARTIST_URL = ROOT_URL + '/?method=artist.getinfo&api_key=' + API_KEY + '&artist=%s&format=json'

# flattens the JSON into a uniform depth (i.e. a series of keys and non-nested values)
# modified from http://stackoverflow.com/a/6027615/254187 to strip pound symbols
def flatten(d, parent_key=''):
	items = []
	for k, v in d.items():
		new_key = parent_key + '_' + k if parent_key else k
		if isinstance(v, collections.MutableMapping):
			items.extend(flatten(v, new_key).items())
		else:
			new_key = new_key.replace('#', '')
			items.append((new_key, v))
	return dict(items)

# removes all matching properties in the `props` list from the json object
def clean(json, props):
	for prop in props:
		if prop in json:
			del json[prop]
	return json

# processes scrobble for SQL insertion
def process_scrobble(scrobble):

	# removes unnecessary attributes
	props = ['image', 'streamable', 'url', '@attr']
	scrobble = clean(scrobble, props)

	# flattens the track JSON
	flattened = flatten(scrobble)
	for key, val in flattened.items():
		if val == '':
			flattened[key] = None

	if 'date_uts' in flattened:
		flattened['date_uts'] = int(flattened['date_uts'])
		dt = datetime.fromtimestamp(flattened['date_uts'])
		flattened['date_year'] = dt.year
		flattened['date_month'] = dt.month
		flattened['date_date'] = dt.day
		flattened['date_hour'] = dt.hour
	else:
		flattened = None
	return flattened

# processes artist for SQL insertion
def process_artist(artist):

	# removes unnecessary attributes
	props = ['ontour', 'image', 'streamable', 'url', 'bio']
	artist = clean(artist, props)

	# compresses related artists to a single value
	related = None
	if 'similar' in artist:
		related = []
		for relatedArtist in artist['similar']['artist']:
			relatedArtist = process_artist(relatedArtist)
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

def scrobbles():
	# gets total num of pages in last.fm user history
	resp = requests.get(RECENT_URL % (1, PER_PAGE)).json()
	TOTAL_PAGES = int(resp['recenttracks']['@attr']['totalPages'])

	# adds all scrobbles to a list
	scrobbles = []
	for page in range(1, TOTAL_PAGES + 1):
		scrobbles.extend(requests.get(RECENT_URL % (page, PER_PAGE)).json()['recenttracks']['track'])
		sys.stdout.write("\rRetrieving scrobble history...\t" + str(page) + " of " + str(TOTAL_PAGES))
		sys.stdout.flush()
	print("\rRetrieved scrobble history.")

	# iterates through, processes, and inserts each scrobble
	with dataset.connect('sqlite:///last-fm.db') as db:
		for scrobble in scrobbles:
			processed = process_scrobble(scrobble)
			if processed is not None:
				db['scrobbles'].insert(processed)

def artists():
	# grabs and inserts info for all distinct scrobbled artists
	with dataset.connect('sqlite:///last-fm.db') as db:
		errors = []
		result = db['scrobbles'].distinct('artist_text')
		sql = 'SELECT COUNT(DISTINCT artist_text) AS count FROM scrobbles'
		totalArtists = int(db.query(sql).next()['count'])
		for index, row in enumerate(result):
			artist = requests.get(ARTIST_URL % row['artist_text']).json()
			sys.stdout.write("\rRetrieving artist info...\t%s of %s" % (str(index), str(totalArtists)))
			sys.stdout.flush()
			try:
				processed = process_artist(artist['artist'])
				db['artists'].insert(processed)
			except KeyError:
				errors.append(row['artist_text'])
		sys.stdout.write("\rRetrieving artist info...\t{0} of {0}".format(str(totalArtists)))
		sys.stdout.flush()
		print("\rRetrieved artist info.")
		if errors:
			print("\nThe following artists could not be located within the last.fm database: \n  " + "\n  ".join(errors))

if __name__ == "__main__":
	scrobbles()
	artists()