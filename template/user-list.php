<div class="container mt-4">
    <h2>User List</h2>
    
    <div class="row">
        <div class="col-md-12">
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Email</th>
                        <th>Username</th>
                        <th>Date of Birth</th>
                        <th>Country</th>
                        <th>Account Type</th>
                    </tr>
                </thead>
                <tbody>
                    <?php if(empty($templateParams["users"])): ?>
                    <tr>
                        <td colspan="5" class="text-center">No users found</td>
                    </tr>
                    <?php else: ?>
                        <?php foreach($templateParams["users"] as $user): ?>
                        <tr>
                            <td><?php echo $user["email"]; ?></td>
                            <td><?php echo $user["nome_utente"]; ?></td>
                            <td><?php echo $user["data_nascita"]; ?></td>
                            <td><?php echo $user["paese"]; ?></td>
                            <td><?php echo $user["tipo_account"]; ?></td>
                        </tr>
                        <?php endforeach; ?>
                    <?php endif; ?>
                </tbody>
            </table>
        </div>
    </div>
</div>
