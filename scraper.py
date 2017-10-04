# partially adapted from Matt Lewis's scraper

import requests
import sys
import collections
import dataset
from datetime import datetime

# constants
USER = 'sbansal21'
API_KEY = '2bf228a2ce0167b5b857dd53ea6f39c1'
ROOT_URL = 'https://ws.audioscrobbler.com/2.0/'
PER_PAGE = 200
RECENT_URL = ROOT_URL + '/?method=user.getrecenttracks&user=' + USER + '&api_key=' + API_KEY + '&format=json&page=%s&limit=%s'

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

# processes scrobble for SQL insertion
def process_scrobble(scrobble):

	# removes unnecessary attributes
	props = ['image', 'streamable', 'url', '@attr']
	for prop in props:
		if prop in scrobble:
			del scrobble[prop]

	# flattens the track JSON
	flattened = flatten(scrobble)
	for key, val in flattened.items():
		if val == '':
			flattened[key] = None

	if 'date_uts' in flattened:
		dt = datetime.fromtimestamp(int(flattened['date_uts']))
		flattened['date_year'] = dt.year
		flattened['date_month'] = dt.month
		flattened['date_date'] = dt.day
		flattened['date_hour'] = dt.hour
	else:
		flattened = None
	return flattened

# iterates through, processes, and inserts each scrobble
with dataset.connect('sqlite:///last-fm.db') as db:
	for scrobble in scrobbles:
		processed = process_scrobble(scrobble)
		if processed is not None:
			db['scrobbles'].insert(processed)