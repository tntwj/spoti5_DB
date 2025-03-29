<?php
require_once 'bootstrap.php';
$templateParams["title"] = "Spoti5 - Home";
$templateParams["main-content"] = "template/landing-page.php";
if (isUserLoggedIn()) {
    
}
require_once('template/base.php');
?>