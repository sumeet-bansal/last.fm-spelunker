import dataset
import processor
import scraper
import scrubber
import sys

from flask import Flask, render_template, Response, stream_with_context

app = Flask(__name__)

'''
try:
	user = sys.argv[1]
except IndexError:
	print("[ERROR] No last.fm username specified.")
	quit()

try:
	stream_limit = sys.argv[2]
except IndexError:
	print("[ERROR] No scrobble minimum specified.")
	quit()

try:
	int(stream_limit)
except ValueError:
	print("[ERROR] Scrobble minimum must be an integer.")
	quit()
'''

@app.route('/<user>/<stream_limit>')
def index(user, stream_limit):

	scr = scraper.Scraper(user)
	with dataset.connect('sqlite:///last-fm.db') as db:
		sql = 'SELECT COUNT(name) as count FROM sqlite_master WHERE type=\'table\' AND name=\'%s\'' % user
		exists = int(db.query(sql).next()['count'])
	if exists:
		scr.update_scrobbles()
	else:
		scr.get_all_scrobbles()

	print("Processing scrobble history...")
	scrubber.rename_variants(user)
	scrubber.apply_SQL_script('scrubscript.sql')
	sys.stdout.flush()
	print("Processed scrobble history.")

	sys.stdout.write("\rGenerating streamgraph data...")
	sys.stdout.flush()
	metric = 'artist'
	processor.process(user, metric, stream_limit)
	print("\rGenerated streamgraph data.   ")

	return render_template('streamgraph/index.html', user=user)
