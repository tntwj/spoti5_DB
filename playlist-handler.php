<?php
require_once("bootstrap.php");

if ($_SERVER["REQUEST_METHOD"] === "POST" && isUserLoggedIn()) {
    // Retrieve form data
    $titolo = filter_input(INPUT_POST, 'titolo', FILTER_SANITIZE_STRING);
    $descrizione = filter_input(INPUT_POST, 'descrizione', FILTER_SANITIZE_STRING);
    $tipo = filter_input(INPUT_POST, 'tipo', FILTER_SANITIZE_STRING);
    $selected_song = filter_input(INPUT_POST, 'selected_song', FILTER_SANITIZE_NUMBER_INT);

    // Validate required fields
    if (empty($titolo) || empty($descrizione) || empty($tipo) || empty($selected_song)) {
        die("All fields are required.");
    }
    
    $email = $_SESSION[Sessionkey::EMAIL] ?? null;

    if (empty($email)) {
        die("User not logged in.");
    }

    // Create playlist using dbh->createPlaylist
    $playlist_id = $dbh->createPlaylist($titolo, $descrizione, $tipo, $email);

    if ($playlist_id) {
        // Associate the selected song with the playlist
        $query = "INSERT INTO playlist_songs (playlist_id, song_id) VALUES (?, ?)";
        $stmt = $db->prepare($query);
        $stmt->bind_param("ii", $playlist_id, $selected_song);

        if ($stmt->execute()) {
            echo "Playlist created successfully!";
        } else {
            echo "Error associating song with playlist.";
        }

        $stmt->close();
    } else {
        echo "Error creating playlist.";
    }
}
?>