var sqlite3 = require('sqlite3').verbose();
var fs = require('fs');
var args = process.argv.slice(2);

var streamlimit = args[0];
var artistlimit = args[1];

var result = [];
var other = 0, count = 0, total = 0;

var db = new sqlite3.Database('../last-fm.db', function() {
	db.serialize(function() {
		sql = 'SELECT COUNT(*) AS size FROM scrobbles';
		db.each(sql, function(err, row) {
			total = row.size * 1.0;
		}, function() {
			var sql_select = 'SELECT artist_text AS artist, count(artist_text) AS count FROM scrobbles';
			var sql_params = 'GROUP BY artist ORDER BY count DESC';
			var sql = sql_select + ' ' + sql_params;
			streamlimit = streamlimit * total;
			db.each(sql, function(err, row) {
				if (result.length < artistlimit && count < streamlimit) {
					obj = {};
					obj['label'] = row.artist;
					obj['value'] = row.count;
					result.push(obj);
					count += row.count;
				} else {
					other += row.count;
				}
			}, function() {
				obj = {};
				obj['label'] = 'Other';
				obj['value'] = other;
				result.push(obj);
				var json = JSON.stringify(result);
				fs.writeFile("data.json", json, 'utf8', function(err) {
				    if (err) {
				        console.log(err);
				    }
				});
			});
		});
	});
});

db.close();