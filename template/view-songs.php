<div class="container mt-5">
    <h1 class="text-center mb-4">Songs List</h1>
    <table class="table table-striped table-bordered">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Title</th>
            </tr>
        </thead>
        <tbody>
            <?php $songs = $templateParams["songs"]; ?>
            <?php foreach ($songs as $song): ?>
                <tr>
                    <td><?php echo htmlspecialchars($song['ID_brano']); ?></td>
                    <td><?php echo htmlspecialchars($song['titolo']); ?></td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
</div>