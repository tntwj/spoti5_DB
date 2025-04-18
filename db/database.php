<?php

class DataBaseHelper {
    private $db ;
    public function __construct($servername, $username, $password, $dbname, $port) {
        $this->db = new mysqli($servername, $username, $password, $dbname, $port);
        if ($this->db->connect_error) {
            die("Connection failed: " . $this->db->connect_error);
        }
    }
    // Registrazione di un nuovo utente
    public function registerUser($email, $nome_utente, $password, $data_nascita, $paese) {
        // Validate and format the date of birth
        $date = DateTime::createFromFormat('Y-m-d', $data_nascita);
        if ($date === false) {
            return false; // Return false if the date format is invalid
        }
        $data_nascita = $date->format('Y-m-d'); // Ensure the date is in 'Y-m-d' format
        $stmt = $this->db->prepare("INSERT INTO UTENTE (email, nome_utente, password, data_nascita, paese) VALUES (?, ?, ?, ?, ?)");
        $stmt->bind_param("sssss", $email, $nome_utente, $password, $data_nascita, $paese);
        if ($stmt->execute()) { // Check if the first insert was successful
            $stmt = $this->db->prepare("INSERT INTO FREE (email, tempo_attivazione) VALUES (?, NOW())");
            $stmt->bind_param("s", $email);
            $stmt->execute();
            return true; // Return true if both inserts succeed
        }
        return false; // Return false if the first insert fails
    }

    public function loginUser($email, $password) {
        $stmt = $this->db->prepare("SELECT email FROM UTENTE WHERE email = ? AND password = ?");
        $stmt->bind_param("ss", $email, $password);
        $stmt->execute();
        $result = $stmt->get_result();
        return $result->fetch_assoc();
    }

    public function getSongs() {
        $stmt = $this->db->prepare("SELECT * FROM BRANO"); 
        $stmt->execute();
        $result = $stmt->get_result();
        return $result->fetch_all(MYSQLI_ASSOC);
    }

    public function createPlaylist($titolo, $descrizione, $tipo, $email) {
        $ID_playlist = uniqid() . time(); // Generate a unique ID using uniqid and current time
        $stmt = $this->db->prepare("INSERT INTO PLAYLIST (ID_playlist, titolo, descrizione, Tipo, email) VALUES (?, ?, ?, ?, ?)");
        $stmt->bind_param("sssss", $ID_playlist, $titolo, $descrizione, $tipo, $email);
        $stmt->execute();
        return $ID_playlist; // Return the generated ID for reference
    }

    public function insertSongIntoPlaylist($id_playlist, $brano) {
        $stmt = $this->db->prepare("INSERT INTO COGLIERE (ID_brano, ID_playlist) VALUES (?, ?)");
        $stmt->bind_param("ss", $brano, $id_playlist);
        return $stmt->execute();
    }

    public function getUserPlaylists($email) {
        $stmt = $this->db->prepare("SELECT * FROM PLAYLIST WHERE email = ?");
        $stmt->bind_param("s", $email);
        $stmt->execute();
        $result = $stmt->get_result();
        return $result->fetch_all(MYSQLI_ASSOC);
    }

    public function getPlaylistSongs($id_playlist) {
        $stmt = $this->db->prepare("SELECT brano.titolo, brano.durata FROM brano, cogliere, playlist WHERE brano.ID_brano = cogliere.ID_brano AND cogliere.ID_playlist = playlist.ID_playlist AND playlist.ID_playlist = ?");
        $stmt->bind_param("s", $id_playlist);
        $stmt->execute();
        $result = $stmt->get_result();
        return $result->fetch_all(MYSQLI_ASSOC);
    }

    public function buyPremium($email) {
        $data_scadenza = date('Y-m-d', strtotime('+1 month')); // Calculate the date of next month
        $prezzo = 10; // Fixed price
        $stmt = $this->db->prepare("INSERT INTO PREMIUM (email, tempo_attivazione, data_scadenza, Prezzo) VALUES (?, NOW(), ?, ?)");
        $stmt->bind_param("ssd", $email, $data_scadenza, $prezzo);
        return $stmt->execute();
    }

