/* Cleans some scrobbling data, sorted in order of artist. */

/* 6LACK */
UPDATE sbansal21 SET track = 'PRBLMS' WHERE track = 'PRBLMS - Final';

/* A Tribe Called Quest */
UPDATE sbansal21 SET album = 'Midnight Marauders' WHERE track = 'Electric Relaxation';

/* A$AP Ferg */
UPDATE sbansal21 SET album = 'Still Striving' WHERE artist = 'A$AP Ferg' AND album = 'East Coast REMIX';

/* A$AP Mob */
UPDATE sbansal21 SET album = 'Cozy Tapes: Vol. 1 Friends' WHERE album = 'Cozy Tapes: Vol. 1 Friends -';
UPDATE sbansal21 SET album = 'Cozy Tapes Vol. 2: Too Cozy' WHERE artist = 'A$AP Mob' AND album = 'RAF';

/* Amine */
UPDATE sbansal21 SET album = 'Good for You' WHERE track = 'Caroline' AND album = 'Caroline';

/* Anderson .Paak */
UPDATE sbansal21 SET artist = 'Anderson .Paak' WHERE artist LIKE 'Anderson%Paak%' OR album = 'The Anderson .Paak EP';
UPDATE sbansal21 SET album = 'Malibu' WHERE album = 'MALIBU';

/* Big Boi */
UPDATE sbansal21 SET album = 'Sir Lucious Left Foot...The Son of Chico Dusty' WHERE album = 'Sir Lucious Left Foot...The Son Of Chico Dusty';

/* Big Grams */
UPDATE sbansal21 SET album = 'Big Grams' WHERE artist = 'Big Grams' AND track = 'Fell in the Sun';

/* Big K.R.I.T. */
UPDATE sbansal21 SET album = 'Cadillactica (Deluxe)' WHERE album = 'Cadillactica';

/* Big Sean */
UPDATE sbansal21 SET album = 'I Decided.' WHERE artist = 'Big Sean' AND album = 'Bounce Back';

/* Biz Markie */
UPDATE sbansal21 SET album = 'The Biz Never Sleeps' WHERE artist = 'Biz Markie' AND track = 'Just A Friend';

/* Blue in Green */
UPDATE sbansal21 SET album = 'The Break of Dawn' WHERE album IN ('The Break of Dawn (Remastered)', 'The Break OF Dawn');

/* Boyz II Men */
UPDATE sbansal21 SET album = 'Cooleyhighharmony' WHERE album = 'Cooleyhighharmony (Bonus Tracks Version)';

/* Burna Boy */
UPDATE sbansal21 SET album = 'Redemption' WHERE artist = 'Burna Boy' AND track = 'Pree Me';

/* Calvin Harris */
UPDATE sbansal21 SET album = 'Funk Wav Bounces Vol.1' WHERE track = 'Slide' and album = 'Slide';

/* Childish Gambino */
UPDATE sbansal21 SET album = 'Kauai' WHERE album = 'Kauai EP';
UPDATE sbansal21 SET album = '"Awaken, My Love!"' WHERE album IN ('Redbone', 'Me and Your Mama');

/* Cole King */
UPDATE sbansal21 SET album = 'Melancholy Red' WHERE album = 'Nothin Changed (feat. Tunji Ige)';

/* Common */
UPDATE sbansal21 SET album = 'Black America Again' WHERE artist = 'Common' AND album = 'Letter To The Free';
UPDATE sbansal21 SET album = 'Like Water for Chocolate' WHERE artist = 'Common' AND track = 'The Light';

/* Consequence */
UPDATE sbansal21 SET album = 'The Cons, Volume 5: Refuse to Die' WHERE artist = 'Consequence' AND track = 'Don''t Forget ''Em (Remix) [feat. Kanye West]';

/* D.R.A.M. */
UPDATE sbansal21 SET album = 'Big Baby D.R.A.M.' WHERE album IN ('Cash Machine - Single', 'Gilligan (feat. A$AP Rocky & Juicy J)');

/* Daniel Caesar */
UPDATE sbansal21 SET album = 'Freudian' WHERE artist = 'Daniel Caesar' AND album LIKE 'Get You%';

/* Denzel Curry */
UPDATE sbansal21 SET album = '32 Zel / Planet Shrooms' WHERE artist = 'Denzel Curry' AND track = 'Ultimate';

/* Desiigner */
UPDATE sbansal21 SET album = 'New English' WHERE track IN ('Tiimmy Turner', 'Panda') AND artist = 'Desiigner';

