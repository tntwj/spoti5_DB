<?php
require_once 'bootstrap.php';
$templateParams["title"] = "Spoti5 - User List";
$templateParams["main-content"] = "template/user-list.php";
if (isUserLoggedIn()) {
    $templateParams["users"] = $dbh->getAllUsers();
}                                                                      
require_once('template/base.php');
