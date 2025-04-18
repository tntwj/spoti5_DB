<div class="container mt-4">
    <h2>Add Track to Category</h2>
    
    <?php if(isset($templateParams["message"])): ?>
    <div class="alert alert-info">
        <?php echo $templateParams["message"]; ?>
    </div>
    <?php endif; ?>
    
    <form method="POST" action="">
        <div class="form-group">
            <label for="id_brano">Select Track:</label>
            <select class="form-control" id="id_brano" name="id_brano" required>
                <option value="">-- Select a track --</option>
                <?php foreach($templateParams["songs"] as $song): ?>
                <option value="<?php echo $song["ID_brano"]; ?>"><?php echo $song["titolo"]; ?></option>
                <?php endforeach; ?>
            </select>
        </div>
        
        <div class="form-group">
            <label for="id_categoria_opzione">Select Category and Option:</label>
            <select class="form-control" id="id_categoria_opzione" name="id_categoria_opzione" required>
            <option value="">-- Select a category and option --</option>
            <?php foreach($templateParams["options"] as $categoryOption): ?>
                <?php foreach($categoryOption["options"] as $option): ?>
                <option value="<?php echo $categoryOption["id"] . "|" . $option; ?>">
                    <?php echo $option; ?>
                </option>
                <?php endforeach; ?>
            <?php endforeach; ?>
            </select>
        </div>
        
        <button type="submit" class="btn btn-primary">Add to Category</button>
    </form>
</div>
