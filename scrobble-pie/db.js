var sqlite3 = require('sqlite3').verbose();

var streamlimit = 0.75;
var artistlimit = 50;

var result = [];
var other = 0, count = 0, total = 0;

var db = new sqlite3.Database('../last-fm.db', function() {
	db.serialize(function() {
		sql = 'SELECT COUNT(*) AS size FROM scrobbles';
		db.each(sql, function(err, row) {
			total = row.size;
		}, function() {
			var sql_select = 'SELECT artist_text AS artist, count(artist_text) AS count FROM scrobbles';
			var sql_params = 'GROUP BY artist ORDER BY count DESC';
			var sql = sql_select + ' ' + sql_params;
			db.each(sql, function(err, row) {
				if (result.length < artistlimit && count/total < streamlimit) {
					obj = {};
					obj['label'] = row.artist;
					obj['value'] = row.count;
					result.push(obj);
				} else {
					other += row.count;
				}
			}, function() {
				obj = {};
				obj['label'] = 'Other';
				obj['value'] = other;
				result.push(obj);
			});
		});
	});
});

db.close();