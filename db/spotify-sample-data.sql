-- Use the database
USE spoti5;

-- Populate ARTISTA table
INSERT INTO ARTISTA (ID_artista, nome_d_arte, descrizione, generi_musicali, followers, data_fondazione) VALUES
('ART001', 'The Weeknd', 'Canadian singer, songwriter, and record producer', 'R&B, Pop, Alternative R&B', 45000000, '2010-01-15'),
('ART002', 'Taylor Swift', 'American singer-songwriter known for narrative songs', 'Pop, Country, Folk, Rock', 85000000, '2006-06-09'),
('ART003', 'BTS', 'South Korean boy band with a global fanbase', 'K-pop, Hip hop, R&B, EDM', 70000000, '2013-06-13'),
('ART004', 'Bad Bunny', 'Puerto Rican rapper and singer', 'Reggaeton, Latin trap, Hip hop', 38000000, '2016-08-24'),
('ART005', 'Dua Lipa', 'English singer and songwriter', 'Pop, Dance, Disco', 29000000, '2015-05-10'),
('ART006', 'Miley Cyrus', 'American singer-songwriter and actress', 'Pop, Rock, Country', 24500000, '2006-03-24'),
('ART007', 'Kacey Musgraves', 'American country music singer and songwriter', 'Country, Pop, Folk', 8900000, '2012-07-19'),
('ART008', 'Post Malone & Swae Lee', 'American rap and R&B collaboration', 'Hip hop, R&B, Pop', 31200000, '2018-10-01'),
('ART009', 'Post Malone', 'American rapper, singer, and songwriter', 'Hip hop, R&B, Pop, Rock', 33000000, '2015-02-04'),
('ART010', 'Ed Sheeran', 'English singer-songwriter and musician', 'Pop, Folk pop, Soft rock', 42000000, '2004-09-18'),
('ART011', 'Harry Styles', 'English singer, songwriter and actor', 'Pop rock, Soft rock, Funk', 28700000, '2010-04-11'),
('ART012', 'Selena Gomez', 'American singer, actress and producer', 'Pop, Dance pop, Electropop', 31900000, '2008-09-29'),
('ART013', 'Lewis Capaldi', 'Scottish singer-songwriter', 'Pop, Soul, Indie pop', 12450000, '2017-11-08'),
('ART014', 'Martin Garrix', 'Dutch DJ and record producer', 'EDM, Progressive house, Future bass', 19600000, '2012-05-14'),
('ART015', 'Maroon 5', 'American pop rock band', 'Pop rock, Pop, R&B', 27800000, '1994-09-01'),
('ART016', 'Christina Aguilera', 'American singer, songwriter and actress', 'Pop, R&B, Soul', 14300000, '1999-01-15'),
('ART017', 'Jungkook', 'South Korean singer and BTS member', 'K-pop, R&B, Pop', 25400000, '2015-06-13'),
('ART018', 'Tame Impala', 'Australian psychedelic music project', 'Psychedelic rock, Synth-pop', 8700000, '2007-11-22'),
('ART019', 'Billie Eilish', 'American singer-songwriter', 'Electropop, Alternative, Pop', 39500000, '2015-11-18'),
('ART020', 'Ariana Grande', 'American singer, songwriter and actress', 'Pop, R&B, Trap', 44200000, '2011-08-30'),
('ART021', 'Owl City', 'American electronic music project', 'Synthpop, Indietronica, Electronica', 6800000, '2007-07-14'),
('ART022', 'Kesha', 'American singer and songwriter', 'Pop, Dance-pop, Electropop', 9300000, '2005-04-23'),
('ART023', 'Coldplay', 'British rock band', 'Alternative rock, Pop rock, Post-Britpop', 37500000, '1996-09-12'),
('ART024', 'Travis Scott', 'American rapper and record producer', 'Hip hop, Trap, Psychedelic rap', 34600000, '2012-11-16'),
('ART025', 'Aurora', 'Norwegian singer-songwriter', 'Art pop, Electronic, Folk pop', 7800000, '2012-06-15'),
('ART026', 'Imagine Dragons', 'American pop rock band', 'Pop rock, Alternative rock, Electropop', 29100000, '2008-07-10'),
('ART027', 'Sting', 'English musician and actor', 'Rock, Jazz, Reggae, World', 11200000, '1977-01-10'),
('ART028', 'Daft Punk', 'French electronic music duo', 'Electronic, House, Funk, Disco', 13600000, '1993-09-17'),
('ART029', 'Alicia Keys', 'American singer-songwriter and pianist', 'R&B, Soul, Pop', 17900000, '1996-12-14'),
('ART030', 'OneRepublic', 'American pop rock band', 'Pop rock, Alternative rock, Pop', 15300000, '2002-06-25'),
('ART031', 'Lady Gaga', 'American singer, songwriter and actress', 'Pop, Dance, Electronic, Jazz', 33700000, '2005-08-04'),
('ART032', 'Beyoncé', 'American singer, songwriter and actress', 'R&B, Pop, Hip hop, Soul', 41900000, '1997-10-05'),
('ART033', 'Jungle', 'British modern soul musical collective', 'Neo soul, Funk, Electronic', 4200000, '2013-11-21'),
('ART034', 'Sia', 'Australian singer and songwriter', 'Pop, Electronic, R&B', 21400000, '1997-12-18'),
('ART035', 'David Bowie', 'British singer-songwriter and actor', 'Rock, Art rock, Electronic, Jazz', 19700000, '1962-05-09'),
('ART036', 'The Weeknd & Daft Punk', 'R&B and electronic music collaboration', 'R&B, Electronic, Synthwave', 27800000, '2016-09-22'),
('ART037', 'Muse', 'English rock band', 'Alternative rock, Progressive rock, Electronic', 10900000, '1994-09-10'),
('ART038', 'Jorja Smith', 'English singer and songwriter', 'R&B, Soul, Jazz', 8200000, '2016-03-11'),
('ART039', 'Linkin Park', 'American rock band', 'Alternative rock, Nu metal, Electronic rock', 23100000, '1996-01-01'),
('ART040', 'Bruno Mars', 'American singer, songwriter, and producer', 'Pop, R&B, Funk, Soul', 32800000, '2004-06-28'),
('ART041', 'Rihanna', 'Barbadian singer, actress and businesswoman', 'R&B, Pop, Reggae, Hip hop', 46200000, '2003-12-21'),
('ART042', 'Enya', 'Irish singer, songwriter and musician', 'New age, Celtic, World', 7500000, '1980-05-17'),
('ART043', 'Florence + The Machine', 'English indie rock band', 'Indie rock, Art pop, Soul', 11700000, '2007-01-03'),
('ART044', 'Radiohead', 'English rock band', 'Alternative rock, Art rock, Electronic', 16400000, '1985-09-22'),
('ART045', 'The Chainsmokers', 'American electronic DJ and production duo', 'EDM, Pop, Future bass', 20800000, '2012-05-18'),
('ART046', 'Lana Del Rey', 'American singer-songwriter', 'Dream pop, Baroque pop, Indie pop', 18300000, '2005-06-21'),
('ART047', 'Mika', 'Lebanese-British singer and songwriter', 'Pop, Rock, Glam rock', 6100000, '2006-08-10'),
('ART048', 'Adele', 'English singer-songwriter', 'Pop, Soul, R&B', 39800000, '2006-05-05'),
('ART049', 'Kings of Leon', 'American rock band', 'Alternative rock, Southern rock', 9400000, '1999-01-23'),
('ART050', 'Fleetwood Mac', 'British-American rock band', 'Rock, Pop rock, Soft rock', 22600000, '1967-07-15'),
('ART051', 'Sigur Rós', 'Icelandic post-rock band', 'Post-rock, Ambient, Experimental', 5300000, '1994-08-04'),
('ART052', 'Jónsi', 'Icelandic musician and Sigur Rós frontman', 'Post-rock, Ambient, Electronic', 3100000, '1999-03-23'),
('ART053', 'ZAYN', 'English singer and songwriter', 'R&B, Pop, Alternative R&B', 14600000, '2010-12-13'),
('ART054', 'Eminem', 'American rapper, songwriter and producer', 'Hip hop, Rap, Horrorcore', 47300000, '1988-10-17'),
('ART055', 'The Lumineers', 'American folk rock band', 'Folk rock, Americana, Indie folk', 8900000, '2005-04-26');

