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

	scr = scraper.Scraper(user)
	with dataset.connect('sqlite:///last-fm.db') as db:
		sql = 'SELECT COUNT(name) as count FROM sqlite_master WHERE type=\'table\' AND name=\'%s\'' % user
		exists = int(db.query(sql).next()['count'])
	if exists:
		scr.update_scrobbles()
	else:
		scr.get_all_scrobbles()
