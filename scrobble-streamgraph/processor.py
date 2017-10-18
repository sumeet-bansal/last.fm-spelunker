import sys
import dataset
from datetime import datetime
from dateutil.rrule import rrule, MONTHLY
from dateutil.relativedelta import relativedelta

# chart properties
size = 2000
stream_limit = sys.argv[1]
metric = 'artist_text'

# gets all artists and their respective daily play counts
db = dataset.connect('sqlite:///../last-fm.db')
total = db['scrobbles'].count()
timeframe = db.query('SELECT MIN(date_uts), MAX(date_uts) FROM scrobbles').next()
mintime = datetime.fromtimestamp(timeframe['MIN(date_uts)'])
maxtime = datetime.fromtimestamp(timeframe['MAX(date_uts)'])
timeframe = len([dt for dt in rrule(MONTHLY, dtstart=mintime, until=maxtime)])
sql = 'SELECT DISTINCT {0} FROM scrobbles GROUP BY {0}, date_year, date_month HAVING count({0}) > {1}'.format(metric, stream_limit)
result = db.query(sql)

artists = []
for row in result:
	artists.append(row[metric])
artists = '(%s)' % str(artists)[1:-1]

sql = 'SELECT {0}, date_uts, count({0}) FROM scrobbles GROUP BY {0}, date_year, date_month HAVING {0} IN {1}'.format(metric, artists)
result = db.query(sql)

streams = {}
for row in result:
	artist = row[metric]
	if artist not in streams:
		streams[artist] = [0 for i in range(timeframe)]
	current = datetime.fromtimestamp(int(row['date_uts']))
	elapsed = len([dt for dt in rrule(MONTHLY, dtstart=mintime, until=current)])
	if streams[artist][elapsed - 1] == 0:
		streams[artist][elapsed - 1] = row['count(%s)' % metric]
	else:
		streams[artist][elapsed] = row['count(%s)' % metric]

with open('stream-data.csv', 'w') as csv:
	csv.write('key,value,date\n')
	for i in range(timeframe):
		current = mintime + relativedelta(months=i)
		for artist in streams:
			try:
				csv.write('%s,%s,%s\n' % (artist.replace(',', ''), streams[artist][i], '%s/01/%s' % (current.month, str(current.year)[2:])))
			except UnicodeEncodeError:
				pass