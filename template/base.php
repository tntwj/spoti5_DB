<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title><?php echo $templateParams["title"]; ?></title>
    <link rel="stylesheet" type="text/css" href="./css/styles.css" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
</head>
<body>
    <header class="bg-primary text-white py-3">
        <div class="container">
            <h1 class="mb-0">Spoti5</h1>
            <nav class="mt-3">
                <ul class="nav nav-pills">
                    <li class="nav-item">
                        <a class="nav-link text-white" href="<?php echo isUserLoggedIn() ? 'user-index.php' : 'index.php'; ?>">Home</a>
                    </li>
                    <li class="nav-item"><a class="nav-link text-white" href="songs.php">All Songs</a></li>
                    <li class="nav-item"><a class="nav-link text-white" href="category.php">Categories</a></li>
                    <?php if (isUserLoggedIn()): ?>
                        <li class="nav-item"><a class="nav-link text-white" href="profile.php">Profile</a></li>
                    <?php endif; ?>
                </ul>
            </nav>
        </div>
    </header>
    <main class="container my-4">
        <?php require($templateParams["main-content"]); ?>
    </main>
    <footer class="bg-dark text-white text-center py-3">
        <p class="mb-0">&copy; 2025 Simple SpotiFive</p>
    </footer>
</body>
</html>