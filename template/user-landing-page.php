<div class="main-content">
    <h1>Welcome to the Landing Page</h1>
    <?php foreach ($templateParams["playlists"] as $playlist): ?>
        <div class="playlist">
            <h2><?php echo htmlspecialchars($playlist["titolo"]); ?></h2>
            <p><?php echo htmlspecialchars($playlist["descrizione"]); ?></p>
        </div>
    <?php endforeach; ?>
    <div class="button-container">
        <a href="index.php" class="btn">Logout</a>
    </div>
</div>