<?php
require_once 'bootstrap.php';
$templateParams["title"] = "Spoti5 - Home";
$templateParams["main-content"] = "template/user-landing-page.php";
if (isUserLoggedIn()) {
    $templateParams["playlists"] = $dbh->getUserPlaylists($_SESSION[SessionKey::EMAIL]);   
}                                                                      
require_once('template/base.php');
?>