<?php
require_once 'bootstrap.php';
$templateParams["title"] = "Spoti5 - Home";
$templateParams["main-content"] = "template/view-songs.php";
$templateParams["songs"] = $dbh->getSongs();;
require_once('template/base.php');
?>