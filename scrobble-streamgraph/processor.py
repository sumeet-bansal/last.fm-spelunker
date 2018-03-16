import sys
import dataset
from datetime import datetime
from dateutil.rrule import rrule, MONTHLY
from dateutil.relativedelta import relativedelta

def process(username, metric, stream_limit):
	# gets all artists and their respective daily play counts
	db = dataset.connect('sqlite:///last-fm.db')
	total = db[username].count()
	timeframe = db.query('SELECT MIN(timestamp), MAX(timestamp) FROM %s' % username).next()
	mintime = datetime.fromtimestamp(timeframe['MIN(timestamp)'])
	maxtime = datetime.fromtimestamp(timeframe['MAX(timestamp)'])
	timeframe = len([dt for dt in rrule(MONTHLY, dtstart=mintime, until=maxtime)])
	sql = 'SELECT DISTINCT {0} FROM {1} GROUP BY {0}, play_year, play_month HAVING count({0}) > {2}'.format(metric, username, stream_limit)
	result = db.query(sql)

	artists = []
	for row in result:
		artists.append(row[metric])
	artists = '(%s)' % str(artists)[1:-1]

	sql = 'SELECT {0}, timestamp, count({0}) FROM {1} GROUP BY {0}, play_year, play_month HAVING {0} IN {2}'.format(metric, username, artists)
	result = db.query(sql)

	streams = {}
	for row in result:
		artist = row[metric]
		if artist not in streams:
			streams[artist] = [0 for i in range(timeframe)]
		current = datetime.fromtimestamp(int(row['timestamp']))
		elapsed = len([dt for dt in rrule(MONTHLY, dtstart=mintime, until=current)])
		if streams[artist][elapsed - 1] == 0:
			streams[artist][elapsed - 1] = row['count(%s)' % metric]
		else:
			streams[artist][elapsed] = row['count(%s)' % metric]

	if len(sys.argv) > 2 and sys.argv[2] == '--other':
		sql = 'SELECT COUNT(*) AS count, timestamp FROM {0} WHERE {1} NOT IN {2} GROUP BY play_year, play_month'.format(username, metric, artists)
		result = db.query(sql)
		streams['other'] = [0 for i in range(timeframe)]
		for row in result:
			current = datetime.fromtimestamp(int(row['timestamp']))
			elapsed = len([dt for dt in rrule(MONTHLY, dtstart=mintime, until=current)])
			if streams['other'][elapsed - 1] == 0:
				streams['other'][elapsed - 1] = row['count']
			elif elapsed != len(streams):
				streams['other'][elapsed] = row['count']

	with open('scrobble-streamgraph/stream-data.csv', 'w') as csv:
		csv.write('key,value,date\n')
		for i in range(timeframe):
			current = mintime + relativedelta(months=i)
			for artist in streams:
				try:
					csv.write('%s,%s,%s\n' % (artist.replace(',', ''), streams[artist][i], '%s/01/%s' % (current.month, str(current.year)[2:])))
				except UnicodeEncodeError:
					pass
