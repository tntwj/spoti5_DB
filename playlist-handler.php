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
    // Insert the selected songs into the playlist
    if ($playlist_id) {
        $selected_songs = filter_input(INPUT_POST, 'selected_songs', FILTER_DEFAULT, FILTER_REQUIRE_ARRAY);
        if (!empty($selected_songs)) {
            foreach ($selected_songs as $song_id) {
                $song_id = filter_var($song_id, FILTER_SANITIZE_NUMBER_INT);
                $success = $dbh->insertSongIntoPlaylist($playlist_id, $song_id);
                if (!$success) {
                    die("Failed to add the song with ID $song_id to the playlist.");
                }
            }
        } else {
            die("No songs selected.");
        }
    } else {
        die("Failed to create the playlist.");
    }
    // Redirect to user-index.php after successful creation
    header("Location: user-index.php");
    exit();
}
?>