    public function getNearestTempoAttivazione($email) {
        $stmt = $this->db->prepare("
            SELECT tempo_attivazione, 'FREE' AS subscription_type 
            FROM FREE 
            WHERE email = ?
            UNION ALL
            SELECT tempo_attivazione, 'PREMIUM' AS subscription_type 
            FROM PREMIUM 
            WHERE email = ?
            ORDER BY tempo_attivazione DESC
            LIMIT 1
        ");
        $stmt->bind_param("ss", $email, $email);
        $stmt->execute();
        $result = $stmt->get_result();
        return $result->fetch_assoc(); // Returns tempo_attivazione and subscription_type
    }

    public function getAllCategories() {
        $stmt = $this->db->prepare("SELECT * FROM CATEGORIA");
        $stmt->execute();
        $result = $stmt->get_result();
        return $result->fetch_all(MYSQLI_ASSOC);
    }

    public function getCategoryOptions($id_categoria) {
        $stmt = $this->db->prepare("SELECT * FROM opzione_categoria WHERE ID_categoria = ?");
        $stmt->bind_param("s", $id_categoria);
        $stmt->execute();
        $result = $stmt->get_result();
        return $result->fetch_all(MYSQLI_ASSOC);
    }
    
    public function getAllArtists() {
        $stmt = $this->db->prepare("SELECT * FROM ARTISTA");
        $stmt->execute();
        $result = $stmt->get_result();
        return $result->fetch_all(MYSQLI_ASSOC);
    }
    
    public function getAllComposers() {
        $stmt = $this->db->prepare("SELECT * FROM COMPOSITORE");
        $stmt->execute();
        $result = $stmt->get_result();
        return $result->fetch_all(MYSQLI_ASSOC);
    }
    
    public function getAllLyricists() {
        $stmt = $this->db->prepare("SELECT * FROM PAROLIERE");
        $stmt->execute();
        $result = $stmt->get_result();
        return $result->fetch_all(MYSQLI_ASSOC);
    }
    
    public function getAllAlbums() {
        $stmt = $this->db->prepare("SELECT a.ID_artista, a.titolo, a.descrizione, ar.nome_d_arte 
                                   FROM ALBUM a 
                                   JOIN ARTISTA ar ON a.ID_artista = ar.ID_artista");
        $stmt->execute();
        $result = $stmt->get_result();
        return $result->fetch_all(MYSQLI_ASSOC);
    }

    public function getArtistAlbums($id_artista) {
        $stmt = $this->db->prepare("SELECT titolo, descrizione FROM ALBUM WHERE ID_artista = ?");
        $stmt->bind_param("s", $id_artista);
        $stmt->execute();
        $result = $stmt->get_result();
        return $result->fetch_all(MYSQLI_ASSOC);
    }

    // 6. Creare un Daily Mix personalizzato in base alla percentuale di ascolti dell'utente per genere musicale
    public function createDailyMix($email) {
        $stmt = $this->db->prepare("
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
            
            SELECT b.ID_brano, b.titolo, a.nome_d_arte
            FROM BRANO b
            JOIN esecuzione e ON b.ID_brano = e.ID_brano
            JOIN ARTISTA a ON e.ID_artista = a.ID_artista
            WHERE a.generi_musicali IN (
                SELECT generi_musicali
                FROM GeneriUtente
                LIMIT 3
            )
            AND b.ID_brano NOT IN (
                SELECT ID_brano
                FROM ascolto
                WHERE email = ?
            )
            ORDER BY RAND()
            LIMIT 30
        ");
        $stmt->bind_param("ss", $email, $email);
        $stmt->execute();
        $result = $stmt->get_result();
        return $result->fetch_all(MYSQLI_ASSOC);
    }

    // 7. Ottenere la percentuale di utenti premium rispetto a quelli free
    public function getPremiumPercentage() {
        $stmt = $this->db->prepare("
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
                ) p ON u.email = p.email
        ");
        $stmt->execute();
        $result = $stmt->get_result();
        return $result->fetch_assoc();
    }

    // 8. Calcolare il numero medio di pubblicità visualizzate prima di un abbonamento premium
    public function getAverageAdsBeforePremium() {
        $stmt = $this->db->prepare("
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
            ) AS conteggio_pubblicita
        ");
        $stmt->execute();
        $result = $stmt->get_result();
        return $result->fetch_assoc();
    }

    // 9. Aggiungere un brano in un'opzione di una certa categoria
    public function addTrackToCategory($id_brano, $id_categoria, $opzione) {
        $stmt = $this->db->prepare("INSERT INTO classificazione (ID_brano, ID_categoria, opzione) VALUES (?, ?, ?)");
        $stmt->bind_param("sss", $id_brano, $id_categoria, $opzione);
        return $stmt->execute();
    }

    // 10. Visualizzare l'elenco degli utenti registrati
    public function getAllUsers() {
        $stmt = $this->db->prepare("
            SELECT email, nome_utente, data_nascita, paese, 
                CASE 
                    WHEN EXISTS (
                        SELECT 1 FROM PREMIUM p 
                        WHERE p.email = u.email AND p.data_scadenza >= CURDATE()
                    ) THEN 'Premium'
                    ELSE 'Free'
                END AS tipo_account
            FROM UTENTE u
            ORDER BY nome_utente
        ");
        $stmt->execute();
        $result = $stmt->get_result();
        return $result->fetch_all(MYSQLI_ASSOC);
    }

    // 11. Aggiungere un brano
    public function addTrack($id_brano, $titolo, $testo, $durata, $data_uscita, $tra_id_artista, $tra_titolo) {
        $stmt = $this->db->prepare("INSERT INTO BRANO (ID_brano, titolo, testo, durata, data_uscita, Tra_ID_artista, Tra_titolo) VALUES (?, ?, ?, ?, ?, ?, ?)");
        $stmt->bind_param("sssisss", $id_brano, $titolo, $testo, $durata, $data_uscita, $tra_id_artista, $tra_titolo);
        return $stmt->execute();
    }

    // Aggiungere le relazioni per il nuovo brano
    public function addTrackArtist($id_artista, $id_brano) {
        $stmt = $this->db->prepare("INSERT INTO esecuzione (ID_artista, ID_brano) VALUES (?, ?)");
        $stmt->bind_param("ss", $id_artista, $id_brano);
        return $stmt->execute();
    }

    public function addTrackComposer($id_brano, $id_compositore) {
        $stmt = $this->db->prepare("INSERT INTO composizione (ID_brano, ID_compositore) VALUES (?, ?)");
        $stmt->bind_param("ss", $id_brano, $id_compositore);
        return $stmt->execute();
    }

    public function addTrackLyricist($id_brano, $id_paroliere) {
        $stmt = $this->db->prepare("INSERT INTO scrittura (ID_brano, ID_paroliere) VALUES (?, ?)");
        $stmt->bind_param("ss", $id_brano, $id_paroliere);
        return $stmt->execute();
    }

    public function addTrackVersion($id_brano, $tipo, $dimensione, $sorgente) {
        $stmt = $this->db->prepare("INSERT INTO VERSIONE_BRANO (ID_brano, Tipo, dimensione, sorgente) VALUES (?, ?, ?, ?)");
        $stmt->bind_param("ssis", $id_brano, $tipo, $dimensione, $sorgente);
        return $stmt->execute();
    }

    // 12. Aggiungere o rimuovere album
    public function addAlbum($id_artista, $titolo, $descrizione) {
        $stmt = $this->db->prepare("INSERT INTO ALBUM (ID_artista, titolo, descrizione) VALUES (?, ?, ?)");
        $stmt->bind_param("sss", $id_artista, $titolo, $descrizione);
        return $stmt->execute();
    }

    public function getTracksInAlbum($id_artista, $titolo) {
        $stmt = $this->db->prepare("SELECT ID_brano FROM BRANO WHERE Tra_ID_artista = ? AND Tra_titolo = ?");
        $stmt->bind_param("ss", $id_artista, $titolo);
        $stmt->execute();
        $result = $stmt->get_result();
        return $result->fetch_all(MYSQLI_ASSOC);
    }

    public function removeTrackRelations($id_brano) {
        // Delete all relations for a track
        $tables = ['ascolto', 'classificazione', 'cogliere', 'composizione', 'esecuzione', 'scrittura', 'VERSIONE_BRANO'];
        $success = true;
        
        foreach ($tables as $table) {
            $stmt = $this->db->prepare("DELETE FROM $table WHERE ID_brano = ?");
            $stmt->bind_param("s", $id_brano);
            if (!$stmt->execute()) {
                $success = false;
            }
        }
        
        return $success;
    }

    public function removeTrack($id_brano) {
        $stmt = $this->db->prepare("DELETE FROM BRANO WHERE ID_brano = ?");
        $stmt->bind_param("s", $id_brano);
        return $stmt->execute();
    }

    public function removeAlbum($id_artista, $titolo) {
        // Get all tracks in the album
        $tracks = $this->getTracksInAlbum($id_artista, $titolo);
        
        // Remove all track relations and then the tracks
        foreach ($tracks as $track) {
            $id_brano = $track['ID_brano'];
            $this->removeTrackRelations($id_brano);
            $this->removeTrack($id_brano);
        }
        
        // Finally remove the album
        $stmt = $this->db->prepare("DELETE FROM ALBUM WHERE ID_artista = ? AND titolo = ?");
        $stmt->bind_param("ss", $id_artista, $titolo);
        return $stmt->execute();
    }
}

