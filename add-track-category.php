<?php
require_once 'bootstrap.php';
$templateParams["title"] = "Spoti5 - Add Track to Category";
$templateParams["main-content"] = "template/add-track-category.php";
if (isUserLoggedIn()) {
    $templateParams["ID_user"] = $_SESSION[SessionKey::EMAIL];
    $templateParams["songs"] = $dbh->getSongs();
    $templateParams["categories"] = $dbh->getAllCategories();
    
    if ($_SERVER["REQUEST_METHOD"] === "POST") {
        $id_brano = $_POST["id_brano"] ?? "";
        $id_categoria = $_POST["id_categoria"] ?? "";
        $opzione = $_POST["opzione"] ?? "";
        
        if (!empty($id_brano) && !empty($id_categoria) && !empty($opzione)) {
            $result = $dbh->addTrackToCategory($id_brano, $id_categoria, $opzione);
            $templateParams["message"] = $result ? "Track added to category successfully!" : "Failed to add track to category.";
        } else {
            $templateParams["message"] = "Please fill all fields.";
        }
    }
}                                                                      
require_once('template/base.php');
