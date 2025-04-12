<?php
require_once 'bootstrap.php';
$templateParams["title"] = "Spoti5 - Add Track";
$templateParams["main-content"] = "template/add-track.php";
$templateParams["artists"] = $dbh->getAllArtists();
$templateParams["composers"] = $dbh->getAllComposers();
$templateParams["lyricists"] = $dbh->getAllLyricists();
$templateParams["albums"] = $dbh->getAllAlbums();

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $id_brano = uniqid() . time(); // Generate a unique ID
    $titolo = $_POST["titolo"] ?? "";
    $testo = $_POST["testo"] ?? "";
    $durata = $_POST["durata"] ?? 0;
    $data_uscita = $_POST["data_uscita"] ?? "";
    $tra_id_artista = $_POST["tra_id_artista"] ?? null;
    $tra_titolo = $_POST["tra_titolo"] ?? null;
    $id_artista = $_POST["id_artista"] ?? "";
    $id_compositore = $_POST["id_compositore"] ?? "";
    $id_paroliere = $_POST["id_paroliere"] ?? "";
    $tipo_versione = $_POST["tipo_versione"] ?? "";
    $dimensione = $_POST["dimensione"] ?? 0;
    $sorgente = $_POST["sorgente"] ?? "";
    
    // Add the track
    $result = $dbh->addTrack($id_brano, $titolo, $testo, $durata, $data_uscita, $tra_id_artista, $tra_titolo);
    
    if ($result) {
        // Add relations
        $dbh->addTrackArtist($id_artista, $id_brano);
        $dbh->addTrackComposer($id_brano, $id_compositore);
        $dbh->addTrackLyricist($id_brano, $id_paroliere);
        $dbh->addTrackVersion($id_brano, $tipo_versione, $dimensione, $sorgente);
        
        $templateParams["message"] = "Track added successfully!";
    } else {
        $templateParams["message"] = "Failed to add track.";
    }
}
                                                                  
require_once('template/base.php');
