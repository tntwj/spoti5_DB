<h1>Create a New Playlist</h1>
<form action="process-playlist.php" method="POST">
    <label for="titolo">Title:</label>
    <input type="text" id="titolo" name="titolo" required><br><br>

    <label for="descrizione">Description:</label>
    <textarea id="descrizione" name="descrizione" required></textarea><br><br>

    <label for="tipo">Type:</label>
    <select id="tipo" name="tipo" required>
        <option value="Public">Public</option>
        <option value="Private">Private</option>
    </select><br><br>

    <h3>Select Songs to Add:</h3>
        <?php foreach($templateParams["songs"] as $song) : ?>
            <input type="checkbox" id="song-<?php echo $song['ID_brano']; ?>" name="selected_songs[]" value="<?php echo $song['ID_brano']; ?>">
            <label for="song-<?php echo $song['ID_brano']; ?>"><?php echo htmlspecialchars($song['titolo']); ?></label><br>
        <?php endforeach; ?>
    <br>
    <button type="submit">Create Playlist</button>
</form>