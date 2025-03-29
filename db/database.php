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
        $stmt = $this->db->prepare("INSERT INTO UTENTE (email, nome_utente, password, data_nascita, paese) VALUES (?, ?, ?, ?, ?)");
        $stmt->bind_param("sssss", $email, $nome_utente, $password, $data_nascita, $paese);
        $stmt->execute();
        $result = $stmt->get_result();

        $stmt = $this->db->prepare("INSERT INTO FREE (email, tempo_attivazione) VALUES (?, NOW())");
        $stmt->bind_param("s", $email);
        $stmt->execute();
        
        return $result->fetch_assoc();
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

    public function createPlaylist($email) {
        $stmt = $this->db->prepare("INSERT INTO PLAYLIST (ID_playlist, titolo, descrizione, Tipo, email) VALUES (?, ?, ?, ?, ?)");
        $stmt->bind_param("s", $email);
        $stmt->execute();
        $result = $stmt->get_result();
        return $result->fetch_assoc();
    }

    public function getUserPlaylists($email) {
        $stmt = $this->db->prepare("SELECT * FROM PLAYLIST WHERE email = ?");
        $stmt->bind_param("s", $email);
        $stmt->execute();
        $result = $stmt->get_result();
        return $result->fetch_all(MYSQLI_ASSOC);
    }

    public function getPlaylistSongs($id_playlist) {
        $stmt = $this->db->prepare("SELECT * FROM brano, cogliere, playlist WHERE brano.ID_brano = cogliere.ID_brano AND cogliere.ID_playlist = playlist.ID_playlist AND playlist.ID_playlist = ?");
        $stmt->bind_param("ss", $id_playlist);
        $stmt->execute();
        $result = $stmt->get_result();
        return $result->fetch_all(MYSQLI_ASSOC);
    }
}


?>