-- Populate ALBUM table
INSERT INTO ALBUM (ID_artista, titolo, descrizione) VALUES
('ART001', 'After Hours', 'Fourth studio album featuring dark wave and dream pop elements'),
('ART001', 'Dawn FM', 'Concept album with a radio station format'),
('ART002', 'Folklore', 'Indie folk album written during pandemic'),
('ART002', 'Midnights', 'Pop album exploring themes of self-loathing and fantasy'),
('ART003', 'Map of the Soul: 7', 'Studio album exploring Jungian psychology'),
('ART004', 'Un Verano Sin Ti', 'Summer-themed album with reggaeton, merengue, and indie pop'),
('ART005', 'Future Nostalgia', 'Disco-influenced dance-pop album'),
('ART006', 'Plastic Hearts', 'Rock-influenced album with 80s elements and guest appearances'),
('ART007', 'Golden Hour', 'Grammy-winning album blending country with pop and psychedelic elements'),
('ART008', 'Spider-Verse', 'Soundtrack album for the animated Spider-Man film'),
('ART009', 'Hollywoods Bleeding', 'Third studio album exploring blend of hip-hop, pop-rock, and trap'),
('ART010', 'Divide', 'Third studio album with chart-topping singles and ballads'),
('ART011', 'Fine Line', 'Second studio album exploring themes of heartbreak and self-discovery'),
('ART012', 'Rare', 'Third studio album reflecting on personal growth and relationship challenges'),
('ART013', 'Divinely Uninspired', 'Debut album featuring emotional ballads and powerful vocals'),
('ART014', 'Paradise', 'EDM album with tropical house and future bass influences'),
('ART015', 'Jordi', 'Seventh studio album named after their late manager'),
('ART016', 'Liberation', 'Album exploring themes of freedom and personal empowerment'),
('ART017', 'Emotion', 'Solo project exploring emotional spectrum through music'),
('ART018', 'Dreamland', 'Psychedelic album inspired by nostalgia and memories'),
('ART019', 'Oceans', 'Debut album with melancholic pop and electronic influences'),
('ART020', 'Night Sky', 'Album with spacey production and ethereal vocals'),
('ART021', 'Illuminate', 'Electronic album with dreamy soundscapes and nature-inspired lyrics'),
('ART022', 'Spectrum', 'Comeback album celebrating diversity and personal expression'),
('ART023', 'Celestial', 'Space-themed album with orchestral arrangements'),
('ART024', 'Metamorphosis', 'Concept album about transformation and personal growth'),
('ART025', 'Borealis', 'Atmospheric album inspired by Nordic landscapes'),
('ART026', 'Elements', 'Concept album organized around earth, air, fire, and water themes'),
('ART027', 'Oasis', 'World music-influenced album with desert themes'),
('ART028', 'Voltage', 'Electronic album with retro-futuristic production'),
('ART029', 'Hourglass', 'R&B album exploring themes of time and memory'),
('ART030', 'Cosmos', 'Pop-rock album with astronomical themes and metaphors'),
('ART031', 'Pulse', 'Dance-pop album with heart and vitality themes'),
('ART032', 'Beyond', 'R&B album pushing musical boundaries with experimental production'),
('ART033', 'Primal', 'Neo-soul album with organic instrumentation and nature themes'),
('ART034', 'Prism', 'Pop album exploring different perspectives and musical styles'),
('ART035', 'Maze', 'Concept album with interconnected songs forming a narrative journey'),
('ART036', 'Desert Dreams', 'Collaborative album with psychedelic and electronic elements'),
('ART037', 'Galaxy', 'Space rock album with expansive soundscapes'),
('ART038', 'Elements', 'Soul album exploring fundamental human experiences'),
('ART039', 'Rebirth', 'Rock album about renewal and second chances'),
('ART040', 'Mercury', 'Funk album with themes of change and fluidity'),
('ART041', 'Luminous', 'R&B album with bright production and empowering themes'),
('ART042', 'Tranquil', 'New age album focused on peace and mindfulness'),
('ART043', 'Hurricanes', 'Indie rock album exploring emotional turbulence'),
('ART044', 'Spectrum', 'Art rock album with diverse sonic palette'),
('ART045', 'Speed', 'EDM album with high-energy dance tracks'),
('ART046', 'Nomad', 'Indie pop album about wandering and searching'),
('ART047', 'Noble', 'Pop album with bright, luminous production'),
('ART048', 'Nostalgia', 'Soul album reflecting on past experiences'),
('ART049', 'Apex', 'Rock album representing the bands creative peak'),
('ART050', 'Wings', 'Folk rock album with themes of freedom and flight'),
('ART051', 'Aurora', 'Post-rock album with ambient soundscapes'),
('ART052', 'Waterfall', 'Solo album with fluid compositions and natural themes'),
('ART053', 'Twilight', 'R&B album exploring transitions and thresholds'),
('ART054', 'Reverberate', 'Hip hop album about lasting impact and legacy'),
('ART055', 'Infinity', 'Folk rock album exploring timeless themes and emotions');

