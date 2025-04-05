<div class="container mt-4">
    <h2>Daily Mix</h2>
    <p>Your personalized mix based on your listening history</p>
    
    <?php if(empty($templateParams["daily_mix"])): ?>
    <div class="alert alert-info">
        No songs available for your Daily Mix yet. Try listening to more songs to get personalized recommendations!
    </div>
    <?php else: ?>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Title</th>
                        <th>Artist</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach($templateParams["daily_mix"] as $song): ?>
                    <tr>
                        <td><?php echo $song["titolo"]; ?></td>
                        <td><?php echo $song["nome_d_arte"]; ?></td>
                        <td>
                            <button class="btn btn-sm btn-primary play-song" data-id="<?php echo $song["ID_brano"]; ?>">
                                <i class="fa fa-play"></i> Play
                            </button>
                        </td>
                    </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        </div>
    </div>
    <?php endif; ?>
</div>

<script>
$(document).ready(function() {
    $(".play-song").click(function() {
        const songId = $(this).data("id");
        // Here you would implement the actual playback functionality
        alert("Playing song ID: " + songId);
    });
});
</script>
