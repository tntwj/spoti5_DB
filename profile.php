<?php
require_once 'bootstrap.php';
$templateParams["title"] = "Spoti5 - Profile";
$templateParams["main-content"] = "template/user-profile.php";
if (isUserLoggedIn()) {
    $email = $_SESSION[SessionKey::EMAIL];
    $templateParams["subscription"] = $dbh->getNearestTempoAttivazione($email);
}
require_once('template/base.php');
?>