-- Populate BRANO table
INSERT INTO BRANO (ID_brano, titolo, testo, durata, data_uscita, Tra_ID_artista, Tra_titolo) VALUES
('BRN001', 'Blinding Lights', 'I been tryna call, I been on my own for long enough...', 200, '2019-11-29', 'ART001', 'After Hours'),
('BRN002', 'Save Your Tears', 'I saw you dancing in a crowded room...', 215, '2020-08-09', 'ART001', 'After Hours'),
('BRN003', 'Take My Breath', 'I saw the fire in your eyes...', 223, '2021-08-06', 'ART001', 'Dawn FM'),
('BRN004', 'Cardigan', 'Vintage tee, brand new phone, high heels on cobblestones...', 239, '2020-07-24', 'ART002', 'Folklore'),
('BRN005', 'Anti-Hero', 'I have this thing where I get older but just never wiser...', 200, '2022-10-21', 'ART002', 'Midnights'),
('BRN006', 'Black Swan', 'Do your thang, do your thang with me now...', 196, '2020-01-17', 'ART003', 'Map of the Soul: 7'),
('BRN007', 'Me Porto Bonito', 'Yo no soy tu novio, ni tu marío, ni tu papi...', 178, '2022-05-06', 'ART004', 'Un Verano Sin Ti'),
('BRN008', 'Levitating', 'If you wanna run away with me, I know a galaxy...', 203, '2020-10-01', 'ART005', 'Future Nostalgia'),
('BRN009', 'Don''t Start Now', 'Did a full 180, crazy...', 183, '2019-11-01', 'ART005', 'Future Nostalgia'),
('BRN010', 'Midnight Sky', 'The stars align tonight as we dance under the...', 197, '2020-08-14', 'ART006', 'Plastic Hearts'),
('BRN011', 'Golden Hour', 'There is a warm glow on the horizon...', 224, '2018-03-30', 'ART007', 'Golden Hour'),
('BRN012', 'Sunflower', 'Walking through the garden, petals fall around me...', 162, '2018-10-18', 'ART008', 'Spider-Verse'),
('BRN013', 'Circles', 'Going round and round, finding myself back where I began...', 183, '2019-09-03', 'ART009', 'Hollywoods Bleeding'),
('BRN014', 'Supermarket Flowers', 'I took the supermarket flowers from the windowsill...', 221, '2017-03-03', 'ART010', 'Divide'),
('BRN015', 'Watermelon Sugar', 'Summer feeling, sweet like honey...', 174, '2019-11-16', 'ART011', 'Fine Line'),
('BRN016', 'Lose You To Love Me', 'Had to find my way through the darkness alone...', 206, '2019-10-23', 'ART012', 'Rare'),
('BRN017', 'Before You Go', 'Standing in the hallway wondering what I did wrong...', 215, '2019-11-10', 'ART013', 'Divinely Uninspired'),
('BRN018', 'Summer Days', 'Golden memories of those endless summer days...', 193, '2021-06-12', 'ART014', 'Paradise'),
('BRN019', 'Memories', 'Looking back at all we ve been through...', 189, '2019-09-20', 'ART015', 'Jordi'),
('BRN020', 'Breaking Free', 'The chains are gone, now I can breathe again...', 177, '2022-01-15', 'ART016', 'Liberation'),
('BRN021', 'Euphoria', 'Dancing through the night with stars in my eyes...', 202, '2019-04-09', 'ART017', 'Emotion'),
('BRN022', 'Wildest Dreams', 'Running through fields of endless possibility...', 211, '2020-09-23', 'ART018', 'Dreamland'),
('BRN023', 'Ocean Eyes', 'Looking into the depths of blue, I am falling deeper...', 198, '2016-11-18', 'ART019', 'Oceans'),
('BRN024', 'Moonlight', 'Silver beams illuminate the path we follow...', 187, '2021-11-30', 'ART020', 'Night Sky'),
('BRN025', 'Fireflies', 'Little lights dancing in the summer evening...', 173, '2017-06-05', 'ART021', 'Illuminate'),
('BRN026', 'Rainbow', 'After the storm comes colors across the sky...', 214, '2022-03-14', 'ART022', 'Spectrum'),
('BRN027', 'Starlight', 'Wishes made on distant constellations...', 192, '2019-07-21', 'ART023', 'Celestial'),
('BRN028', 'Butterfly Effect', 'Small changes leading to something greater...', 208, '2020-10-30', 'ART024', 'Metamorphosis'),
('BRN029', 'Aurora', 'Dancing lights painting the northern sky...', 225, '2018-12-01', 'ART025', 'Borealis'),
('BRN030', 'Crystalline', 'Clear as diamond, strong as stone, my heart remains...', 190, '2021-02-18', 'ART026', 'Elements'),
('BRN031', 'Desert Rose', 'Blooming against all odds in the sand and sun...', 203, '2019-03-24', 'ART027', 'Oasis'),
('BRN032', 'Electric Soul', 'Sparks fly whenever our eyes meet across the room...', 188, '2022-05-11', 'ART028', 'Voltage'),
('BRN033', 'Frozen Time', 'Moments captured like photographs in my mind...', 216, '2020-01-09', 'ART029', 'Hourglass'),
('BRN034', 'Gravity', 'Pulled toward you by forces I cannot resist...', 201, '2018-08-16', 'ART030', 'Cosmos'),
('BRN035', 'Heartbeat', 'Rhythm and percussion matching time with mine...', 184, '2021-09-03', 'ART031', 'Pulse'),
('BRN036', 'Infinity', 'No beginning, no end, just us in the middle...', 219, '2019-05-29', 'ART032', 'Beyond'),
('BRN037', 'Jungle Dreams', 'Wild visions of emerald canopies and flowing rivers...', 195, '2022-02-26', 'ART033', 'Primal'),
('BRN038', 'Kaleidoscope', 'Fractured patterns of color shifting with every turn...', 209, '2020-06-14', 'ART034', 'Prism'),
('BRN039', 'Labyrinth', 'Lost in the winding paths of my own creation...', 222, '2018-10-09', 'ART035', 'Maze'),
('BRN040', 'Mirage', 'What I see before me might not be real...', 180, '2021-04-17', 'ART036', 'Desert Dreams'),
('BRN041', 'Nebula', 'Clouds of stardust forming something beautiful...', 205, '2019-11-22', 'ART037', 'Galaxy'),
('BRN042', 'Oxygen', 'Breathing you in gives me life again...', 193, '2022-07-08', 'ART038', 'Elements'),
('BRN043', 'Phoenix', 'Rising from ashes, stronger than before...', 231, '2020-03-13', 'ART039', 'Rebirth'),
('BRN044', 'Quicksilver', 'Flowing fast, impossible to hold, just like time...', 178, '2018-02-15', 'ART040', 'Mercury'),
('BRN045', 'Radiance', 'Light emanating from within, impossible to hide...', 207, '2021-10-19', 'ART041', 'Luminous'),
('BRN046', 'Serenity', 'Peaceful moments in the eye of the storm...', 226, '2019-08-03', 'ART042', 'Tranquil'),
('BRN047', 'Tempest', 'Winds of change blowing through my world...', 198, '2022-04-01', 'ART043', 'Hurricanes'),
('BRN048', 'Ultraviolet', 'Beyond what eyes can see, but felt all the same...', 213, '2020-12-11', 'ART044', 'Spectrum'),
('BRN049', 'Velocity', 'Racing against time but never fast enough...', 185, '2018-09-27', 'ART045', 'Speed'),
('BRN050', 'Wanderlust', 'The call of distant horizons pulls me forward...', 210, '2021-06-30', 'ART046', 'Nomad'),
('BRN051', 'Xenon', 'Bright light illuminating all the dark corners...', 196, '2019-01-18', 'ART047', 'Noble'),
('BRN052', 'Yesterday', 'Memories of times gone by, never to return...', 220, '2022-08-21', 'ART048', 'Nostalgia'),
('BRN053', 'Zenith', 'Reaching the highest point, nowhere to go but down...', 191, '2020-05-07', 'ART049', 'Apex'),
('BRN054', 'Albatross', 'Soaring high above the restless ocean waves...', 217, '2018-07-19', 'ART050', 'Wings'),
('BRN055', 'Borealis', 'Dancing lights across the northern midnight sky...', 204, '2021-01-22', 'ART051', 'Aurora'),
('BRN056', 'Cascade', 'Falling freely like water over ancient stones...', 189, '2019-10-12', 'ART052', 'Waterfall'),
('BRN057', 'Dusk Till Dawn', 'In the twilight hours when day meets night...', 230, '2022-03-04', 'ART053', 'Twilight'),
('BRN058', 'Echo', 'Your voice reverberates long after you are gone...', 182, '2020-09-18', 'ART054', 'Reverberate'),
('BRN059', 'Forever', 'Time stretches endlessly when I am with you...', 199, '2018-04-23', 'ART055', 'Infinity');

