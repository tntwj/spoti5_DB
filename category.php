<?php
require_once 'bootstrap.php';
$templateParams["title"] = "Spoti5 - Category";
$templateParams["main-content"] = "template/categories.php";
$templateParams["categories"] = $dbh->getAllCategories();
require_once('template/base.php');
?>