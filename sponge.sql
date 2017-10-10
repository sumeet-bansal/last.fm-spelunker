/* Cleans some scrobbling data. */
UPDATE scrobbles SET artist_text = 'Anderson .Paak' WHERE artist_text LIKE 'Anderson%Paak%';
DELETE FROM artists WHERE name != 'Anderson .Paak' AND name LIKE 'Anderson%Paak%';
UPDATE scrobbles SET artist_text = 'Tech N9ne' WHERE artist_text = 'Tech N9ne feat.%';
UPDATE scrobbles SET artist_mbid = 'dde3d9b1-0e44-48bc-b0c9-d739b3570000' WHERE artist_text = 'Tech N9ne';
UPDATE scrobbles SET album_mbid = '62431f82-0e9b-41f2-9a40-c0a22eaa0e27' WHERE artist_text = 'Tech N9ne' AND album_text = 'Something Else';
DELETE FROM artists WHERE name != 'Tech N9ne' AND name LIKE 'Tech N9ne%';