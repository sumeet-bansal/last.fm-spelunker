import dataset
from datetime import datetime
from nvd3 import stackedAreaChart

# chart properties
size = 2000
stream_limit = 0.75
artist_limit = 50
chartname = 'scrobble-stacked'
metric = 'artist_text'

# file properties
filename = chartname + '.html'

# gets all artists and their respective daily play counts
db = dataset.connect('sqlite:///last-fm.db')
total = db['scrobbles'].count()
sql = 'SELECT {0}, date_uts, count({0}) FROM scrobbles GROUP BY {0}, date_year, date_month HAVING count({0}) > 25'.format(metric)
result = db.query(sql)

streams = {}
for row in result:
	artist = row[metric]
	if artist not in streams:
		streams[artist] = [0 for i in range(12)]
	else:
		dt = datetime.fromtimestamp(int(row['date_uts']))
		streams[artist][int(dt.month)] = row['count(%s)' % metric]

chart = stackedAreaChart(name='stackedAreaChart', height=size, width=size)
extra_serie = {"tooltip": {"y_end": " scrobbles"}}
for artist, plays in streams.items():
	chart.add_serie(name=artist, y=plays, x=[i for i in range(12)])
chart.buildhtml()

# generates the HTML file
output = open(filename, 'w')
output.write(chart.htmlcontent)
output.close()