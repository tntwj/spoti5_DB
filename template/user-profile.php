<?php if (isset($templateParams["subscription"])): ?>
    <?php 
        $tempo_attivazione = $templateParams["subscription"]['tempo_attivazione'];
        $subscription_type = $templateParams["subscription"]['subscription_type']; 
    ?>
    <section>
        <h2>User Subscription</h2>
        <p>Activation Time: <?php echo htmlspecialchars($tempo_attivazione); ?></p>
        <p>Subscription Type: <?php echo htmlspecialchars($subscription_type); ?></p>
        
        <?php if ($subscription_type === "FREE"): ?>
            <form action="premium-handler.php" method="post">
                <button type="submit">Upgrade to PREMIUM</button>
            </form>
        <?php endif; ?>
    </section>
<?php else: ?>
    <p>No subscription data available.</p>
<?php endif; ?>
