<?php
session_start();
require_once("utils/functions.php");
require_once("db/database.php");
$dbh = new DatabaseHelper("localhost", "root", "", "spoti5", 3306); // Change port in case of issues with XAMPP.
define("UPLOAD_DIR", "./upload/");
?>