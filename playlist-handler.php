<?php
require_once("bootstrap.php");

if ($_SERVER["REQUEST_METHOD"] === "POST" && isUserLoggedIn()) {
    // Retrieve form data
    $titolo = filter_input(INPUT_POST, 'titolo', FILTER_SANITIZE_STRING);
    $descrizione = filter_input(INPUT_POST, 'descrizione', FILTER_SANITIZE_STRING);
    $tipo = filter_input(INPUT_POST, 'tipo', FILTER_SANITIZE_STRING);
    $selected_songs = filter_input(INPUT_POST, 'selected_songs', FILTER_DEFAULT, FILTER_REQUIRE_ARRAY);

    // Validate required fields
    if (empty($titolo) || empty($descrizione) || empty($tipo) || empty($selected_songs)) {
        die("All fields are required, including selecting at least one song.");
    }

    $email = $_SESSION[Sessionkey::EMAIL] ?? null;

    if (empty($email)) {
        die("User not logged in.");
    }

    // Create playlist using dbh->createPlaylist
    $playlist_id = $dbh->createPlaylist($titolo, $descrizione, $tipo, $email);
    // Insert the selected songs into the playlist
    if ($playlist_id) {
        foreach ($selected_songs as $song_id) {
            $song_id = filter_var($song_id, FILTER_SANITIZE_STRING);
            $success = $dbh->insertSongIntoPlaylist($playlist_id, $song_id);
            if (!$success) {
                die("Failed to add the song with ID $song_id to the playlist.");
            }
        }
    } else {
        die("Failed to create the playlist.");
    }
    // Redirect to user-index.php after successful creation
    header("Location: user-index.php");
    exit();
}
?>