<?php $songs = $templateParams["playlist-songs"]; ?>
<?php foreach ($songs as $song): ?>
    <p>
        Title: <?php echo htmlspecialchars($song["titolo"]); ?><br>
        Duration: <?php 
            $minutes = floor($song["durata"] / 60);
            $seconds = $song["durata"] % 60;
            echo sprintf("%d:%02d", $minutes, $seconds); 
        ?>
    </p>
<?php endforeach; ?>