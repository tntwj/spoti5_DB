<?php
require_once 'bootstrap.php';
$templateParams["title"] = "Spoti5 - Home";
$templateParams["main-content"] = "template/creating-playlist-form.php";
if (isUserLoggedIn()) {
    $templateParams["ID_user"] = $_SESSION[SessionKey::EMAIL];
}                                                                      
require_once('template/base.php');
?>