<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo isset($templateParams["title"]) ? $templateParams["title"] : "Spoti5"; ?></title>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
    <header>
        <h1>SpotiFive</h1>
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
        <p>&copy; 2025 Simple SpotiFive</p>
    </footer>
</body>
</html>