-- Populate COMPOSITORE table
INSERT INTO COMPOSITORE (ID_compositore, nome_d_arte) VALUES
('CMP001', 'Max Martin'),
('CMP002', 'Jack Antonoff'),
('CMP003', 'Aaron Dessner'),
('CMP004', 'Pdogg'),
('CMP005', 'Tainy'),
('CMP006', 'Ian Kirkpatrick');

-- Populate PAROLIERE table
INSERT INTO PAROLIERE (ID_paroliere, nome_d_arte) VALUES
('PAR001', 'Abel Tesfaye'),
('PAR002', 'Taylor Swift'),
('PAR003', 'RM'),
('PAR004', 'Benito Antonio Martínez Ocasio'),
('PAR005', 'Dua Lipa'),
('PAR006', 'Emily Warren');

-- Populate CATEGORIA table
INSERT INTO CATEGORIA (ID_categoria, nome) VALUES
('CAT001', 'Mood'),
('CAT002', 'Tempo'),
('CAT003', 'Genre'),
('CAT004', 'Energy'),
('CAT005', 'Language');

-- Populate OPZIONE_CATEGORIA table
INSERT INTO OPZIONE_CATEGORIA (ID_categoria, opzione) VALUES
('CAT001', 'Happy'),
('CAT001', 'Sad'),
('CAT001', 'Chill'),
('CAT001', 'Energetic'),
('CAT002', 'Slow'),
('CAT002', 'Medium'),
('CAT002', 'Fast'),
('CAT003', 'Pop'),
('CAT003', 'R&B'),
('CAT003', 'Hip Hop'),
('CAT003', 'Rock'),
('CAT003', 'Latin'),
('CAT004', 'Low'),
('CAT004', 'Medium'),
('CAT004', 'High'),
('CAT005', 'English'),
('CAT005', 'Spanish'),
('CAT005', 'Korean');

-- Populate UTENTE table
INSERT INTO UTENTE (email, nome_utente, password, data_nascita, paese) VALUES
('user1@example.com', 'musiclover1', 'securepass123', '1990-05-15', 'United States'),
('user2@example.com', 'rhythmmaster', 'rockstar456', '1995-08-22', 'Canada'),
('user3@example.com', 'beatmaker', 'melody789', '1988-11-30', 'United Kingdom'),
('user4@example.com', 'songbird', 'chorus123', '1992-03-17', 'Australia'),
('user5@example.com', 'djmixer', 'tracks456', '1997-01-25', 'Germany');

-- Populate PLAYLIST table
INSERT INTO PLAYLIST (ID_playlist, titolo, descrizione, Tipo, email) VALUES
('PLS001', 'Workout Hits', 'High energy tracks for your gym session', 'Public', 'user1@example.com'),
('PLS002', 'Chill Vibes', 'Relaxing songs for unwinding', 'Private', 'user1@example.com'),
('PLS003', 'Party Mix', 'Upbeat tracks for celebrations', 'Public', 'user2@example.com'),
('PLS004', 'Study Time', 'Focus-enhancing instrumentals', 'Private', 'user3@example.com'),
('PLS005', 'Road Trip', 'Songs for long drives', 'Public', 'user4@example.com'),
('PLS006', 'Late Night', 'Mellow tunes for after hours', 'Private', 'user5@example.com');

