import scraper
import scrubber
import dataset

import sys
sys.path.append('./scrobble-streamgraph/')
import processor

if __name__ == '__main__':

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

	scr = scraper.Scraper(user)
	with dataset.connect('sqlite:///last-fm.db') as db:
		sql = 'SELECT COUNT(name) as count FROM sqlite_master WHERE type=\'table\' AND name=\'%s\'' % user
		exists = int(db.query(sql).next()['count'])
	if exists:
		scr.update_scrobbles()
	else:
		scr.get_all_scrobbles()

	sys.stdout.write("\rProcessing scrobble history...")
	scrubber.rename_variants(user)
	scrubber.apply_SQL_script('scrubscript.sql')
	sys.stdout.flush()
	sys.stdout.write("\rProcessed scrobble history.")
	sys.stdout.flush()
	print()

	sys.stdout.write("\rGenerating streamgraph data...")
	sys.stdout.flush()
	metric = 'artist'
	processor.process(user, metric, stream_limit)
	sys.stdout.write("\rGenerated streamgraph data.")
	sys.stdout.flush()
