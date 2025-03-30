<?php
require_once 'bootstrap.php';
$templateParams["title"] = "Spoti5 - Home";
$templateParams["main-content"] = "";
if (isUserLoggedIn()) {
    $success = $dbh->buyPremium($_SESSION[SessionKey::EMAIL]);
    if ($success) {
        header("Location: profile.php?success=1");
    } else {
        die("Error: Unable to process the payment. Please try again later.");
    }
}                                                                      
require_once('template/base.php');
?>