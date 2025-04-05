<?php
require_once 'bootstrap.php';
$templateParams["title"] = "Spoti5 - Daily Mix";
$templateParams["main-content"] = "template/daily-mix.php";
if (isUserLoggedIn()) {
    $templateParams["ID_user"] = $_SESSION[SessionKey::EMAIL];
    $templateParams["daily_mix"] = $dbh->createDailyMix($_SESSION[SessionKey::EMAIL]);
}                                                                      
require_once('template/base.php');
