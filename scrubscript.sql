/* Cleans some scrobbling data, sorted in order of artist. */

/* 6LACK */
UPDATE scrobbles SET track = 'PRBLMS' WHERE track = 'PRBLMS - Final';

/* A Tribe Called Quest */
UPDATE scrobbles SET album = 'Midnight Marauders' WHERE track = 'Electric Relaxation';

/* A$AP Ferg */
UPDATE scrobbles SET album = 'Still Striving' WHERE artist = 'A$AP Ferg' AND album = 'East Coast REMIX';

/* A$AP Mob */
UPDATE scrobbles SET album = 'Cozy Tapes: Vol. 1 Friends' WHERE album = 'Cozy Tapes: Vol. 1 Friends -';
UPDATE scrobbles SET album = 'Cozy Tapes Vol. 2: Too Cozy' WHERE artist = 'A$AP Mob' AND album = 'RAF';

/* Amine */
UPDATE scrobbles SET album = 'Good for You' WHERE track = 'Caroline' AND album = 'Caroline';

/* Anderson .Paak */
UPDATE scrobbles SET artist = 'Anderson .Paak' WHERE artist LIKE 'Anderson%Paak%' OR album = 'The Anderson .Paak EP';
UPDATE scrobbles SET album = 'Malibu' WHERE album = 'MALIBU';

/* Big Boi */
UPDATE scrobbles SET album = 'Sir Lucious Left Foot...The Son of Chico Dusty' WHERE album = 'Sir Lucious Left Foot...The Son Of Chico Dusty';

/* Big Grams */
UPDATE scrobbles SET album = 'Big Grams' WHERE artist = 'Big Grams' AND track = 'Fell in the Sun';

/* Big K.R.I.T. */
UPDATE scrobbles SET album = 'Cadillactica (Deluxe)' WHERE album = 'Cadillactica';

/* Big Sean */
UPDATE scrobbles SET album = 'I Decided.' WHERE artist = 'Big Sean' AND album = 'Bounce Back';

/* Biz Markie */
UPDATE scrobbles SET album = 'The Biz Never Sleeps' WHERE artist = 'Biz Markie' AND track = 'Just A Friend';

/* Blue in Green */
UPDATE scrobbles SET album = 'The Break of Dawn' WHERE album IN ('The Break of Dawn (Remastered)', 'The Break OF Dawn');

/* Boyz II Men */
UPDATE scrobbles SET album = 'Cooleyhighharmony' WHERE album = 'Cooleyhighharmony (Bonus Tracks Version)';

/* Burna Boy */
UPDATE scrobbles SET album = 'Redemption' WHERE artist = 'Burna Boy' AND track = 'Pree Me';

/* Calvin Harris */
UPDATE scrobbles SET album = 'Funk Wav Bounces Vol.1' WHERE track = 'Slide' and album = 'Slide';

/* Childish Gambino */
UPDATE scrobbles SET album = 'Kauai' WHERE album = 'Kauai EP';
UPDATE scrobbles SET album = '"Awaken, My Love!"' WHERE album IN ('Redbone', 'Me and Your Mama');

/* Cole King */
UPDATE scrobbles SET album = 'Melancholy Red' WHERE album = 'Nothin Changed (feat. Tunji Ige)';

/* Common */
UPDATE scrobbles SET album = 'Black America Again' WHERE artist = 'Common' AND album = 'Letter To The Free';
UPDATE scrobbles SET album = 'Like Water for Chocolate' WHERE artist = 'Common' AND track = 'The Light';

/* Consequence */
UPDATE scrobbles SET album = 'The Cons, Volume 5: Refuse to Die' WHERE artist = 'Consequence' AND track = 'Don''t Forget ''Em (Remix) [feat. Kanye West]';

/* D.R.A.M. */
UPDATE scrobbles SET album = 'Big Baby D.R.A.M.' WHERE album IN ('Cash Machine - Single', 'Gilligan (feat. A$AP Rocky & Juicy J)');

/* Daniel Caesar */
UPDATE scrobbles SET album = 'Freudian' WHERE artist = 'Daniel Caesar' AND album LIKE 'Get You%';

/* Denzel Curry */
UPDATE scrobbles SET album = '32 Zel / Planet Shrooms' WHERE artist = 'Denzel Curry' AND track = 'Ultimate';

/* Desiigner */
UPDATE scrobbles SET album = 'New English' WHERE track IN ('Tiimmy Turner', 'Panda') AND artist = 'Desiigner';

