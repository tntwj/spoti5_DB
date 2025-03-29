<?php
require_once 'bootstrap.php';
$templateParams["title"] = "Spoti5 - Home";
$templateParams["main-content"] = "template/user-playlist.php";
if (isUserLoggedIn()) {
    if (isset($_GET["ID_playlist"])) {
        $idPlaylist = $_GET["ID_playlist"];
        $templateParams["playlist-songs"] = $dbh->getPlaylistSongs($idPlaylist);
    }
}
require_once('template/base.php');
?>