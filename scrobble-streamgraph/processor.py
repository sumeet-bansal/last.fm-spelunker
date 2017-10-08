import sys
import dataset
from datetime import datetime

# chart properties
size = 2000
stream_limit = sys.argv[1]
metric = 'artist_text'

# gets all artists and their respective daily play counts
db = dataset.connect('sqlite:///../last-fm.db')
total = db['scrobbles'].count()
sql = 'SELECT {0}, date_uts, count({0}) FROM scrobbles GROUP BY {0}, date_year, date_month HAVING count({0}) > {1}'.format(metric, stream_limit)
result = db.query(sql)

streams = {}
for row in result:
	artist = row[metric]
	if artist not in streams:
		streams[artist] = [0 for i in range(12)]
	dt = datetime.fromtimestamp(int(row['date_uts']))
	streams[artist][int(dt.month)] = row['count(%s)' % metric]

with open('stream-data.csv', 'w') as csv:
	csv.write('key,value,date\n')
	for i in range(1, 12):
		for artist in streams:
			csv.write('%s,%s,%s\n' % (artist.replace(',', ''), streams[artist][i], '%s/01/17' % str(i)))