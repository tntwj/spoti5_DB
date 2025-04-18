<?php
require_once 'bootstrap.php';

if ($_SERVER["REQUEST_METHOD"] === "POST" && isset($_POST["id_artista"])) {
    $id_artista = filter_input(INPUT_POST, "id_artista", FILTER_SANITIZE_STRING);

    if (!empty($id_artista)) {
        $albums = $dbh->getArtistAlbums($id_artista);
        echo json_encode($albums);
    } else {
        echo json_encode(["error" => "Invalid artist ID."]);
    }
} else {
    echo json_encode(["error" => "Invalid request."]);
}
?>