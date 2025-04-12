<div class="container mt-4">
    <h2>Add New Track</h2>
    
    <?php if(isset($templateParams["message"])): ?>
    <div class="alert alert-info">
        <?php echo $templateParams["message"]; ?>
    </div>
    <?php endif; ?>
    
    <form method="POST" action="">
        <div class="form-group">
            <label for="titolo">Track Title:</label>
            <input type="text" class="form-control" id="titolo" name="titolo" required>
        </div>
        
        <div class="form-group">
            <label for="testo">Lyrics:</label>
            <textarea class="form-control" id="testo" name="testo" rows="4"></textarea>
        </div>
        
        <div class="form-group">
            <label for="durata">Duration (seconds):</label>
            <input type="number" class="form-control" id="durata" name="durata" required min="1">
        </div>
        
        <div class="form-group">
            <label for="data_uscita">Release Date:</label>
            <input type="date" class="form-control" id="data_uscita" name="data_uscita" required>
        </div>
        
        <div class="form-group">
            <label for="tra_id_artista">Album Artist (optional):</label>
            <select class="form-control" id="tra_id_artista" name="tra_id_artista">
                <option value="">-- No Album --</option>
                <?php foreach($templateParams["artists"] as $artist): ?>
                <option value="<?php echo $artist["ID_artista"]; ?>"><?php echo $artist["nome_d_arte"]; ?></option>
                <?php endforeach; ?>
            </select>
        </div>
        
        <div class="form-group">
            <label for="tra_titolo">Album Title (optional):</label>
            <select class="form-control" id="tra_titolo" name="tra_titolo" disabled>
                <option value="">-- Select Artist First --</option>
            </select>
        </div>
        
        <div class="form-group">
            <label for="id_artista">Performing Artist:</label>
            <select class="form-control" id="id_artista" name="id_artista" required>
                <option value="">-- Select an artist --</option>
                <?php foreach($templateParams["artists"] as $artist): ?>
                <option value="<?php echo $artist["ID_artista"]; ?>"><?php echo $artist["nome_d_arte"]; ?></option>
                <?php endforeach; ?>
            </select>
        </div>
        
        <div class="form-group">
            <label for="id_compositore">Composer:</label>
            <select class="form-control" id="id_compositore" name="id_compositore" required>
                <option value="">-- Select a composer --</option>
                <?php foreach($templateParams["composers"] as $composer): ?>
                <option value="<?php echo $composer["ID_compositore"]; ?>"><?php echo $composer["nome_d_arte"]; ?></option>
                <?php endforeach; ?>
            </select>
        </div>
        
        <div class="form-group">
            <label for="id_paroliere">Lyricist:</label>
            <select class="form-control" id="id_paroliere" name="id_paroliere" required>
                <option value="">-- Select a lyricist --</option>
                <?php foreach($templateParams["lyricists"] as $lyricist): ?>
                <option value="<?php echo $lyricist["ID_paroliere"]; ?>"><?php echo $lyricist["nome_d_arte"]; ?></option>
                <?php endforeach; ?>
            </select>
        </div>
        
        <div class="form-group">
            <label for="tipo_versione">Version Type:</label>
            <select class="form-control" id="tipo_versione" name="tipo_versione" required>
                <option value="">-- Select version type --</option>
                <option value="HQ">High Quality</option>
                <option value="MQ">Medium Quality</option>
                <option value="LQ">Low Quality</option>
            </select>
        </div>
        
        <div class="form-group">
            <label for="dimensione">File Size (KB):</label>
            <input type="number" class="form-control" id="dimensione" name="dimensione" required min="1">
        </div>
        
        <div class="form-group">
            <label for="sorgente">Source URL:</label>
            <input type="url" class="form-control" id="sorgente" name="sorgente" required>
        </div>
        
        <button type="submit" class="btn btn-primary">Add Track</button>
    </form>
</div>

<script>
$(document).ready(function() {
    // When album artist changes, load albums for that artist
    $("#tra_id_artista").change(function() {
        const artistId = $(this).val();
        if (artistId) {
            $("#tra_titolo").prop("disabled", false);
            
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
                    $("#tra_titolo").html(options);
                }
            });
        } else {
            $("#tra_titolo").prop("disabled", true);
            $("#tra_titolo").html('<option value="">-- Select Artist First --</option>');
        }
    });
});
</script>