/* DJ Khaled */
UPDATE sbansal21 SET album = 'Victory' WHERE album = 'All I Do Is Win (feat. T-Pain, Ludacris, Snoop Dogg & Rick Ross)';
UPDATE sbansal21 SET album = 'Grateful' WHERE artist = 'DJ Khaled' AND album = 'I''m the One';

/* DMX */
UPDATE sbansal21 SET album = 'Grand Champ' WHERE track = 'Where The Hood At';
UPDATE sbansal21 SET album = 'Cradle 2 the Grave' WHERE artist = 'DMX' AND track = 'X Gon'' Give It To Ya';

/* Drake */
UPDATE sbansal21 SET album = 'More Than a Game' WHERE album = 'More Than A Game';
UPDATE sbansal21 SET album = 'Nothing Was the Same' WHERE album = 'Nothing Was The Same (Deluxe)';
UPDATE sbansal21 SET album = 'So Far Gone' WHERE artist = 'Drake' AND track = 'Best I Ever Had';

/* EarthGang */
UPDATE sbansal21 SET album = 'Take Care (Deluxe)' WHERE album = 'Take Care (Explicit Deluxe)';
UPDATE sbansal21 SET album = 'Robots - EP' WHERE artist = 'EarthGang' AND track IN ('Flickted', 'So Many Feelings', 'Underwater (feat. Sir)', 'Robots', 'Artificial', 'Lyfted Intro');

/* Earl Sweatshirt */
UPDATE sbansal21 SET album = 'Doris' WHERE artist = 'Earl Sweatshirt' AND track = 'Hive';

/* Eminem */
UPDATE sbansal21 SET album = 'Curtain Call (Deluxe)' WHERE album = 'Curtain Call (Deluxe Explicit)';

/* Fetty Wap */
UPDATE sbansal21 SET album = 'Fetty Wap (Deluxe)' WHERE album = '679 (feat. Remy Boyz)';

/* Flying Lotus */
UPDATE sbansal21 SET album = 'You''re Dead!' WHERE album = 'You''re Dead! (Deluxe)';
UPDATE sbansal21 SET track = 'Never Catch Me', album = 'You''re Dead!' WHERE track = 'Never Catch Me (feat. Kendrick Lamar)';

/* Fort Minor */
UPDATE sbansal21 SET track = 'Remember the track', album = 'Petrified/Remember The track' WHERE track = 'Remember the track (feat. Styles of Beyond)';

/* Frank Ocean */
UPDATE sbansal21 SET track = 'Nights' WHERE artist = 'Frank Ocean' AND track = 'nights';
UPDATE sbansal21 SET track = 'Close to You' WHERE artist = 'Frank Ocean' AND track = 'close to you';
UPDATE sbansal21 SET track = 'Self Control' WHERE artist = 'Frank Ocean' AND track = 'self control';
UPDATE sbansal21 SET track = 'Solo (Reprise)' WHERE artist = 'Frank Ocean' AND track = 'solo (reprise)';
UPDATE sbansal21 SET track = 'Close to You' WHERE artist = 'Frank Ocean' AND track = 'close to you';

/* Gil-Scott Heron */
UPDATE sbansal21 SET album = 'Pieces of a Man' WHERE track = 'The Revolution Will Not Be Televised';

/* Ginuwine */
UPDATE sbansal21 SET album = 'Ginuwine...the Bachelor' WHERE artist = 'Ginuwine' AND track = 'Pony';

/* GoldLink */
UPDATE sbansal21 SET album = 'At What Cost' WHERE artist = 'GoldLink' AND album = 'Crew';

/* Goodie Mob */
UPDATE sbansal21 SET album = 'Soul Food' WHERE artist = 'Goodie Mob' AND track = 'Cell Therapy';

/* Gucci Mane */
UPDATE sbansal21 SET album = 'Mr. Davis' WHERE album = 'I Get The Bag (feat. Migos)';

/* GZA */
UPDATE sbansal21 SET artist = 'GZA' WHERE artist = 'GZA/Genius';

/* Jalen Santoy */
UPDATE sbansal21 SET album = 'Charlie Eastern' WHERE artist = 'Jalen Santoy' AND track = 'Foreplay';

/* Jay IDK */
UPDATE sbansal21 SET artist = 'Jay IDK' WHERE artist = 'Jay idk';

/* Jeezy */
UPDATE sbansal21 SET album = 'Trap or Die 3' WHERE artist = 'Jeezy' AND track = 'Goldmine';

/* Jidenna */
UPDATE sbansal21 SET album = 'The Chief' WHERE artist = 'Jidenna' AND track = 'Classic Man';