/* DJ Khaled */
UPDATE scrobbles SET album = 'Victory' WHERE album = 'All I Do Is Win (feat. T-Pain, Ludacris, Snoop Dogg & Rick Ross)';
UPDATE scrobbles SET album = 'Grateful' WHERE artist = 'DJ Khaled' AND album = 'I''m the One';

/* DMX */
UPDATE scrobbles SET album = 'Grand Champ' WHERE track = 'Where The Hood At';
UPDATE scrobbles SET album = 'Cradle 2 the Grave' WHERE artist = 'DMX' AND track = 'X Gon'' Give It To Ya';

/* Drake */
UPDATE scrobbles SET album = 'More Than a Game' WHERE album = 'More Than A Game';
UPDATE scrobbles SET album = 'Nothing Was the Same' WHERE album = 'Nothing Was The Same (Deluxe)';
UPDATE scrobbles SET album = 'So Far Gone' WHERE artist = 'Drake' AND track = 'Best I Ever Had';

/* EarthGang */
UPDATE scrobbles SET album = 'Take Care (Deluxe)' WHERE album = 'Take Care (Explicit Deluxe)';
UPDATE scrobbles SET album = 'Robots - EP' WHERE artist = 'EarthGang' AND track IN ('Flickted', 'So Many Feelings', 'Underwater (feat. Sir)', 'Robots', 'Artificial', 'Lyfted Intro');

/* Earl Sweatshirt */
UPDATE scrobbles SET album = 'Doris' WHERE artist = 'Earl Sweatshirt' AND track = 'Hive';

/* Eminem */
UPDATE scrobbles SET album = 'Curtain Call (Deluxe)' WHERE album = 'Curtain Call (Deluxe Explicit)';

/* Fetty Wap */
UPDATE scrobbles SET album = 'Fetty Wap (Deluxe)' WHERE album = '679 (feat. Remy Boyz)';

/* Flying Lotus */
UPDATE scrobbles SET album = 'You''re Dead!' WHERE album = 'You''re Dead! (Deluxe)';
UPDATE scrobbles SET track = 'Never Catch Me', album = 'You''re Dead!' WHERE track = 'Never Catch Me (feat. Kendrick Lamar)';

/* Fort Minor */
UPDATE scrobbles SET track = 'Remember the track', album = 'Petrified/Remember The track' WHERE track = 'Remember the track (feat. Styles of Beyond)';

/* Frank Ocean */
UPDATE scrobbles SET track = 'Nights' WHERE artist = 'Frank Ocean' AND track = 'nights';
UPDATE scrobbles SET track = 'Close to You' WHERE artist = 'Frank Ocean' AND track = 'close to you';
UPDATE scrobbles SET track = 'Self Control' WHERE artist = 'Frank Ocean' AND track = 'self control';
UPDATE scrobbles SET track = 'Solo (Reprise)' WHERE artist = 'Frank Ocean' AND track = 'solo (reprise)';
UPDATE scrobbles SET track = 'Close to You' WHERE artist = 'Frank Ocean' AND track = 'close to you';

/* Gil-Scott Heron */
UPDATE scrobbles SET album = 'Pieces of a Man' WHERE track = 'The Revolution Will Not Be Televised';

/* Ginuwine */
UPDATE scrobbles SET album = 'Ginuwine...the Bachelor' WHERE artist = 'Ginuwine' AND track = 'Pony';

/* GoldLink */
UPDATE scrobbles SET album = 'At What Cost' WHERE artist = 'GoldLink' AND album = 'Crew';

/* Goodie Mob */
UPDATE scrobbles SET album = 'Soul Food' WHERE artist = 'Goodie Mob' AND track = 'Cell Therapy';

/* Gucci Mane */
UPDATE scrobbles SET album = 'Mr. Davis' WHERE album = 'I Get The Bag (feat. Migos)';

/* GZA */
UPDATE scrobbles SET artist = 'GZA' WHERE artist = 'GZA/Genius';

/* Jalen Santoy */
UPDATE scrobbles SET album = 'Charlie Eastern' WHERE artist = 'Jalen Santoy' AND track = 'Foreplay';

/* Jay IDK */
UPDATE scrobbles SET artist = 'Jay IDK' WHERE artist = 'Jay idk';

/* Jeezy */
UPDATE scrobbles SET album = 'Trap or Die 3' WHERE artist = 'Jeezy' AND track = 'Goldmine';

/* Jidenna */
UPDATE scrobbles SET album = 'The Chief' WHERE artist = 'Jidenna' AND track = 'Classic Man';

