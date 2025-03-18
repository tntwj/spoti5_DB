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

// Registrazione come utente free

}


?>