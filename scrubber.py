# currently just renames albums with some variant of '(Explicit)' in their title
import dataset

# constants
script = 'scrubscript.sql'

def renvariant():
	with dataset.connect('sqlite:///last-fm.db') as db:

		# gets all distinct albums in database
		sql = 'SELECT DISTINCT album_text FROM scrobbles'
		result = db.query(sql)
		albums = [str(row['album_text']) for row in result]

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
			mbid = db.query('SELECT album_mbid FROM scrobbles WHERE album_text = \'%s\'' % album).next()['album_mbid']
			if mbid is None:
				for alt in valid[album]:
					sql = 'UPDATE scrobbles SET album_text = \'%s\', album_mbid = NULL WHERE album_text = \'%s\'' % (album, alt)
					db.query(sql)
			else:
				for alt in valid[album]:
					sql = 'UPDATE scrobbles SET album_text = \'%s\', album_mbid = \'%s\' WHERE album_text = \'%s\'' % (album, mbid, alt)
					db.query(sql)

		# normalizes all albums with only variant titles
		for album in standalone:
			sql = 'UPDATE scrobbles SET album_text = \'%s\' WHERE album_text = \'%s\'' % (album[:-len(standalone[album])], album)
			db.query(sql)

def dotslash():
	with open(script, 'r') as file:
		with dataset.connect('sqlite:///last-fm.db') as db:
			for command in file:
				db.query(command)

if __name__ == "__main__":
	renvariant()
	dotslash()