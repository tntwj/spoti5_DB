<?php
require_once("bootstrap.php");
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = $_POST['username'] ?? '';
    $password = $_POST['password'] ?? '';
    $email = $_POST['email'] ?? '';
    $birthdate = $_POST['birthdate'] ??'';
    $nationality = $_POST['nationality'] ??'';

    if (!empty($username) && !empty($password) && !empty($email)) {
    $result = $dbh->registerUser($email, $username, $password, $birthdate, $nationality);
        if ($result) {
            $_SESSION[SessionKey::LOGGED_IN] = true;
            $_SESSION[SessionKey::EMAIL] = $email;
            header("Location: user-index.php");
            exit();
        } else {
            echo "Registration failed. Please try again.";
        }
    } else {
        echo "All fields are required.";
    }
}
?>