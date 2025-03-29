<?php
// Assuming you have a database connection to fetch songs
// Replace with your actual database connection code
$conn = new mysqli("localhost", "username", "password", "database");

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Fetch songs from the database
$songsQuery = "SELECT ID_song, title FROM SONGS"; // Replace with your actual table and column names
$songsResult = $conn->query($songsQuery);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Playlist</title>
</head>
<body>
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
        <?php if ($songsResult->num_rows > 0): ?>
            <?php while ($song = $songsResult->fetch_assoc()): ?>
                <input type="radio" id="song_<?php echo $song['ID_song']; ?>" name="song" value="<?php echo $song['ID_song']; ?>">
                <label for="song_<?php echo $song['ID_song']; ?>"><?php echo htmlspecialchars($song['title']); ?></label><br>
            <?php endwhile; ?>
        <?php else: ?>
            <p>No songs available to add.</p>
        <?php endif; ?>

        <br>
        <button type="submit">Create Playlist</button>
    </form>
</body>
</html>

<?php
$conn->close();
?>