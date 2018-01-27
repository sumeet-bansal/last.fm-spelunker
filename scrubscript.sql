/* Cleans some scrobbling data, sorted in order of artist. */

/* 6LACK */
UPDATE scrobbles SET name = 'PRBLMS' WHERE name = 'PRBLMS - Final';

/* A Tribe Called Quest */
UPDATE scrobbles SET album_text = 'Midnight Marauders' WHERE name = 'Electric Relaxation';

/* A$AP Ferg */
UPDATE scrobbles SET album_text = 'Still Striving' WHERE artist_text = 'A$AP Ferg' AND album_text = 'East Coast REMIX';

/* A$AP Mob */
UPDATE scrobbles SET album_text = 'Cozy Tapes: Vol. 1 Friends' WHERE album_text = 'Cozy Tapes: Vol. 1 Friends -';
UPDATE scrobbles SET album_text = 'Cozy Tapes Vol. 2: Too Cozy' WHERE artist_text = 'A$AP Mob' AND album_text = 'RAF';

/* Amine */
UPDATE scrobbles SET album_text = 'Good for You' WHERE name = 'Caroline' AND album_text = 'Caroline';

/* Anderson .Paak */
UPDATE scrobbles SET artist_text = 'Anderson .Paak' WHERE artist_text LIKE 'Anderson%Paak%' OR album_text = 'The Anderson .Paak EP';
UPDATE scrobbles SET album_text = 'Malibu' WHERE album_text = 'MALIBU';

/* Big Boi */
UPDATE scrobbles SET album_text = 'Sir Lucious Left Foot...The Son of Chico Dusty' WHERE album_text = 'Sir Lucious Left Foot...The Son Of Chico Dusty';

/* Big Grams */
UPDATE scrobbles SET album_text = 'Big Grams' WHERE artist_text = 'Big Grams' AND name = 'Fell in the Sun';

/* Big K.R.I.T. */
UPDATE scrobbles SET album_text = 'Cadillactica (Deluxe)' WHERE album_text = 'Cadillactica';

/* Big Sean */
UPDATE scrobbles SET album_text = 'I Decided.' WHERE artist_text = 'Big Sean' AND album_text = 'Bounce Back';

/* Biz Markie */
UPDATE scrobbles SET album_text = 'The Biz Never Sleeps' WHERE artist_text = 'Biz Markie' AND name = 'Just A Friend';

/* Blue in Green */
UPDATE scrobbles SET album_text = 'The Break of Dawn' WHERE album_text IN ('The Break of Dawn (Remastered)', 'The Break OF Dawn');

/* Boyz II Men */
UPDATE scrobbles SET album_text = 'Cooleyhighharmony' WHERE album_text = 'Cooleyhighharmony (Bonus Tracks Version)';

/* Burna Boy */
UPDATE scrobbles SET album_text = 'Redemption' WHERE artist_text = 'Burna Boy' AND name = 'Pree Me';

/* Calvin Harris */
UPDATE scrobbles SET album_text = 'Funk Wav Bounces Vol.1' WHERE name = 'Slide' and album_text = 'Slide';

/* Childish Gambino */
UPDATE scrobbles SET album_text = 'Kauai' WHERE album_text = 'Kauai EP';
UPDATE scrobbles SET album_text = '"Awaken, My Love!"' WHERE album_text IN ('Redbone', 'Me and Your Mama');

/* Cole King */
UPDATE scrobbles SET album_text = 'Melancholy Red' WHERE album_text = 'Nothin Changed (feat. Tunji Ige)';

/* Common */
UPDATE scrobbles SET album_text = 'Black America Again' WHERE artist_text = 'Common' AND album_text = 'Letter To The Free';
UPDATE scrobbles SET album_text = 'Like Water for Chocolate' WHERE artist_text = 'Common' AND name = 'The Light';

/* Consequence */
UPDATE scrobbles SET album_text = 'The Cons, Volume 5: Refuse to Die' WHERE artist_text = 'Consequence' AND name = 'Don''t Forget ''Em (Remix) [feat. Kanye West]';

/* D.R.A.M. */
UPDATE scrobbles SET album_text = 'Big Baby D.R.A.M.' WHERE album_text IN ('Cash Machine - Single', 'Gilligan (feat. A$AP Rocky & Juicy J)');

/* Daniel Caesar */
UPDATE scrobbles SET album_text = 'Freudian' WHERE artist_text = 'Daniel Caesar' AND album_text LIKE 'Get You%';

/* Denzel Curry */
UPDATE scrobbles SET album_text = '32 Zel / Planet Shrooms' WHERE artist_text = 'Denzel Curry' AND name = 'Ultimate';