/* Joey Bada$$ */
UPDATE sbansal21 SET album = 'ALL-AMERIKKKAN BADA$$' WHERE artist = 'Joey Bada$$' AND album = 'Devastated';

/* Joey Purp */
UPDATE sbansal21 SET album = 'iiiDrops' WHERE album = 'Girls @ (feat. Chance the Rapper)';

/* Kamaiyah */
UPDATE sbansal21 SET album = 'A GOOD NIGHT IN THE GHETTO' WHERE album = 'How Does It Feel';

/* KAYTRANADA */
UPDATE sbansal21 SET album = '99.9%' WHERE album = 'GLOWED UP';
UPDATE sbansal21 SET artist = 'KAYTRANADA' WHERE artist = 'Kaytranada';

/* Kevin Abstract */
UPDATE sbansal21 SET album = 'American Boyfriend: A Suburban Love Story' WHERE artist = 'Kevin Abstract' AND album = 'Empty - Single';

/* Khalid */
UPDATE sbansal21 SET album = 'American Teen' WHERE album IN ('Location', 'Let''s Go');

/* Lil Uzi Vert */
UPDATE sbansal21 SET album = 'Luv Is Rage 2' WHERE album = 'XO TOUR Llif3';

/* Lil Wayne */
UPDATE sbansal21 SET album = 'Tha Carter IV (Deluxe)' WHERE album IN ('Tha Carter IV (Explicit Deluxe Version)', 'Tha Carter IV (Edited Deluxe Version)');
UPDATE sbansal21 SET album = 'I Am Not A Human Being' WHERE album = 'I Am Not a Human Being';
UPDATE sbansal21 SET album = 'Dedication 6: Reloaded' WHERE track = 'Family Feud';

/* Lorde */
UPDATE sbansal21 SET track = 'Flicker (Kanye West Rework)', album = 'Flicker (Kanye West Rework)' WHERE artist = 'Lorde' AND track LIKE 'Flicker%';

/* Kanye West */
UPDATE sbansal21 SET track = 'I''ll Fly Away' WHERE track = 'I''ll Fly Away - Album Version (Edited)';
UPDATE sbansal21 SET track = 'Two Words' WHERE track = 'Two Words - Album Version (Edited)';
UPDATE sbansal21 SET artist = 'Kanye West' WHERE track = 'Slow Jamz';
UPDATE sbansal21 SET track = 'Blame Game' WHERE track = 'Blame Game (feat. John Legend)';
UPDATE sbansal21 SET track = 'Devil In A New Dress' WHERE track = 'Devil in a New Dress (feat. Rick Ross)';
UPDATE sbansal21 SET track = 'Lost In The World' WHERE track = 'Lost in the World (feat. Bon Iver)';
UPDATE sbansal21 SET track = 'Runaway' WHERE track = 'Runaway (feat. Pusha T)';

/* Kendrick Lamar */
UPDATE sbansal21 SET album = 'good kid, m.A.A.d city (Deluxe)' WHERE album IN ('good kid, m.A.A.d city', 'Swimming Pools (Drank)');
UPDATE sbansal21 SET album = 'DAMN.' WHERE artist = 'Kendrick Lamar' AND album = 'HUMBLE.';

/* Kid CuDi */
UPDATE sbansal21 SET album = 'Man on the Moon II: The Legend of Mr. Rager' WHERE album = 'Man On The Moon II: The Legend Of Mr. Rager';
UPDATE sbansal21 SET album = 'Man On The Moon: The End Of Day (Deluxe)' WHERE album = 'Man On The Moon: The End Of Day (Deluxe Explicit Version)';

/* Marvin Gaye */
UPDATE sbansal21 SET track = 'I Heard It Through the Grapevine', album = 'The Big Chill' WHERE track = 'I Heard It Through The Grapevine - Single Version (Mono)';

/* Masego */
UPDATE sbansal21 SET artist = 'Masego' WHERE artist = 'masego';

/* Mura Masa */
UPDATE sbansal21 SET track = 'Love$ick (feat. A$AP Rocky)' WHERE artist = 'Mura Masa' AND track = 'Love$ick';
UPDATE sbansal21 SET album = 'MURA MASA' WHERE artist = 'Mura Masa' AND track IN ('Love$ick (feat. A$AP Rocky)', '1 Night');

/* Muse */
UPDATE sbansal21 SET album = 'Black Holes and Revelations' WHERE album = 'Black Holes And Revelations (Updated 09 version)';
UPDATE sbansal21 SET album = 'Origin of Symmetry' WHERE album = 'Origin Of Symmetry (New 09 Version)';

