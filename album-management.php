<?php
require_once 'bootstrap.php';
$templateParams["title"] = "Spoti5 - Album Management";
$templateParams["main-content"] = "template/album-management.php";
if (isUserLoggedIn()) {
    $templateParams["ID_user"] = $_SESSION[SessionKey::EMAIL];
    $templateParams["artists"] = $dbh->getAllArtists();
    $templateParams["albums"] = $dbh->getAllAlbums();
    
    if ($_SERVER["REQUEST_METHOD"] === "POST") {
        if (isset($_POST["action"])) {
            if ($_POST["action"] === "add") {
                $id_artista = $_POST["id_artista"] ?? "";
                $titolo = $_POST["titolo"] ?? "";
                $descrizione = $_POST["descrizione"] ?? "";
                
                if (!empty($id_artista) && !empty($titolo) && !empty($descrizione)) {
                    $result = $dbh->addAlbum($id_artista, $titolo, $descrizione);
                    $templateParams["message"] = $result ? "Album added successfully!" : "Failed to add album.";
                } else {
                    $templateParams["message"] = "Please fill all fields for adding an album.";
                }
            } else if ($_POST["action"] === "remove") {
                $id_artista = $_POST["id_artista"] ?? "";
                $titolo = $_POST["titolo"] ?? "";
                
                if (!empty($id_artista) && !empty($titolo)) {
                    $result = $dbh->removeAlbum($id_artista, $titolo);
                    $templateParams["message"] = $result ? "Album removed successfully!" : "Failed to remove album.";
                } else {
                    $templateParams["message"] = "Please select an album to remove.";
                }
            }
        }
    }
}                                                                      
require_once('template/base.php');