-- Populate VERSIONE_BRANO table
INSERT INTO VERSIONE_BRANO (ID_brano, Tipo, dimensione, sorgente) VALUES
('BRN001', 'HQ', 10240, 'cdn.music.com/hq/BRN001'),
('BRN001', 'MQ', 5120, 'cdn.music.com/mq/BRN001'),
('BRN001', 'LQ', 2560, 'cdn.music.com/lq/BRN001'),
('BRN002', 'HQ', 11520, 'cdn.music.com/hq/BRN002'),
('BRN002', 'MQ', 5760, 'cdn.music.com/mq/BRN002'),
('BRN003', 'HQ', 12800, 'cdn.music.com/hq/BRN003'),
('BRN004', 'HQ', 13312, 'cdn.music.com/hq/BRN004'),
('BRN004', 'MQ', 6656, 'cdn.music.com/mq/BRN004'),
('BRN005', 'HQ', 10752, 'cdn.music.com/hq/BRN005'),
('BRN006', 'HQ', 9728, 'cdn.music.com/hq/BRN006'),
('BRN006', 'MQ', 4864, 'cdn.music.com/mq/BRN006'),
('BRN007', 'HQ', 8704, 'cdn.music.com/hq/BRN007'),
('BRN008', 'HQ', 11008, 'cdn.music.com/hq/BRN008'),
('BRN009', 'HQ', 9216, 'cdn.music.com/hq/BRN009'),
('BRN010', 'HQ', 10086, 'cdn.music.com/hq/BRN010'),
('BRN011', 'HQ', 11469, 'cdn.music.com/hq/BRN011'),
('BRN012', 'HQ', 8294, 'cdn.music.com/hq/BRN012'),
('BRN013', 'HQ', 9369, 'cdn.music.com/hq/BRN013'),
('BRN014', 'HQ', 11309, 'cdn.music.com/hq/BRN014'),
('BRN015', 'HQ', 8910, 'cdn.music.com/hq/BRN015'),
('BRN016', 'HQ', 10547, 'cdn.music.com/hq/BRN016'),
('BRN017', 'HQ', 11008, 'cdn.music.com/hq/BRN017'),
('BRN018', 'HQ', 9882, 'cdn.music.com/hq/BRN018'),
('BRN019', 'HQ', 9677, 'cdn.music.com/hq/BRN019'),
('BRN020', 'HQ', 9062, 'cdn.music.com/hq/BRN020'),
('BRN021', 'HQ', 10342, 'cdn.music.com/hq/BRN021'),
('BRN022', 'HQ', 10803, 'cdn.music.com/hq/BRN022'),
('BRN023', 'HQ', 10137, 'cdn.music.com/hq/BRN023'),
('BRN024', 'HQ', 9571, 'cdn.music.com/hq/BRN024'),
('BRN025', 'HQ', 8862, 'cdn.music.com/hq/BRN025'),
('BRN026', 'HQ', 10973, 'cdn.music.com/hq/BRN026'),
('BRN027', 'HQ', 9830, 'cdn.music.com/hq/BRN027'),
('BRN028', 'HQ', 10682, 'cdn.music.com/hq/BRN028'),
('BRN029', 'HQ', 11520, 'cdn.music.com/hq/BRN029'),
('BRN030', 'HQ', 9728, 'cdn.music.com/hq/BRN030'),
('BRN031', 'HQ', 10362, 'cdn.music.com/hq/BRN031'),
('BRN032', 'HQ', 9634, 'cdn.music.com/hq/BRN032'),
('BRN033', 'HQ', 11059, 'cdn.music.com/hq/BRN033'),
('BRN034', 'HQ', 10291, 'cdn.music.com/hq/BRN034'),
('BRN035', 'HQ', 9421, 'cdn.music.com/hq/BRN035'),
('BRN036', 'HQ', 11213, 'cdn.music.com/hq/BRN036'),
('BRN037', 'HQ', 9984, 'cdn.music.com/hq/BRN037'),
('BRN038', 'HQ', 10691, 'cdn.music.com/hq/BRN038'),
('BRN039', 'HQ', 11366, 'cdn.music.com/hq/BRN039'),
('BRN040', 'HQ', 9216, 'cdn.music.com/hq/BRN040'),
('BRN041', 'HQ', 10496, 'cdn.music.com/hq/BRN041'),
('BRN042', 'HQ', 9882, 'cdn.music.com/hq/BRN042'),
('BRN043', 'HQ', 12237, 'cdn.music.com/hq/BRN043'),
('BRN044', 'HQ', 9114, 'cdn.music.com/hq/BRN044'),
('BRN045', 'HQ', 10602, 'cdn.music.com/hq/BRN045'),
('BRN046', 'HQ', 11571, 'cdn.music.com/hq/BRN046'),
('BRN047', 'HQ', 10137, 'cdn.music.com/hq/BRN047'),
('BRN048', 'HQ', 10886, 'cdn.music.com/hq/BRN048'),
('BRN049', 'HQ', 9472, 'cdn.music.com/hq/BRN049'),
('BRN050', 'HQ', 10752, 'cdn.music.com/hq/BRN050'),
('BRN051', 'HQ', 9728, 'cdn.music.com/hq/BRN051'),
('BRN052', 'HQ', 11264, 'cdn.music.com/hq/BRN052'),
('BRN053', 'HQ', 9779, 'cdn.music.com/hq/BRN053'),
('BRN054', 'HQ', 11110, 'cdn.music.com/hq/BRN054'),
('BRN055', 'HQ', 10445, 'cdn.music.com/hq/BRN055'),
('BRN056', 'HQ', 9677, 'cdn.music.com/hq/BRN056'),
('BRN057', 'HQ', 11776, 'cdn.music.com/hq/BRN057'),
('BRN058', 'HQ', 9318, 'cdn.music.com/hq/BRN058'),
('BRN059', 'HQ', 10189, 'cdn.music.com/hq/BRN059');

-- Populate FREE table
INSERT INTO FREE (email, tempo_attivazione) VALUES
('user3@example.com', '2023-01-15 08:30:00'),
('user5@example.com', '2023-02-22 14:45:00');

-- Populate PREMIUM table
INSERT INTO PREMIUM (email, tempo_attivazione, data_scadenza, Prezzo) VALUES
('user1@example.com', '2025-05-10 10:15:00', '2025-07-10', 9.99),
('user2@example.com', '2023-05-05 16:20:00', '2024-05-05', 9.99),
('user4@example.com', '2023-07-20 12:00:00', '2024-07-20', 14.99);

-- Populate INSERZIONISTA table
INSERT INTO INSERZIONISTA (ID_inserzionista, nome, settore) VALUES
('INS001', 'SodaCorp', 'Beverages'),
('INS002', 'FashionNow', 'Clothing'),
('INS003', 'TechGiant', 'Electronics'),
('INS004', 'FoodDelivery', 'Food Services');

-- Populate PUBBLICITA table
INSERT INTO PUBBLICITA (ID_pubblicita, URL, durata, budget, max_visualizzazioni, ID_inserzionista) VALUES
('PUB001', 'https://ads.example.com/sodacorp/summer', 30, 50000.00, 1000000, 'INS001'),
('PUB002', 'https://ads.example.com/fashionnow/sale', 15, 35000.00, 750000, 'INS002'),
('PUB003', 'https://ads.example.com/techgiant/newphone', 45, 80000.00, 2000000, 'INS003'),
('PUB004', 'https://ads.example.com/fooddelivery/promo', 20, 25000.00, 500000, 'INS004');

-- Populate relationship tables

-- ascolto relation
INSERT INTO ascolto (ID_brano, email) VALUES
-- user1
('BRN001', 'user1@example.com'),
('BRN002', 'user1@example.com'),
('BRN003', 'user1@example.com'),
('BRN004', 'user1@example.com'),
('BRN010', 'user1@example.com'),
('BRN011', 'user1@example.com'),
('BRN012', 'user1@example.com'),
('BRN013', 'user1@example.com'),
('BRN014', 'user1@example.com'),
('BRN015', 'user1@example.com'),

-- user2
('BRN001', 'user2@example.com'),
('BRN008', 'user2@example.com'),
('BRN009', 'user2@example.com'),
('BRN003', 'user2@example.com'),
('BRN005', 'user2@example.com'),
('BRN010', 'user2@example.com'),
('BRN012', 'user2@example.com'),
('BRN016', 'user2@example.com'),
('BRN017', 'user2@example.com'),
('BRN018', 'user2@example.com'),

-- user3
('BRN005', 'user3@example.com'),
('BRN006', 'user3@example.com'),
('BRN011', 'user3@example.com'),
('BRN012', 'user3@example.com'),
('BRN013', 'user3@example.com'),
('BRN014', 'user3@example.com'),
('BRN017', 'user3@example.com'),
('BRN018', 'user3@example.com'),
('BRN019', 'user3@example.com'),
('BRN020', 'user3@example.com'),

-- user4
('BRN007', 'user4@example.com'),
('BRN008', 'user4@example.com'),
('BRN009', 'user4@example.com'),
('BRN014', 'user4@example.com'),
('BRN015', 'user4@example.com'),
('BRN016', 'user4@example.com'),
('BRN017', 'user4@example.com'),
('BRN021', 'user4@example.com'),
('BRN022', 'user4@example.com'),
('BRN023', 'user4@example.com'),