/* Desiigner */
UPDATE scrobbles SET album_text = 'New English' WHERE name IN ('Tiimmy Turner', 'Panda') AND artist_text = 'Desiigner';

/* DJ Khaled */
UPDATE scrobbles SET album_text = 'Victory' WHERE album_text = 'All I Do Is Win (feat. T-Pain, Ludacris, Snoop Dogg & Rick Ross)';
UPDATE scrobbles SET album_text = 'Grateful' WHERE artist_text = 'DJ Khaled' AND album_text = 'I''m the One';

/* DMX */
UPDATE scrobbles SET album_text = 'Grand Champ' WHERE name = 'Where The Hood At';
UPDATE scrobbles SET album_text = 'Cradle 2 the Grave' WHERE artist_text = 'DMX' AND name = 'X Gon'' Give It To Ya';

/* Drake */
UPDATE scrobbles SET album_text = 'More Than a Game' WHERE album_text = 'More Than A Game';
UPDATE scrobbles SET album_text = 'Nothing Was the Same' WHERE album_text = 'Nothing Was The Same (Deluxe)';
UPDATE scrobbles SET album_text = 'So Far Gone' WHERE artist_text = 'Drake' AND name = 'Best I Ever Had';

/* EarthGang */
UPDATE scrobbles SET album_text = 'Take Care (Deluxe)' WHERE album_text = 'Take Care (Explicit Deluxe)';
UPDATE scrobbles SET album_text = 'Robots - EP' WHERE artist_text = 'EarthGang' AND name IN ('Flickted', 'So Many Feelings', 'Underwater (feat. Sir)', 'Robots', 'Artificial', 'Lyfted Intro');
UPDATE scrobbles SET album_text = 'Curtain Call (Deluxe)' WHERE album_text = 'Curtain Call (Deluxe Explicit)';

/* Earl Sweatshirt */
UPDATE scrobbles SET album_text = 'Doris' WHERE artist_text = 'Earl Sweatshirt' AND name = 'Hive';

/* Fetty Wap */
UPDATE scrobbles SET album_text = 'Fetty Wap (Deluxe)' WHERE album_text = '679 (feat. Remy Boyz)';

/* Flying Lotus */
UPDATE scrobbles SET album_text = 'You''re Dead!' WHERE album_text = 'You''re Dead! (Deluxe)';
UPDATE scrobbles SET name = 'Never Catch Me', album_text = 'You''re Dead!' WHERE name = 'Never Catch Me (feat. Kendrick Lamar)';

/* Fort Minor */
UPDATE scrobbles SET name = 'Remember the Name', album_text = 'Petrified/Remember The Name' WHERE name = 'Remember the Name (feat. Styles of Beyond)';

/* Frank Ocean */
UPDATE scrobbles SET name = 'Nights' WHERE artist_text = 'Frank Ocean' AND name = 'nights';
UPDATE scrobbles SET name = 'Close to You' WHERE artist_text = 'Frank Ocean' AND name = 'close to you';
UPDATE scrobbles SET name = 'Self Control' WHERE artist_text = 'Frank Ocean' AND name = 'self control';
UPDATE scrobbles SET name = 'Solo (Reprise)' WHERE artist_text = 'Frank Ocean' AND name = 'solo (reprise)';
UPDATE scrobbles SET name = 'Close to You' WHERE artist_text = 'Frank Ocean' AND name = 'close to you';

/* Gil-Scott Heron */
UPDATE scrobbles SET album_text = 'Pieces of a Man' WHERE name = 'The Revolution Will Not Be Televised';

/* Ginuwine */
UPDATE scrobbles SET album_text = 'Ginuwine...the Bachelor' WHERE artist_text = 'Ginuwine' AND name = 'Pony';

/* GoldLink */
UPDATE scrobbles SET album_text = 'At What Cost' WHERE artist_text = 'GoldLink' AND album_text = 'Crew';

/* Goodie Mob */
UPDATE scrobbles SET album_text = 'Soul Food' WHERE artist_text = 'Goodie Mob' AND name = 'Cell Therapy';

/* Gucci Mane */
UPDATE scrobbles SET album_text = 'Mr. Davis' WHERE album_text = 'I Get The Bag (feat. Migos)';

/* Jalen Santoy */
UPDATE scrobbles SET album_text = 'Charlie Eastern' WHERE artist_text = 'Jalen Santoy' AND name = 'Foreplay';

/* Jay IDK */
UPDATE scrobbles SET artist_text = 'Jay IDK' WHERE artist_text = 'Jay idk';

/* Jeezy */
UPDATE scrobbles SET album_text = 'Trap or Die 3' WHERE artist_text = 'Jeezy' AND name = 'Goldmine';

