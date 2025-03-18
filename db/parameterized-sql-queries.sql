-- 1. Registrazione di un nuovo utente
INSERT INTO UTENTE (email, nome_utente, password, data_nascita, paese)
VALUES (?, ?, ?, ?, ?);

-- Registrazione come utente free
INSERT INTO FREE (email, tempo_attivazione)
VALUES (?, NOW());

-- 2. Login di un utente
SELECT email
FROM UTENTE
WHERE email = ? AND password = ?;

-- 3. Creare una playlist
INSERT INTO PLAYLIST (ID_playlist, titolo, descrizione, Tipo, email)
VALUES (?, ?, ?, ?, ?);

-- 4. Acquisto di un abbonamento premium
INSERT INTO PREMIUM (email, tempo_attivazione, data_scadenza, Prezzo)
VALUES (?, NOW(), ?, ?);

-- 5. Visualizzare i brani di una playlist
SELECT b.ID_brano, b.titolo, b.durata, b.data_uscita, a.nome_d_arte
FROM BRANO b
JOIN cogliere c ON b.ID_brano = c.ID_brano
JOIN esecuzione e ON b.ID_brano = e.ID_brano
JOIN ARTISTA a ON e.ID_artista = a.ID_artista
WHERE c.ID_playlist = ?
ORDER BY b.titolo;

-- 6. Creare un Daily Mix personalizzato in base alla percentuale di ascolti dell'utente per genere musicale
-- Prima trova i generi più ascoltati dall'utente
WITH GeneriUtente AS (
    SELECT a.generi_musicali, COUNT(*) as conteggio
    FROM ascolto asc
    JOIN BRANO b ON asc.ID_brano = b.ID_brano
    JOIN esecuzione e ON b.ID_brano = e.ID_brano
    JOIN ARTISTA a ON e.ID_artista = a.ID_artista
    WHERE asc.email = ?
    GROUP BY a.generi_musicali
    ORDER BY conteggio DESC
)

-- Poi seleziona brani basati su questi generi
SELECT b.ID_brano, b.titolo, a.nome_d_arte
FROM BRANO b
JOIN esecuzione e ON b.ID_brano = e.ID_brano
JOIN ARTISTA a ON e.ID_artista = a.ID_artista
WHERE a.generi_musicali IN (
    SELECT generi_musicali
    FROM GeneriUtente
    LIMIT 3 -- Considera i top 3 generi
)
AND b.ID_brano NOT IN (
    SELECT ID_brano
    FROM ascolto
    WHERE email = ?
)
ORDER BY RAND()
LIMIT 30; -- Crea un mix di 30 brani

-- 7. Ottenere la percentuale di utenti premium rispetto a quelli free
SELECT 
    (COUNT(DISTINCT p.email) * 100.0 / COUNT(DISTINCT u.email)) AS percentuale_premium
FROM 
    UTENTE u
LEFT JOIN 
    (
        SELECT email
        FROM PREMIUM
        WHERE data_scadenza >= CURDATE()
        GROUP BY email
    ) p ON u.email = p.email;

-- 8. Calcolare il numero medio di pubblicità visualizzate prima di un abbonamento premium
SELECT 
    AVG(num_pubblicita) AS media_pubblicita_prima_premium
FROM (
    SELECT 
        p.email,
        COUNT(pr.ID_pubblicita) AS num_pubblicita
    FROM 
        PREMIUM p
    LEFT JOIN 
        proiettare pr ON p.email = pr.email AND pr.n_proiezione < p.tempo_attivazione
    GROUP BY 
        p.email
) AS conteggio_pubblicita;

-- 9. Aggiungere un brano in un'opzione di una certa categoria
INSERT INTO classificazione (ID_brano, ID_categoria, opzione)
VALUES (?, ?, ?);

-- 10. Visualizzare l'elenco degli utenti registrati
SELECT email, nome_utente, data_nascita, paese, 
    CASE 
        WHEN EXISTS (
            SELECT 1 FROM PREMIUM p 
            WHERE p.email = u.email AND p.data_scadenza >= CURDATE()
        ) THEN 'Premium'
        ELSE 'Free'
    END AS tipo_account
FROM UTENTE u
ORDER BY nome_utente;

-- 11. Aggiungere un brano
-- Aggiungere un brano
INSERT INTO BRANO (ID_brano, titolo, testo, durata, data_uscita, Tra_ID_artista, Tra_titolo)
VALUES (?, ?, ?, ?, ?, ?, ?);

-- Aggiungere le relazioni per il nuovo brano
-- Esempio: collegare il brano a un artista esecutore
INSERT INTO esecuzione (ID_artista, ID_brano)
VALUES (?, ?);

-- Esempio: collegare il brano a un compositore
INSERT INTO composizione (ID_brano, ID_compositore)
VALUES (?, ?);

-- Esempio: collegare il brano a un paroliere
INSERT INTO scrittura (ID_brano, ID_paroliere)
VALUES (?, ?);

-- Esempio: aggiungere una versione del brano
INSERT INTO VERSIONE_BRANO (ID_brano, Tipo, dimensione, sorgente)
VALUES (?, ?, ?, ?);

-- 12. Aggiungere o rimuovere album
-- Aggiungere un album
INSERT INTO ALBUM (ID_artista, titolo, descrizione)
VALUES (?, ?, ?);

-- Rimuovere un album (prima rimuovere i brani legati all'album)
-- Prima seleziona i brani associati all'album
SELECT ID_brano 
FROM BRANO 
WHERE Tra_ID_artista = ? AND Tra_titolo = ?;

-- Poi per ogni brano, elimina le relazioni
-- (queste operazioni dovrebbero essere eseguite per ogni ID_brano trovato)
DELETE FROM ascolto WHERE ID_brano IN (SELECT ID_brano FROM BRANO WHERE Tra_ID_artista = ? AND Tra_titolo = ?);
DELETE FROM classificazione WHERE ID_brano IN (SELECT ID_brano FROM BRANO WHERE Tra_ID_artista = ? AND Tra_titolo = ?);
DELETE FROM cogliere WHERE ID_brano IN (SELECT ID_brano FROM BRANO WHERE Tra_ID_artista = ? AND Tra_titolo = ?);
DELETE FROM composizione WHERE ID_brano IN (SELECT ID_brano FROM BRANO WHERE Tra_ID_artista = ? AND Tra_titolo = ?);
DELETE FROM esecuzione WHERE ID_brano IN (SELECT ID_brano FROM BRANO WHERE Tra_ID_artista = ? AND Tra_titolo = ?);
DELETE FROM scrittura WHERE ID_brano IN (SELECT ID_brano FROM BRANO WHERE Tra_ID_artista = ? AND Tra_titolo = ?);
DELETE FROM VERSIONE_BRANO WHERE ID_brano IN (SELECT ID_brano FROM BRANO WHERE Tra_ID_artista = ? AND Tra_titolo = ?);

-- Infine elimina i brani e l'album
DELETE FROM BRANO WHERE Tra_ID_artista = ? AND Tra_titolo = ?;
DELETE FROM ALBUM WHERE ID_artista = ? AND titolo = ?;