-- user5
('BRN002', 'user5@example.com'),
('BRN004', 'user5@example.com'),
('BRN001', 'user5@example.com'),
('BRN006', 'user5@example.com'),
('BRN010', 'user5@example.com'),
('BRN013', 'user5@example.com'),
('BRN020', 'user5@example.com'),
('BRN021', 'user5@example.com'),
('BRN022', 'user5@example.com'),
('BRN024', 'user5@example.com');

-- classificazione relation
INSERT INTO classificazione (ID_brano, ID_categoria, opzione) VALUES
('BRN001', 'CAT001', 'Energetic'),
('BRN001', 'CAT002', 'Fast'),
('BRN001', 'CAT003', 'Pop'),
('BRN001', 'CAT004', 'High'),
('BRN001', 'CAT005', 'English'),
('BRN002', 'CAT001', 'Sad'),
('BRN002', 'CAT002', 'Medium'),
('BRN002', 'CAT003', 'Pop'),
('BRN003', 'CAT001', 'Energetic'),
('BRN003', 'CAT004', 'High'),
('BRN004', 'CAT001', 'Sad'),
('BRN004', 'CAT002', 'Slow'),
('BRN005', 'CAT001', 'Sad'),
('BRN005', 'CAT003', 'Pop'),
('BRN006', 'CAT005', 'Korean'),
('BRN007', 'CAT005', 'Spanish'),
('BRN008', 'CAT001', 'Happy'),
('BRN008', 'CAT004', 'High'),
('BRN009', 'CAT001', 'Energetic'),
('BRN009', 'CAT002', 'Fast'),
-- BRN010 - Midnight Sky (Miley Cyrus)
('BRN010', 'CAT001', 'Energetic'),
('BRN010', 'CAT002', 'Medium'),
('BRN010', 'CAT003', 'Pop'),
('BRN010', 'CAT004', 'High'),
('BRN010', 'CAT005', 'English'),

-- BRN011 - Golden Hour (Kacey Musgraves)
('BRN011', 'CAT001', 'Chill'),
('BRN011', 'CAT002', 'Slow'),
('BRN011', 'CAT003', 'Pop'),
('BRN011', 'CAT005', 'English'),

-- BRN012 - Sunflower (Post Malone & Swae Lee)
('BRN012', 'CAT001', 'Chill'),
('BRN012', 'CAT002', 'Medium'),
('BRN012', 'CAT003', 'Hip Hop'),
('BRN012', 'CAT005', 'English'),

-- BRN013 - Circles (Post Malone)
('BRN013', 'CAT001', 'Sad'),
('BRN013', 'CAT002', 'Medium'),
('BRN013', 'CAT003', 'Pop'),
('BRN013', 'CAT005', 'English'),

-- BRN014 - Supermarket Flowers (Ed Sheeran)
('BRN014', 'CAT001', 'Sad'),
('BRN014', 'CAT002', 'Slow'),
('BRN014', 'CAT004', 'Low'),
('BRN014', 'CAT005', 'English'),

-- BRN015 - Watermelon Sugar (Harry Styles)
('BRN015', 'CAT001', 'Happy'),
('BRN015', 'CAT002', 'Medium'),
('BRN015', 'CAT003', 'Pop'),
('BRN015', 'CAT005', 'English'),

-- BRN016 - Lose You To Love Me (Selena Gomez)
('BRN016', 'CAT001', 'Sad'),
('BRN016', 'CAT002', 'Slow'),
('BRN016', 'CAT005', 'English'),

-- BRN017 - Before You Go (Lewis Capaldi)
('BRN017', 'CAT001', 'Sad'),
('BRN017', 'CAT002', 'Medium'),
('BRN017', 'CAT004', 'High'),
('BRN017', 'CAT005', 'English'),

-- BRN018 - Summer Days (Martin Garrix)
('BRN018', 'CAT001', 'Happy'),
('BRN018', 'CAT002', 'Fast'),
('BRN018', 'CAT004', 'High'),
('BRN018', 'CAT005', 'English'),

-- BRN019 - Memories (Maroon 5)
('BRN019', 'CAT001', 'Sad'),
('BRN019', 'CAT002', 'Medium'),
('BRN019', 'CAT003', 'Pop'),
('BRN019', 'CAT005', 'English'),

-- BRN020 - Breaking Free (Christina Aguilera)
('BRN020', 'CAT001', 'Energetic'),
('BRN020', 'CAT004', 'High'),
('BRN020', 'CAT005', 'English'),

-- BRN021 - Euphoria (Jungkook)
('BRN021', 'CAT001', 'Happy'),
('BRN021', 'CAT002', 'Fast'),
('BRN021', 'CAT003', 'Pop'),
('BRN021', 'CAT005', 'Korean'),

-- BRN022 - Wildest Dreams (Tame Impala)
('BRN022', 'CAT001', 'Chill'),
('BRN022', 'CAT002', 'Medium'),
('BRN022', 'CAT003', 'Rock'),
('BRN022', 'CAT005', 'English'),

-- BRN023 - Ocean Eyes (Billie Eilish)
('BRN023', 'CAT001', 'Sad'),
('BRN023', 'CAT002', 'Slow'),
('BRN023', 'CAT004', 'Low'),
('BRN023', 'CAT005', 'English'),

-- BRN024 - Moonlight (Ariana Grande)
('BRN024', 'CAT001', 'Chill'),
('BRN024', 'CAT002', 'Medium'),
('BRN024', 'CAT003', 'R&B'),
('BRN024', 'CAT005', 'English'),

-- BRN025 - Fireflies (Owl City)
('BRN025', 'CAT001', 'Happy'),
('BRN025', 'CAT002', 'Medium'),
('BRN025', 'CAT003', 'Pop'),
('BRN025', 'CAT005', 'English'),

-- BRN026 - Rainbow (Kesha)
('BRN026', 'CAT001', 'Happy'),
('BRN026', 'CAT002', 'Medium'),
('BRN026', 'CAT005', 'English'),

-- BRN027 - Starlight (Coldplay)
('BRN027', 'CAT001', 'Energetic'),
('BRN027', 'CAT002', 'Fast'),
('BRN027', 'CAT003', 'Rock'),
('BRN027', 'CAT005', 'English'),

-- BRN028 - Butterfly Effect (Travis Scott)
('BRN028', 'CAT001', 'Energetic'),
('BRN028', 'CAT002', 'Medium'),
('BRN028', 'CAT003', 'Hip Hop'),
('BRN028', 'CAT005', 'English'),

-- BRN029 - Aurora (Aurora)
('BRN029', 'CAT001', 'Chill'),
('BRN029', 'CAT002', 'Slow'),
('BRN029', 'CAT004', 'Medium'),
('BRN029', 'CAT005', 'English'),

-- BRN030 - Crystalline (Imagine Dragons)
('BRN030', 'CAT001', 'Energetic'),
('BRN030', 'CAT003', 'Rock'),
('BRN030', 'CAT004', 'High'),
('BRN030', 'CAT005', 'English'),

-- BRN031 - Desert Rose (Sting)
('BRN031', 'CAT001', 'Chill'),
('BRN031', 'CAT002', 'Medium'),
('BRN031', 'CAT003', 'Pop'),
('BRN031', 'CAT005', 'English'),

