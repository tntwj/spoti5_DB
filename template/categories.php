<div>
    <?php foreach($templateParams["categories"] as $category): ?>
        <div class="category">
            <h2><?php echo htmlspecialchars($category["nome"]); ?></h2>
            <a href="songs.php?ID_categoria=<?php echo urlencode($category['ID_categoria']); ?>" class="btn">View Songs</a>
        </div>
    <?php endforeach; ?>
</div>