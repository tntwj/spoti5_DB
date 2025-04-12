<?php
require_once 'bootstrap.php';
$templateParams["title"] = "Spoti5 - Home";
if (isUserLoggedIn()) {
    $templateParams["main-content"] = "template/user-landing-page.php";
    $templateParams["playlists"] = $dbh->getUserPlaylists($_SESSION[SessionKey::EMAIL]);   
}  
else {
    $templateParams["main-content"] = "template/landing-page.php";
}                                                                
require_once('template/base.php');
?>