/* Jidenna */
UPDATE scrobbles SET album_text = 'The Chief' WHERE artist_text = 'Jidenna' AND name = 'Classic Man';

/* Joey Bada$$ */
UPDATE scrobbles SET album_text = 'ALL-AMERIKKKAN BADA$$' WHERE artist_text = 'Joey Bada$$' AND album_text = 'Devastated';

/* Joey Purp */
UPDATE scrobbles SET album_text = 'iiiDrops' WHERE album_text = 'Girls @ (feat. Chance the Rapper)';

/* Kamaiyah */
UPDATE scrobbles SET album_text = 'A GOOD NIGHT IN THE GHETTO' WHERE album_text = 'How Does It Feel';

/* KAYTRANADA */
UPDATE scrobbles SET album_text = '99.9%' WHERE album_text = 'GLOWED UP';
UPDATE scrobbles SET artist_text = 'KAYTRANADA' WHERE artist_text = 'Kaytranada';

/* Kevin Abstract */
UPDATE scrobbles SET album_text = 'American Boyfriend: A Suburban Love Story' WHERE artist_text = 'Kevin Abstract' AND album_text = 'Empty - Single';

/* Khalid */
UPDATE scrobbles SET album_text = 'American Teen' WHERE album_text IN ('Location', 'Let''s Go');

/* Lil Uzi Vert */
UPDATE scrobbles SET album_text = 'Luv Is Rage 2' WHERE album_text = 'XO TOUR Llif3';

/* Lil Wayne */
UPDATE scrobbles SET album_text = 'Tha Carter IV (Deluxe)' WHERE album_text IN ('Tha Carter IV (Explicit Deluxe Version)', 'Tha Carter IV (Edited Deluxe Version)');
UPDATE scrobbles SET album_text = 'I Am Not A Human Being' WHERE album_text = 'I Am Not a Human Being';

/* Lorde */
UPDATE scrobbles SET name = 'Flicker (Kanye West Rework)', album_text = 'Flicker (Kanye West Rework)' WHERE artist_text = 'Lorde' AND name LIKE 'Flicker%';

/* Kanye West */
UPDATE scrobbles SET name = 'I''ll Fly Away' WHERE name = 'I''ll Fly Away - Album Version (Edited)';
UPDATE scrobbles SET name = 'Two Words' WHERE name = 'Two Words - Album Version (Edited)';
UPDATE scrobbles SET artist_text = 'Kanye West' WHERE name = 'Slow Jamz';
UPDATE scrobbles SET name = 'Blame Game' WHERE name = 'Blame Game (feat. John Legend)';
UPDATE scrobbles SET name = 'Devil In A New Dress' WHERE name = 'Devil in a New Dress (feat. Rick Ross)';
UPDATE scrobbles SET name = 'Lost In The World' WHERE name = 'Lost in the World (feat. Bon Iver)';
UPDATE scrobbles SET name = 'Runaway' WHERE name = 'Runaway (feat. Pusha T)';

/* Kendrick Lamar */
UPDATE scrobbles SET album_text = 'good kid, m.A.A.d city (Deluxe)' WHERE album_text = 'good kid, m.A.A.d city';
UPDATE scrobbles SET album_text = 'good kid, m.A.A.d city (Deluxe)' WHERE album_text = 'Swimming Pools (Drank)';
UPDATE scrobbles SET album_text = 'DAMN.' WHERE artist_text = 'Kendrick Lamar' AND album_text = 'HUMBLE.';

/* Kid CuDi */
UPDATE scrobbles SET album_text = 'Man on the Moon II: The Legend of Mr. Rager' WHERE album_text = 'Man On The Moon II: The Legend Of Mr. Rager';
UPDATE scrobbles SET album_text = 'Man On The Moon: The End Of Day (Deluxe)' WHERE album_text = 'Man On The Moon: The End Of Day (Deluxe Explicit Version)';

/* Marvin Gaye */
UPDATE scrobbles SET name = 'I Heard It Through the Grapevine', album_text = 'The Big Chill' WHERE name = 'I Heard It Through The Grapevine - Single Version (Mono)';

/* Masego */
UPDATE scrobbles SET artist_text = 'Masego' WHERE artist_text = 'masego';

/* Mura Masa */
UPDATE scrobbles SET name = 'Love$ick (feat. A$AP Rocky)' WHERE artist_text = 'Mura Masa' AND name = 'Love$ick';
UPDATE scrobbles SET album_text = 'MURA MASA' WHERE artist_text = 'Mura Masa' AND name IN ('Love$ick (feat. A$AP Rocky)', '1 Night');