/* Joey Bada$$ */
UPDATE scrobbles SET album = 'ALL-AMERIKKKAN BADA$$' WHERE artist = 'Joey Bada$$' AND album = 'Devastated';

/* Joey Purp */
UPDATE scrobbles SET album = 'iiiDrops' WHERE album = 'Girls @ (feat. Chance the Rapper)';

/* Kamaiyah */
UPDATE scrobbles SET album = 'A GOOD NIGHT IN THE GHETTO' WHERE album = 'How Does It Feel';

/* KAYTRANADA */
UPDATE scrobbles SET album = '99.9%' WHERE album = 'GLOWED UP';
UPDATE scrobbles SET artist = 'KAYTRANADA' WHERE artist = 'Kaytranada';

/* Kevin Abstract */
UPDATE scrobbles SET album = 'American Boyfriend: A Suburban Love Story' WHERE artist = 'Kevin Abstract' AND album = 'Empty - Single';

/* Khalid */
UPDATE scrobbles SET album = 'American Teen' WHERE album IN ('Location', 'Let''s Go');

/* Lil Uzi Vert */
UPDATE scrobbles SET album = 'Luv Is Rage 2' WHERE album = 'XO TOUR Llif3';

/* Lil Wayne */
UPDATE scrobbles SET album = 'Tha Carter IV (Deluxe)' WHERE album IN ('Tha Carter IV (Explicit Deluxe Version)', 'Tha Carter IV (Edited Deluxe Version)');
UPDATE scrobbles SET album = 'I Am Not A Human Being' WHERE album = 'I Am Not a Human Being';
UPDATE scrobbles SET album = 'Dedication 6: Reloaded' WHERE track = 'Family Feud';

/* Lorde */
UPDATE scrobbles SET track = 'Flicker (Kanye West Rework)', album = 'Flicker (Kanye West Rework)' WHERE artist = 'Lorde' AND track LIKE 'Flicker%';

/* Kanye West */
UPDATE scrobbles SET track = 'I''ll Fly Away' WHERE track = 'I''ll Fly Away - Album Version (Edited)';
UPDATE scrobbles SET track = 'Two Words' WHERE track = 'Two Words - Album Version (Edited)';
UPDATE scrobbles SET artist = 'Kanye West' WHERE track = 'Slow Jamz';
UPDATE scrobbles SET track = 'Blame Game' WHERE track = 'Blame Game (feat. John Legend)';
UPDATE scrobbles SET track = 'Devil In A New Dress' WHERE track = 'Devil in a New Dress (feat. Rick Ross)';
UPDATE scrobbles SET track = 'Lost In The World' WHERE track = 'Lost in the World (feat. Bon Iver)';
UPDATE scrobbles SET track = 'Runaway' WHERE track = 'Runaway (feat. Pusha T)';

/* Kendrick Lamar */
UPDATE scrobbles SET album = 'good kid, m.A.A.d city (Deluxe)' WHERE album IN ('good kid, m.A.A.d city', 'Swimming Pools (Drank)');
UPDATE scrobbles SET album = 'DAMN.' WHERE artist = 'Kendrick Lamar' AND album = 'HUMBLE.';

/* Kid CuDi */
UPDATE scrobbles SET album = 'Man on the Moon II: The Legend of Mr. Rager' WHERE album = 'Man On The Moon II: The Legend Of Mr. Rager';
UPDATE scrobbles SET album = 'Man On The Moon: The End Of Day (Deluxe)' WHERE album = 'Man On The Moon: The End Of Day (Deluxe Explicit Version)';

/* Marvin Gaye */
UPDATE scrobbles SET track = 'I Heard It Through the Grapevine', album = 'The Big Chill' WHERE track = 'I Heard It Through The Grapevine - Single Version (Mono)';

/* Masego */
UPDATE scrobbles SET artist = 'Masego' WHERE artist = 'masego';

/* Mura Masa */
UPDATE scrobbles SET track = 'Love$ick (feat. A$AP Rocky)' WHERE artist = 'Mura Masa' AND track = 'Love$ick';
UPDATE scrobbles SET album = 'MURA MASA' WHERE artist = 'Mura Masa' AND track IN ('Love$ick (feat. A$AP Rocky)', '1 Night');

/* Muse */
UPDATE scrobbles SET album = 'Black Holes and Revelations' WHERE album = 'Black Holes And Revelations (Updated 09 version)';
UPDATE scrobbles SET album = 'Origin of Symmetry' WHERE album = 'Origin Of Symmetry (New 09 Version)';

