<?php
require_once 'bootstrap.php';
$templateParams["title"] = "Spoti5 - Add Track to Category";
$templateParams["main-content"] = "template/add-track-category.php";
$templateParams["songs"] = $dbh->getSongs();
$templateParams["categories"] = $dbh->getAllCategories();
$templateParams["options"] = array_map(function($category) use ($dbh) {
    return [
        "id" => $category["ID_categoria"],
        "name" => $category["nome"],
        "options" => array_map(function($option) use ($category) {
            return $category["nome"] . " - " . $option["opzione"];
        }, $dbh->getCategoryOptions($category["ID_categoria"]))
    ];
}, $templateParams["categories"]);

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
                                                                
require_once('template/base.php');
