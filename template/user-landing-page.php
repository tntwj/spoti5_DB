<div class="main-content">
    <h1>Welcome to the Landing Page</h1>
    <h2>Playlists:</h2>
    <?php foreach ($templateParams["playlists"] as $playlist): ?>
        <div class="playlist">
            <h3><?php echo htmlspecialchars($playlist["titolo"]); ?></h3>
            <p><?php echo htmlspecialchars($playlist["descrizione"]); ?></p>
            <a href="playlist.php?ID_playlist=<?php echo urlencode($playlist['ID_playlist']); ?>" class="btn">View Playlist</a>
        </div>
    <?php endforeach; ?>
    <div class="button-container">
        <a href="create-playlist.php" class="btn">Create New Playlist</a>
    </div>
    <div class="button-container">
        <a href="index.php" class="btn">Logout</a>
    </div>
</div>