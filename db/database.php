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
}


?>