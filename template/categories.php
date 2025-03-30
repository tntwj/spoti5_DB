<div>
    <?php foreach($templateParams["categories"] as $category): ?>
        <div class="category">
            <h2><?php echo htmlspecialchars($category["nome"]); ?></h2>
            <a href="options.php?ID_categoria=<?php echo $category['ID_categoria']; ?>" class="btn">View options</a>
        </div>
    <?php endforeach; ?>
</div>