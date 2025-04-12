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
            <label for="id_categoria">Select Category:</label>
            <select class="form-control" id="id_categoria" name="id_categoria" required>
                <option value="">-- Select a category --</option>
                <?php foreach($templateParams["categories"] as $category): ?>
                <option value="<?php echo $category["ID_categoria"]; ?>"><?php echo $category["nome"]; ?></option>
                <?php endforeach; ?>
            </select>
        </div>
        
        <div class="form-group">
            <label for="opzione">Category Option:</label>
            <input type="text" class="form-control" id="opzione" name="opzione" required>
            <small class="form-text text-muted">Enter the option for the selected category</small>
        </div>
        
        <button type="submit" class="btn btn-primary">Add to Category</button>
    </form>
</div>

<script>
$(document).ready(function() {
    // When category changes, load options for that category
    $("#id_categoria").change(function() {
        const categoryId = $(this).val();
        if (categoryId) {
            $.ajax({
                url: "get-category-options.php",
                method: "POST",
                data: { id_categoria: categoryId },
                dataType: "json",
                success: function(data) {
                    // Create datalist for options
                    let optionsList = "<datalist id='category-options'>";
                    data.forEach(function(option) {
                        optionsList += "<option value='" + option.opzione + "'>";
                    });
                    optionsList += "</datalist>";
                    
                    // Add datalist to the page and connect it to the input
                    $("#opzione").after(optionsList);
                    $("#opzione").attr("list", "category-options");
                }
            });
        }
    });
});
</script>