/* Nas */
UPDATE scrobbles SET album = 'Illmatic' WHERE album = 'Illmatic XX';

/* Notrack */
UPDATE scrobbles SET artist = 'Notrack' WHERE artist = 'Notrack';

/* NxWorries */
UPDATE scrobbles SET album = 'Yes Lawd!' WHERE album IN ('Get Bigger / Do U Luv', 'Lyk Dis');

/* Otis Redding */
UPDATE scrobbles SET album = 'Pain in My Heart' WHERE album IN ('Pain In My Heart (US Release)', 'Pain In My Heart');
UPDATE scrobbles SET album = 'Otis Blue' WHERE artist = 'Otis Redding' AND album LIKE 'Otis Blue%';
UPDATE scrobbles SET track = 'My Girl' WHERE track = 'My Girl - Remastered Mono' AND album = 'Otis Blue';

/* Post Malone */
UPDATE scrobbles SET album = 'Stoney (Deluxe)' WHERE album = 'Deja Vu' AND artist = 'Post Malone';

/* Rapsody */
UPDATE scrobbles SET album = 'Beauty And The Beast (Deluxe Edition)' WHERE album = 'Beauty And The Beast - EP';

/* Russ */
UPDATE scrobbles SET album = 'There''s Really A Wolf' WHERE album = 'What They Want';

/* Sam Cooke */
UPDATE scrobbles SET album = 'Mr. Soul' WHERE track = 'Nothing Can Change This Love';

/* Scarface */
UPDATE scrobbles SET album = 'The Fix' WHERE artist = 'Scarface' AND track = 'On My Block';

/* ScHoolboy Q */
UPDATE scrobbles SET album = 'Setbacks' WHERE album = 'SetBacks';

/* SiR */
UPDATE scrobbles SET artist = 'SiR' WHERE artist = 'Sir';
UPDATE scrobbles SET album = 'November' WHERE artist = 'SiR' AND album is NULL;

/* Smino */
UPDATE scrobbles SET album = 'blkswn' WHERE artist = 'Smino' AND album = 'Anita';

/* Snakehips */
UPDATE scrobbles SET album = 'All My Friends - EP' WHERE album = 'All My Friends';

/* SZA */
UPDATE scrobbles SET album = 'CTRL' WHERE artist = 'SZA' AND album = 'Love Galore';

/* Tech N9ne */
UPDATE scrobbles SET artist = 'Tech N9ne' WHERE artist = 'Tech N9ne feat.%';

/* theMIND */
UPDATE scrobbles SET artist = 'theMIND' WHERE artist = 'themind';
UPDATE scrobbles SET album = 'Summer Camp' WHERE artist = 'theMIND' AND track = 'Pale Rose';

/* The O'My's */
UPDATE scrobbles SET artist = 'The O''My''s' WHERE artist = 'The O''my''s';

/* Topaz Jones */
UPDATE scrobbles SET track = 'Powerball', album = 'Arcade' WHERE artist = 'Topaz Jones' AND track = 'Powerball';

/* UGK */
UPDATE scrobbles SET album = 'Underground Kingz' WHERE track = 'Int''l Players Anthem (I Choose You)';
UPDATE scrobbles SET album = 'Super Tight' WHERE artist = 'UGK' AND track = 'Front, Back & Side to Side';

/* Vince Staples */
UPDATE scrobbles SET album = 'Big Fish Theory' WHERE album = 'Big Fish';

/* XXXTentacion */
UPDATE scrobbles SET artist = 'XXXTentacion' WHERE artist = 'xxxtentacion';

/* YG */
UPDATE scrobbles SET album = 'My Krazy Life' WHERE artist = 'YG' AND album = 'My Krazy Life (Deluxe)';

/* YGTUT */
UPDATE scrobbles SET artist = 'YGTUT' WHERE artist = 'ygtut';

/* Young Thug */
UPDATE scrobbles SET track = 'Pick Up the Phone (feat. Quavo)', album = 'Jeffery' WHERE track LIKE 'Pick Up the Phone%';
UPDATE scrobbles SET album = 'Jeffery' WHERE artist = 'Young Thug' AND album = 'No, My track is JEFFERY';

/* SQL query for scrobbles per album */
SELECT artist, album, COUNT(*) FROM scrobbles GROUP BY album HAVING COUNT(*) > 0 ORDER BY artist, album, COUNT(*) DESC