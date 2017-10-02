# partially adapted from Matt Lewis's scraper

import requests
import collections
import dataset

# constants
USER = 'sbansal21'
API_KEY = '2bf228a2ce0167b5b857dd53ea6f39c1'
ROOT_URL = 'https://ws.audioscrobbler.com/2.0/'
PER_PAGE = 200
API_URL = ROOT_URL + '/?method=user.getrecenttracks&user=' + USER + '&api_key=' + API_KEY + '&format=json&page=%s&limit=%s'

# gets total num of pages
resp = requests.get(API_URL % (1, PER_PAGE)).json()
totalPages = int(resp['recenttracks']['@attr']['totalPages'])

# adds all pages to a list
pages = []
for page in range(1, totalPages + 1):
	pages.append(requests.get(API_URL % (page, PER_PAGE)).json())

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

# processes track for SQL insertion
def process_track(track):
	if 'image' in track:
		del track['image']
	if 'streamable' in track:
		del track['streamable']
	if 'url' in track:
		del track['url']
	flattened = flatten(track)
	for key, val in flattened.items():
		if val == '':
			flattened[key] = None
	return flattened

# iterates through, processes, and inserts each scrobble
with dataset.connect('sqlite:///last-fm.db') as db:
	for page in pages:
		for track in page['recenttracks']['track']:
			db['scrobbles'].insert(process_track(track))