/* Muse */
UPDATE scrobbles SET album_text = 'Black Holes and Revelations' WHERE album_text = 'Black Holes And Revelations (Updated 09 version)';
UPDATE scrobbles SET album_text = 'Origin of Symmetry' WHERE album_text = 'Origin Of Symmetry (New 09 Version)';

/* Nas */
UPDATE scrobbles SET album_text = 'Illmatic' WHERE album_text = 'Illmatic XX';

/* Noname */
UPDATE scrobbles SET artist_text = 'Noname' WHERE artist_text = 'NoName';

/* NxWorries */
UPDATE scrobbles SET album_text = 'Yes Lawd!' WHERE album_text IN ('Get Bigger / Do U Luv', 'Lyk Dis');

/* Otis Redding */
UPDATE scrobbles SET album_text = 'Pain in My Heart' WHERE album_text IN ('Pain In My Heart (US Release)', 'Pain In My Heart');
UPDATE scrobbles SET album_text = 'Otis Blue' WHERE artist_text = 'Otis Redding' AND album_text LIKE 'Otis Blue%';
UPDATE scrobbles SET name = 'My Girl' WHERE name = 'My Girl - Remastered Mono' AND album_text = 'Otis Blue';

/* Post Malone */
UPDATE scrobbles SET album_text = 'Stoney (Deluxe)' WHERE album_text = 'Deja Vu' AND artist_text = 'Post Malone';

/* Rapsody */
UPDATE scrobbles SET album_text = 'Beauty And The Beast (Deluxe Edition)' WHERE album_text = 'Beauty And The Beast - EP';

/* Russ */
UPDATE scrobbles SET album_text = 'There''s Really A Wolf' WHERE album_text = 'What They Want';

/* Sam Cooke */
UPDATE scrobbles SET album_text = 'Mr. Soul' WHERE name = 'Nothing Can Change This Love';

/* Scarface */
UPDATE scrobbles SET album_text = 'The Fix' WHERE artist_text = 'Scarface' AND name = 'On My Block';

/* ScHoolboy Q */
UPDATE scrobbles SET album_text = 'Setbacks' WHERE album_text = 'SetBacks';

/* Smino */
UPDATE scrobbles SET album_text = 'blkswn' WHERE artist_text = 'Smino' AND album_text = 'Anita';

/* Snakehips */
UPDATE scrobbles SET album_text = 'All My Friends - EP' WHERE album_text = 'All My Friends';

/* SZA */
UPDATE scrobbles SET album_text = 'CTRL' WHERE artist_text = 'SZA' AND album_text = 'Love Galore';

/* Tech N9ne */
UPDATE scrobbles SET artist_text = 'Tech N9ne' WHERE artist_text = 'Tech N9ne feat.%';

/* theMIND */
UPDATE scrobbles SET artist_text = 'theMIND' WHERE artist_text = 'themind';
UPDATE scrobbles SET album_text = 'Summer Camp' WHERE artist_text = 'theMIND' AND name = 'Pale Rose';

/* The O'My's */
UPDATE scrobbles SET artist_text = 'The O''My''s' WHERE artist_text = 'The O''my''s';

/* Topaz Jones */
UPDATE scrobbles SET name = 'Powerball', album_text = 'Arcade' WHERE artist_text = 'Topaz Jones' AND name = 'Powerball';

/* UGK */
UPDATE scrobbles SET album_text = 'Underground Kingz' WHERE name = 'Int''l Players Anthem (I Choose You)';
UPDATE scrobbles SET album_text = 'Super Tight' WHERE artist_text = 'UGK' AND name = 'Front, Back & Side to Side';

/* Vince Staples */
UPDATE scrobbles SET album_text = 'Big Fish Theory' WHERE album_text = 'Big Fish';

/* XXXTentacion */
UPDATE scrobbles SET artist_text = 'XXXTentacion' WHERE artist_text = 'xxxtentacion';

/* YG */
UPDATE scrobbles SET album_text = 'My Krazy Life' WHERE artist_text = 'YG' AND album_text = 'My Krazy Life (Deluxe)';

/* YGTUT */
UPDATE scrobbles SET artist_text = 'YGTUT' WHERE artist_text = 'ygtut';

/* Young Thug */
UPDATE scrobbles SET name = 'Pick Up the Phone (feat. Quavo)', album_text = 'Jeffery' WHERE name LIKE 'Pick Up the Phone%';
UPDATE scrobbles SET album_text = 'Jeffery' WHERE artist_text = 'Young Thug' AND album_text = 'No, My Name is JEFFERY';

/* SQL query for scrobbles per album */
SELECT artist_text, album_text, COUNT(*) FROM scrobbles GROUP BY album_text HAVING COUNT(*) > 0 ORDER BY artist_text, album_text, COUNT(*) DESC