-- BRN032 - Electric Soul (Daft Punk)
('BRN032', 'CAT001', 'Energetic'),
('BRN032', 'CAT002', 'Fast'),
('BRN032', 'CAT003', 'Pop'),
('BRN032', 'CAT005', 'English'),

-- BRN033 - Frozen Time (Alicia Keys)
('BRN033', 'CAT001', 'Sad'),
('BRN033', 'CAT002', 'Slow'),
('BRN033', 'CAT003', 'R&B'),
('BRN033', 'CAT005', 'English'),

-- BRN034 - Gravity (OneRepublic)
('BRN034', 'CAT001', 'Chill'),
('BRN034', 'CAT002', 'Medium'),
('BRN034', 'CAT003', 'Pop'),
('BRN034', 'CAT005', 'English'),

-- BRN035 - Heartbeat (Lady Gaga)
('BRN035', 'CAT001', 'Energetic'),
('BRN035', 'CAT002', 'Fast'),
('BRN035', 'CAT003', 'Pop'),
('BRN035', 'CAT004', 'High'),
('BRN035', 'CAT005', 'English'),

-- BRN036 - Infinity (Beyoncé)
('BRN036', 'CAT001', 'Energetic'),
('BRN036', 'CAT003', 'R&B'),
('BRN036', 'CAT004', 'High'),
('BRN036', 'CAT005', 'English'),

-- BRN037 - Jungle Dreams (Jungle)
('BRN037', 'CAT001', 'Chill'),
('BRN037', 'CAT002', 'Medium'),
('BRN037', 'CAT003', 'R&B'),
('BRN037', 'CAT005', 'English'),

-- BRN038 - Kaleidoscope (Sia)
('BRN038', 'CAT001', 'Happy'),
('BRN038', 'CAT002', 'Medium'),
('BRN038', 'CAT003', 'Pop'),
('BRN038', 'CAT005', 'English'),

-- BRN039 - Labyrinth (David Bowie)
('BRN039', 'CAT001', 'Chill'),
('BRN039', 'CAT002', 'Medium'),
('BRN039', 'CAT003', 'Rock'),
('BRN039', 'CAT005', 'English'),

-- BRN040 - Mirage (The Weeknd & Daft Punk)
('BRN040', 'CAT001', 'Chill'),
('BRN040', 'CAT002', 'Medium'),
('BRN040', 'CAT003', 'R&B'),
('BRN040', 'CAT005', 'English'),

-- BRN041 - Nebula (Muse)
('BRN041', 'CAT001', 'Energetic'),
('BRN041', 'CAT002', 'Fast'),
('BRN041', 'CAT003', 'Rock'),
('BRN041', 'CAT005', 'English'),

-- BRN042 - Oxygen (Jorja Smith)
('BRN042', 'CAT001', 'Chill'),
('BRN042', 'CAT003', 'R&B'),
('BRN042', 'CAT004', 'Medium'),
('BRN042', 'CAT005', 'English'),

-- BRN043 - Phoenix (Linkin Park)
('BRN043', 'CAT001', 'Energetic'),
('BRN043', 'CAT002', 'Fast'),
('BRN043', 'CAT003', 'Rock'),
('BRN043', 'CAT004', 'High'),
('BRN043', 'CAT005', 'English'),

-- BRN044 - Quicksilver (Bruno Mars)
('BRN044', 'CAT001', 'Happy'),
('BRN044', 'CAT002', 'Fast'),
('BRN044', 'CAT003', 'Pop'),
('BRN044', 'CAT005', 'English'),

-- BRN045 - Radiance (Rihanna)
('BRN045', 'CAT001', 'Energetic'),
('BRN045', 'CAT002', 'Medium'),
('BRN045', 'CAT003', 'R&B'),
('BRN045', 'CAT005', 'English'),

-- BRN046 - Serenity (Enya)
('BRN046', 'CAT001', 'Chill'),
('BRN046', 'CAT002', 'Slow'),
('BRN046', 'CAT004', 'Low'),
('BRN046', 'CAT005', 'English'),

-- BRN047 - Tempest (Florence + The Machine)
('BRN047', 'CAT001', 'Energetic'),
('BRN047', 'CAT002', 'Fast'),
('BRN047', 'CAT003', 'Rock'),
('BRN047', 'CAT005', 'English'),

-- BRN048 - Ultraviolet (Radiohead)
('BRN048', 'CAT001', 'Chill'),
('BRN048', 'CAT002', 'Medium'),
('BRN048', 'CAT003', 'Rock'),
('BRN048', 'CAT005', 'English'),

-- BRN049 - Velocity (The Chainsmokers)
('BRN049', 'CAT001', 'Energetic'),
('BRN049', 'CAT002', 'Fast'),
('BRN049', 'CAT004', 'High'),
('BRN049', 'CAT005', 'English'),

-- BRN050 - Wanderlust (Lana Del Rey)
('BRN050', 'CAT001', 'Chill'),
('BRN050', 'CAT002', 'Medium'),
('BRN050', 'CAT003', 'Pop'),
('BRN050', 'CAT005', 'English'),

-- BRN051 - Xenon (Mika)
('BRN051', 'CAT001', 'Happy'),
('BRN051', 'CAT002', 'Fast'),
('BRN051', 'CAT003', 'Pop'),
('BRN051', 'CAT005', 'English'),

-- BRN052 - Yesterday (Adele)
('BRN052', 'CAT001', 'Sad'),
('BRN052', 'CAT002', 'Slow'),
('BRN052', 'CAT004', 'Medium'),
('BRN052', 'CAT005', 'English'),

-- BRN053 - Zenith (Kings of Leon)
('BRN053', 'CAT001', 'Energetic'),
('BRN053', 'CAT002', 'Medium'),
('BRN053', 'CAT003', 'Rock'),
('BRN053', 'CAT005', 'English'),

-- BRN054 - Albatross (Fleetwood Mac)
('BRN054', 'CAT001', 'Chill'),
('BRN054', 'CAT002', 'Slow'),
('BRN054', 'CAT003', 'Rock'),
('BRN054', 'CAT005', 'English'),

-- BRN055 - Borealis (Sigur Rós)
('BRN055', 'CAT001', 'Chill'),
('BRN055', 'CAT002', 'Slow'),
('BRN055', 'CAT004', 'Low'),
('BRN055', 'CAT005', 'English'),

-- BRN056 - Cascade (Jónsi)
('BRN056', 'CAT001', 'Chill'),
('BRN056', 'CAT002', 'Medium'),
('BRN056', 'CAT004', 'Medium'),
('BRN056', 'CAT005', 'English'),

-- BRN057 - Dusk Till Dawn (ZAYN)
('BRN057', 'CAT001', 'Energetic'),
('BRN057', 'CAT002', 'Medium'),
('BRN057', 'CAT003', 'Pop'),
('BRN057', 'CAT004', 'High'),
('BRN057', 'CAT005', 'English'),

