<?php foreach($templateParams["options"] as $option): ?>
    <div class="option">
        <h2><?php echo htmlspecialchars($option["opzione"]); ?></h2>
        <a href="songs-classified.php?category=<?php echo urlencode($option['opzione']); ?>">View Songs</a>
    </div>
<?php endforeach; ?>