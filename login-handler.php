<?php
require_once("bootstrap.php");

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $email = $_POST["email"] ?? "";
    $password = $_POST["password"] ?? "";

    $check = $dbh->loginUser($email, $password);
    if ($check) {
        // Login successful
        echo "Login successful!";
    } else {
        // Login failed
        echo "Password wrong or email not found.";
    }
    
}
?>