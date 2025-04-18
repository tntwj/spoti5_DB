-- Use the database
USE spoti5;

-- Populate ARTISTA table
INSERT INTO ARTISTA (ID_artista, nome_d_arte, descrizione, generi_musicali, followers, data_fondazione) VALUES
('ART001', 'The Weeknd', 'Canadian singer, songwriter, and record producer', 'R&B, Pop, Alternative R&B', 45000000, '2010-01-15'),
('ART002', 'Taylor Swift', 'American singer-songwriter known for narrative songs', 'Pop, Country, Folk, Rock', 85000000, '2006-06-09'),
('ART003', 'BTS', 'South Korean boy band with a global fanbase', 'K-pop, Hip hop, R&B, EDM', 70000000, '2013-06-13'),
('ART004', 'Bad Bunny', 'Puerto Rican rapper and singer', 'Reggaeton, Latin trap, Hip hop', 38000000, '2016-08-24'),
('ART005', 'Dua Lipa', 'English singer and songwriter', 'Pop, Dance, Disco', 29000000, '2015-05-10');

-- Populate ALBUM table
INSERT INTO ALBUM (ID_artista, titolo, descrizione) VALUES
('ART001', 'After Hours', 'Fourth studio album featuring dark wave and dream pop elements'),
('ART001', 'Dawn FM', 'Concept album with a radio station format'),
('ART002', 'Folklore', 'Indie folk album written during pandemic'),
('ART002', 'Midnights', 'Pop album exploring themes of self-loathing and fantasy'),
('ART003', 'Map of the Soul: 7', 'Studio album exploring Jungian psychology'),
('ART004', 'Un Verano Sin Ti', 'Summer-themed album with reggaeton, merengue, and indie pop'),
('ART005', 'Future Nostalgia', 'Disco-influenced dance-pop album');

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
('BRN009', 'Don''t Start Now', 'Did a full 180, crazy...', 183, '2019-11-01', 'ART005', 'Future Nostalgia');

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
('BRN009', 'HQ', 9216, 'cdn.music.com/hq/BRN009');

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
('BRN001', 'user1@example.com'),
('BRN002', 'user1@example.com'),
('BRN003', 'user1@example.com'),
('BRN004', 'user1@example.com'),
('BRN001', 'user2@example.com'),
('BRN008', 'user2@example.com'),
('BRN009', 'user2@example.com'),
('BRN005', 'user3@example.com'),
('BRN006', 'user3@example.com'),
('BRN007', 'user4@example.com'),
('BRN008', 'user4@example.com'),
('BRN009', 'user4@example.com'),
('BRN002', 'user5@example.com'),
('BRN004', 'user5@example.com');

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
('BRN009', 'CAT002', 'Fast');

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
('BRN009', 'CMP006');

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
('ART005', 'BRN009');

-- proiettare relation
INSERT INTO proiettare (ID_pubblicita, email, n_proiezione) VALUES
('PUB001', 'user3@example.com', 3),
('PUB002', 'user3@example.com', 1),
('PUB003', 'user3@example.com', 1),
('PUB001', 'user5@example.com', 1),
('PUB002', 'user5@example.com', 1),
('PUB004', 'user5@example.com', 1);

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
