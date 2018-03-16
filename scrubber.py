# currently just renames albums with some variant of '(Explicit)' in their title and applies a SQL script
import dataset

# renames albums with 'Explicit' or other such variants in title
def rename_variants(username):
	with dataset.connect('sqlite:///last-fm.db') as db:

		# gets all distinct albums in database
		sql = 'SELECT DISTINCT album FROM %s' % username
		result = db.query(sql)
		albums = [str(row['album']).replace("'", "\\'") for row in result]

		# variations to screen for
		versions = [' (Explicit)', ' (Explicit Version)', ' (Edited)']
		valid = {}			# dict of albums that have normal and variant titles in database
		standalone = {}		# dict of albums that have only variant titles

		# iterates through all albums and checks for variant titles
		for album in albums:
			altnames = [album + version for version in versions]
			for altname in altnames:
				if altname in albums:
					if album not in valid:
						valid[album] = []
					valid[album].append(altname)
					albums[:] = [copy for copy in albums if copy != album]
		for album in albums:
			for version in versions:
				base = album[:-len(version)]
				if version in album and base not in valid:
					standalone[album.replace('\'', '\'\'')] = version

		# renames all albums with normal and variant titles to the normal title
		for album in valid:
			for alt in valid[album]:
				sql = 'UPDATE %s SET album = \'%s\' WHERE album = \'%s\'' % (username, album, alt)
				db.query(sql)

		# normalizes all albums with only variant titles
		for album in standalone:
			sql = 'UPDATE %s SET album = \'%s\' WHERE album = \'%s\'' % (username, album[:-len(standalone[album])], album)
			db.query(sql)

# applies SQL script
def apply_SQL_script(sql_script):
	with open(sql_script, 'r') as file:
		with dataset.connect('sqlite:///last-fm.db') as db:
			for command in file:
				db.query(command)

if __name__ == '__main__':

	try:
		user = sys.argv[1]
	except IndexError:
		print("[ERROR] No last.fm username specified.")
		quit()

	rename_variants(user)

	try:
		script = sys.argv[2]
		apply_SQL_script(script)
	except IndexError:
		pass
