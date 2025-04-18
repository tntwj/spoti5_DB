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
    $id_categoria_opzione = $_POST["id_categoria_opzione"] ?? "";

    if (!empty($id_brano) && !empty($id_categoria_opzione)) {
        list($id_categoria, $opzione) = explode("|", $id_categoria_opzione, 2);
        $lastWord = substr(strrchr(trim($opzione), ' '), 1);
        $result = $dbh->addTrackToCategory($id_brano, $id_categoria, $lastWord);
        $templateParams["message"] = $result ? " Track added to category successfully!" : " Failed to add track to category.";
    } else {
        $templateParams["message"] = "Please fill all fields.";
    }
}
                                                                
require_once('template/base.php');
