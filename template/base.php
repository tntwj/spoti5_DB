<?php
// Start session and include configuration file
session_start();
require_once 'config.php';

// Check if template parameters are set
if (!isset($templateParams["main-content"])) {
    die("Main content template is not set.");
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo isset($templateParams["title"]) ? $templateParams["title"] : "Spoti5"; ?></title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header>
        <h1>Simple Spotify</h1>
        <nav>
            <ul>
                <li><a href="index.php">Home</a></li>
                <li><a href="search.php">Search</a></li>
                <li><a href="library.php">Library</a></li>
                <li><a href="profile.php">Profile</a></li>
            </ul>
        </nav>
    </header>
    <main>
        <?php require($templateParams["main-content"]); ?>
    </main>
    <footer>
        <p>&copy; 2023 Simple Spotify</p>
    </footer>
</body>
</html>