-- BRN058 - Echo (Eminem)
('BRN058', 'CAT001', 'Energetic'),
('BRN058', 'CAT002', 'Fast'),
('BRN058', 'CAT003', 'Hip Hop'),
('BRN058', 'CAT005', 'English'),

-- BRN059 - Forever (The Lumineers)
('BRN059', 'CAT001', 'Chill'),
('BRN059', 'CAT002', 'Medium'),
('BRN059', 'CAT003', 'Rock'),
('BRN059', 'CAT005', 'English');

-- cogliere relation
INSERT INTO cogliere (ID_brano, ID_playlist) VALUES
('BRN001', 'PLS001'),
('BRN003', 'PLS001'),
('BRN008', 'PLS001'),
('BRN009', 'PLS001'),
('BRN002', 'PLS002'),
('BRN004', 'PLS002'),
('BRN001', 'PLS003'),
('BRN007', 'PLS003'),
('BRN008', 'PLS003'),
('BRN009', 'PLS003'),
('BRN004', 'PLS004'),
('BRN006', 'PLS004'),
('BRN001', 'PLS005'),
('BRN003', 'PLS005'),
('BRN008', 'PLS005'),
('BRN002', 'PLS006'),
('BRN004', 'PLS006');

-- composizione relation
INSERT INTO composizione (ID_brano, ID_compositore) VALUES
('BRN001', 'CMP001'),
('BRN002', 'CMP001'),
('BRN003', 'CMP001'),
('BRN004', 'CMP003'),
('BRN005', 'CMP002'),
('BRN006', 'CMP004'),
('BRN007', 'CMP005'),
('BRN008', 'CMP006'),
('BRN009', 'CMP006'),
('BRN010', 'CMP004'),
('BRN011', 'CMP003'),
('BRN012', 'CMP005'),
('BRN013', 'CMP001'),
('BRN014', 'CMP002'),
('BRN015', 'CMP006'),
('BRN016', 'CMP004'),
('BRN017', 'CMP003'),
('BRN018', 'CMP005'),
('BRN019', 'CMP001'),
('BRN020', 'CMP002'),
('BRN021', 'CMP006'),
('BRN022', 'CMP004'),
('BRN023', 'CMP003'),
('BRN024', 'CMP005'),
('BRN025', 'CMP001'),
('BRN026', 'CMP002'),
('BRN027', 'CMP006'),
('BRN028', 'CMP004'),
('BRN029', 'CMP003'),
('BRN030', 'CMP005'),
('BRN031', 'CMP001'),
('BRN032', 'CMP002'),
('BRN033', 'CMP006'),
('BRN034', 'CMP004'),
('BRN035', 'CMP003'),
('BRN036', 'CMP005'),
('BRN037', 'CMP001'),
('BRN038', 'CMP002'),
('BRN039', 'CMP006'),
('BRN040', 'CMP004'),
('BRN041', 'CMP003'),
('BRN042', 'CMP005'),
('BRN043', 'CMP001'),
('BRN044', 'CMP002'),
('BRN045', 'CMP006'),
('BRN046', 'CMP004'),
('BRN047', 'CMP003'),
('BRN048', 'CMP005'),
('BRN049', 'CMP001'),
('BRN050', 'CMP002'),
('BRN051', 'CMP006'),
('BRN052', 'CMP004'),
('BRN053', 'CMP003'),
('BRN054', 'CMP005'),
('BRN055', 'CMP001'),
('BRN056', 'CMP002'),
('BRN057', 'CMP006'),
('BRN058', 'CMP004'),
('BRN059', 'CMP003');

-- esecuzione relation
INSERT INTO esecuzione (ID_artista, ID_brano) VALUES
('ART001', 'BRN001'),
('ART001', 'BRN002'),
('ART001', 'BRN003'),
('ART002', 'BRN004'),
('ART002', 'BRN005'),
('ART003', 'BRN006'),
('ART004', 'BRN007'),
('ART005', 'BRN008'),
('ART005', 'BRN009'),
('ART006', 'BRN010'),
('ART007', 'BRN011'),
('ART008', 'BRN012'),
('ART009', 'BRN013'),
('ART010', 'BRN014'),
('ART011', 'BRN015'),
('ART012', 'BRN016'),
('ART013', 'BRN017'),
('ART014', 'BRN018'),
('ART015', 'BRN019'),
('ART016', 'BRN020'),
('ART017', 'BRN021'),
('ART018', 'BRN022'),
('ART019', 'BRN023'),
('ART020', 'BRN024'),
('ART021', 'BRN025'),
('ART022', 'BRN026'),
('ART023', 'BRN027'),
('ART024', 'BRN028'),
('ART025', 'BRN029'),
('ART026', 'BRN030'),
('ART027', 'BRN031'),
('ART028', 'BRN032'),
('ART029', 'BRN033'),
('ART030', 'BRN034'),
('ART031', 'BRN035'),
('ART032', 'BRN036'),
('ART033', 'BRN037'),
('ART034', 'BRN038'),
('ART035', 'BRN039'),
('ART036', 'BRN040'),
('ART037', 'BRN041'),
('ART038', 'BRN042'),
('ART039', 'BRN043'),
('ART040', 'BRN044'),
('ART041', 'BRN045'),
('ART042', 'BRN046'),
('ART043', 'BRN047'),
('ART044', 'BRN048'),
('ART045', 'BRN049'),
('ART046', 'BRN050'),
('ART047', 'BRN051'),
('ART048', 'BRN052'),
('ART049', 'BRN053'),
('ART050', 'BRN054'),
('ART051', 'BRN055'),
('ART052', 'BRN056'),
('ART053', 'BRN057'),
('ART054', 'BRN058'),
('ART055', 'BRN059');

-- proiettare relation
INSERT INTO proiettare (ID_pubblicita, email, data_proiezione) VALUES
('PUB001', 'user3@example.com', '2023-04-15 09:30:00'),
('PUB002', 'user3@example.com', '2023-04-10 14:20:00'),
('PUB003', 'user3@example.com', '2023-03-25 18:45:00'),
('PUB003', 'user4@example.com', '2023-07-15 11:30:00'),
('PUB001', 'user5@example.com', '2023-06-05 08:15:00'),
('PUB001', 'user2@example.com', '2023-05-01 10:00:00'),
('PUB002', 'user5@example.com', '2023-06-10 16:45:00'),
('PUB002', 'user1@example.com', '2023-05-05 13:20:00'),
('PUB002', 'user1@example.com', '2023-05-05 14:20:00'),
('PUB004', 'user5@example.com', '2023-06-15 19:30:00');

-- scrittura relation
INSERT INTO scrittura (ID_brano, ID_paroliere) VALUES
('BRN001', 'PAR001'),
('BRN002', 'PAR001'),
('BRN003', 'PAR001'),
('BRN004', 'PAR002'),
('BRN005', 'PAR002'),
('BRN006', 'PAR003'),
('BRN007', 'PAR004'),
('BRN008', 'PAR005'),
('BRN008', 'PAR006'),
('BRN009', 'PAR005');
