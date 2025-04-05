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
        <li class="nav-item">
            <a class="nav-link" id="remove-tab" data-toggle="tab" href="#remove" role="tab">Remove Album</a>
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
        
        <!-- Remove Album Tab -->
        <div class="tab-pane fade" id="remove" role="tabpanel">
            <form method="POST" action="">
                <input type="hidden" name="action" value="remove">
                
                <div class="form-group">
                    <label for="id_artista_remove">Artist:</label>
                    <select class="form-control" id="id_artista_remove" name="id_artista" required>
                        <option value="">-- Select an artist --</option>
                        <?php foreach($templateParams["artists"] as $artist): ?>
                        <option value="<?php echo $artist["ID_artista"]; ?>"><?php echo $artist["nome_d_arte"]; ?></option>
                        <?php endforeach; ?>
                    </select>
                </div>
                
                <div class="form-group">
                    <label for="titolo_remove">Album Title:</label>
                    <select class="form-control" id="titolo_remove" name="titolo" required disabled>
                        <option value="">-- Select Artist First --</option>
                    </select>
                </div>
                
                <div class="alert alert-warning">
                    <strong>Warning!</strong> Removing an album will also remove all tracks associated with it. This action cannot be undone.
                </div>
                
                <button type="submit" class="btn btn-danger">Remove Album</button>
            </form>
        </div>
    </div>
</div>

<script>
$(document).ready(function() {
    // When artist changes in remove tab, load albums for that artist
    $("#id_artista_remove").change(function() {
        const artistId = $(this).val();
        if (artistId) {
            $("#titolo_remove").prop("disabled", false);
            
            $.ajax({
                url: "get-artist-albums.php",
                method: "POST",
                data: { id_artista: artistId },
                dataType: "json",
                success: function(data) {
                    let options = '<option value="">-- Select an album --</option>';
                    data.forEach(function(album) {
                        options += `<option value="${album.titolo}">${album.titolo}</option>`;
                    });
                    $("#titolo_remove").html(options);
                }
            });
        } else {
            $("#titolo_remove").prop("disabled", true);
            $("#titolo_remove").html('<option value="">-- Select Artist First --</option>');
        }
    });
});
</script>
