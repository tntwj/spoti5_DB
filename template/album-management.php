<div class="container mt-4">
    <h2>Album Management</h2>
    
    <?php if(isset($templateParams["message"])): ?>
    <div class="alert alert-info">
        <?php echo $templateParams["message"]; ?>
    </div>
    <?php endif; ?>
    
    <ul class="nav nav-tabs" id="albumTabs" role="tablist">
        <li class="nav-item">
            <a class="nav-link active" id="add-tab" data-toggle="tab" href="#add" role="tab">Add Album</a>
        </li>
    </ul>
    
    <div class="tab-content mt-3" id="albumTabContent">
        <!-- Add Album Tab -->
        <div class="tab-pane fade show active" id="add" role="tabpanel">
            <form method="POST" action="">
                <input type="hidden" name="action" value="add">
                
                <div class="form-group">
                    <label for="id_artista_add">Artist:</label>
                    <select class="form-control" id="id_artista_add" name="id_artista" required>
                        <option value="">-- Select an artist --</option>
                        <?php foreach($templateParams["artists"] as $artist): ?>
                        <option value="<?php echo $artist["ID_artista"]; ?>"><?php echo $artist["nome_d_arte"]; ?></option>
                        <?php endforeach; ?>
                    </select>
                </div>
                
                <div class="form-group">
                    <label for="titolo">Album Title:</label>
                    <input type="text" class="form-control" id="titolo" name="titolo" required>
                </div>
                
                <div class="form-group">
                    <label for="descrizione">Description:</label>
                    <textarea class="form-control" id="descrizione" name="descrizione" rows="3" required></textarea>
                </div>
                
                <button type="submit" class="btn btn-primary">Add Album</button>
            </form>
        </div>
    </div>
</div>
