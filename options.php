<?php
require_once 'bootstrap.php';
if (isset($_GET['ID_categoria'])) {
    $categoryId = $_GET['ID_categoria'];
} else {
    die("Category ID not set.");
}
$templateParams["title"] = "Spoti5 - Options";
$templateParams["main-content"] = "template/category-options.php";
$templateParams["options"] = $dbh->getCategoryOptions( $categoryId);
require_once('template/base.php');
?>