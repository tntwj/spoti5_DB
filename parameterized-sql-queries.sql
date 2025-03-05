-- 1. Registrazione di un nuovo utente
INSERT INTO UTENTE (email, nome_utente, password, data_nascita, paese)
VALUES (?, ?, ?, ?, ?);

-- 2. Login di un utente (query di verifica)
SELECT email
FROM UTENTE
WHERE email = ? AND password = ?;

-- 3. Creare una playlist
INSERT INTO PLAYLIST (ID_playlist, titolo, descrizione, Tipo, numero_brani, email)
VALUES (?, ?, ?, ?, ?, ?);

-- 4. Aggiungere un brano nella determinata playlist
-- Prima controlliamo che il brano esista
SELECT ID_brano FROM BRANO WHERE ID_brano = ?;
-- Poi aggiungiamo il brano alla playlist
INSERT INTO cogliere (ID_brano, ID_playlist)
VALUES (?, ?);
-- Aggiorniamo il contatore dei brani nella playlist
UPDATE PLAYLIST
SET numero_brani = numero_brani + 1
WHERE ID_playlist = ?;

-- 5. Selezionare i brani ascoltati dall'utente
SELECT b.ID_brano, b.titolo, b.durata
FROM BRANO b
JOIN ascolto a ON b.ID_brano = a.ID_brano
WHERE a.email = ?;

-- 6. Aggiungere un brano in un'opzione di una certa categoria
-- Verifichiamo che l'opzione della categoria esista
SELECT * FROM OPZIONE_CATEGORIA 
WHERE ID_categoria = ? AND opzione = ?;
-- Poi aggiungiamo la classificazione
INSERT INTO classificazione (ID_brano, ID_categoria, opzione)
VALUES (?, ?, ?);

-- 7. Acquisto di un abbonamento premium
INSERT INTO PREMIUM (email, tempo_attivazione, data_scadenza, Prezzo)
VALUES (?, NOW(), DATE_ADD(NOW(), INTERVAL ? MONTH), ?);

-- 8. Visualizzare i brani di una playlist
SELECT b.ID_brano, b.titolo, b.durata, b.data_uscita
FROM BRANO b
JOIN cogliere c ON b.ID_brano = c.ID_brano
WHERE c.ID_playlist = ?;

-- 9. Creare una Dailymix dedicato ad un utente
-- Prima creiamo la playlist dailymix
INSERT INTO PLAYLIST (ID_playlist, titolo, descrizione, Tipo, numero_brani, email)
VALUES (?, ?, ?, 'DailyMix', 0, ?);

-- Poi inseriamo brani basati sugli ascolti dell'utente (esempio semplificato)
INSERT INTO cogliere (ID_brano, ID_playlist)
SELECT DISTINCT a.ID_brano, ?
FROM ascolto a
JOIN classificazione c ON a.ID_brano = c.ID_brano
WHERE a.email = ?
LIMIT ?;

-- Aggiorniamo il contatore dei brani
UPDATE PLAYLIST
SET numero_brani = (SELECT COUNT(*) FROM cogliere WHERE ID_playlist = ?)
WHERE ID_playlist = ?;

-- 10. Visualizzare gli album di un artista
SELECT titolo, descrizione, durata_riproduzione, numero_brani
FROM ALBUM
WHERE ID_artista = ?;

-- 11. Visualizzare i brani in un album
SELECT b.ID_brano, b.titolo, b.durata
FROM BRANO b
WHERE b.Tra_ID_artista = ? AND b.Tra_titolo = ?;

-- 12. Visualizzare i partecipanti che hanno contribuito al brano
-- Compositori
SELECT c.nome_d_arte
FROM COMPOSITORE c
JOIN composizione co ON c.ID_compositore = co.ID_compositore
WHERE co.ID_brano = ?

UNION

-- Parolieri
SELECT p.nome_d_arte
FROM PAROLIERE p
JOIN scrittura s ON p.ID_paroliere = s.ID_paroliere
WHERE s.ID_brano = ?

UNION

-- Artisti esecutori
SELECT a.nome_d_arte
FROM ARTISTA a
JOIN esecuzione e ON a.ID_artista = e.ID_artista
WHERE e.ID_brano = ?;

-- 13. Mostra una pubblicità all'utente
-- Selezioniamo una pubblicità per l'utente che non ha raggiunto il massimo di visualizzazioni
SELECT p.ID_pubblicita, p.URL, p.durata
FROM PUBBLICITA p
WHERE p.max_visualizzazioni > (
    SELECT COALESCE(SUM(pr.conta_views), 0)
    FROM proiettare pr
    WHERE pr.ID_pubblicita = p.ID_pubblicita
)
ORDER BY RAND()
LIMIT ?;

-- Registriamo la visualizzazione
INSERT INTO proiettare (ID_pubblicita, email, conta_views)
VALUES (?, ?, ?)
ON DUPLICATE KEY UPDATE conta_views = conta_views + 1;
