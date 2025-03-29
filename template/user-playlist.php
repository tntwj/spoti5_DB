<?php $songs = $templateParams["playlist-songs"] ?? []; ?>
<?php foreach ($songs as $song): ?>
    <p>
        Title: <?php echo htmlspecialchars($song["titolo"] ?? "Unknown Title"); ?><br>
        Duration: <?php 
            $duration = $song["durata"] ?? 0;
            $minutes = floor($duration / 60);
            $seconds = $duration % 60;
            echo sprintf("%d:%02d", $minutes, $seconds); 
        ?>
    </p>
<?php endforeach; ?>