/* Nas */
UPDATE sbansal21 SET album = 'Illmatic' WHERE album = 'Illmatic XX';

/* Notrack */
UPDATE sbansal21 SET artist = 'Notrack' WHERE artist = 'Notrack';

/* NxWorries */
UPDATE sbansal21 SET album = 'Yes Lawd!' WHERE album IN ('Get Bigger / Do U Luv', 'Lyk Dis');

/* Otis Redding */
UPDATE sbansal21 SET album = 'Pain in My Heart' WHERE album IN ('Pain In My Heart (US Release)', 'Pain In My Heart');
UPDATE sbansal21 SET album = 'Otis Blue' WHERE artist = 'Otis Redding' AND album LIKE 'Otis Blue%';
UPDATE sbansal21 SET track = 'My Girl' WHERE track = 'My Girl - Remastered Mono' AND album = 'Otis Blue';

/* Post Malone */
UPDATE sbansal21 SET album = 'Stoney (Deluxe)' WHERE album = 'Deja Vu' AND artist = 'Post Malone';

/* Rapsody */
UPDATE sbansal21 SET album = 'Beauty And The Beast (Deluxe Edition)' WHERE album = 'Beauty And The Beast - EP';

/* Russ */
UPDATE sbansal21 SET album = 'There''s Really A Wolf' WHERE album = 'What They Want';

/* Sam Cooke */
UPDATE sbansal21 SET album = 'Mr. Soul' WHERE track = 'Nothing Can Change This Love';

/* Scarface */
UPDATE sbansal21 SET album = 'The Fix' WHERE artist = 'Scarface' AND track = 'On My Block';

/* ScHoolboy Q */
UPDATE sbansal21 SET album = 'Setbacks' WHERE album = 'SetBacks';

/* SiR */
UPDATE sbansal21 SET artist = 'SiR' WHERE artist = 'Sir';
UPDATE sbansal21 SET album = 'November' WHERE artist = 'SiR' AND album is NULL;

/* Smino */
UPDATE sbansal21 SET album = 'blkswn' WHERE artist = 'Smino' AND album = 'Anita';

/* Snakehips */
UPDATE sbansal21 SET album = 'All My Friends - EP' WHERE album = 'All My Friends';

/* SZA */
UPDATE sbansal21 SET album = 'CTRL' WHERE artist = 'SZA' AND album = 'Love Galore';

/* Tech N9ne */
UPDATE sbansal21 SET artist = 'Tech N9ne' WHERE artist = 'Tech N9ne feat.%';

/* theMIND */
UPDATE sbansal21 SET artist = 'theMIND' WHERE artist = 'themind';
UPDATE sbansal21 SET album = 'Summer Camp' WHERE artist = 'theMIND' AND track = 'Pale Rose';

/* The O'My's */
UPDATE sbansal21 SET artist = 'The O''My''s' WHERE artist = 'The O''my''s';

/* Topaz Jones */
UPDATE sbansal21 SET track = 'Powerball', album = 'Arcade' WHERE artist = 'Topaz Jones' AND track = 'Powerball';

/* UGK */
UPDATE sbansal21 SET album = 'Underground Kingz' WHERE track = 'Int''l Players Anthem (I Choose You)';
UPDATE sbansal21 SET album = 'Super Tight' WHERE artist = 'UGK' AND track = 'Front, Back & Side to Side';

/* Vince Staples */
UPDATE sbansal21 SET album = 'Big Fish Theory' WHERE album = 'Big Fish';

/* XXXTentacion */
UPDATE sbansal21 SET artist = 'XXXTentacion' WHERE artist = 'xxxtentacion';

/* YG */
UPDATE sbansal21 SET album = 'My Krazy Life' WHERE artist = 'YG' AND album = 'My Krazy Life (Deluxe)';

/* YGTUT */
UPDATE sbansal21 SET artist = 'YGTUT' WHERE artist = 'ygtut';

/* Young Thug */
UPDATE sbansal21 SET track = 'Pick Up the Phone (feat. Quavo)', album = 'Jeffery' WHERE track LIKE 'Pick Up the Phone%';
UPDATE sbansal21 SET album = 'Jeffery' WHERE artist = 'Young Thug' AND album = 'No, My track is JEFFERY';

/* SQL query for scrobbles per album */
SELECT artist, album, COUNT(*) FROM sbansal21 GROUP BY album HAVING COUNT(*) > 0 ORDER BY artist, album, COUNT(*) DESC