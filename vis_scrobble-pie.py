import dataset
from nvd3 import pieChart

# chart properties
size = 1000
stream_limit = 0.75
artist_limit = 50
chartname = 'scrobble-pie'

# file properties
filename = chartname + '.html'

# gets all artists and their respective play counts in order of greatest count to least
db = dataset.connect('sqlite:///last-fm.db')
total = db['scrobbles'].count()
result = db.query('SELECT artist_text, count(artist_text) FROM scrobbles GROUP BY artist_text ORDER BY count(artist_text) DESC')
artists = []
streams = []
for row in result:
	artists.append(row['artist_text'])
	streams.append(int(row['count(artist_text)']))

# iterates through all artists and isolates the most significant (i.e. most listened to)
sig_artists = []
sig_streams = []
for artist, plays in zip(artists, streams):
	if sum(sig_streams) < total*stream_limit and len(sig_artists) < artist_limit:
		sig_artists.append(artist)
		sig_streams.append(plays)
sig_artists.append("Other")
sig_streams.append(total - sum(sig_streams))

# sets up the chart
chart = pieChart(name=chartname, color_category='category20c', height=size, width=size)
extra_serie = {"tooltip": {"y_start": "", "y_end": " scrobbles"}}
chart.add_serie(x=sig_artists, y=sig_streams, extra=extra_serie)
chart.buildhtml()

# generates the HTML file
output = open(filename, 'w')
output.write(chart.htmlcontent)
output.close()