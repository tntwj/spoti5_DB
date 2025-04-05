<?php
// Simple test script to verify functionality of implemented operations
require_once 'bootstrap.php';

echo "<h1>Testing Implemented Operations</h1>";

// Test operation 6: Create Daily Mix
echo "<h2>Testing Operation 6: Create Daily Mix</h2>";
try {
    // Using a test email
    $testEmail = "test@example.com";
    $dailyMix = $dbh->createDailyMix($testEmail);
    echo "Daily Mix query executed successfully.<br>";
    echo "Number of tracks returned: " . count($dailyMix) . "<br>";
} catch (Exception $e) {
    echo "Error testing Daily Mix: " . $e->getMessage() . "<br>";
}

// Test operation 7: Premium User Percentage
echo "<h2>Testing Operation 7: Premium User Percentage</h2>";
try {
    $premiumPercentage = $dbh->getPremiumPercentage();
    echo "Premium percentage query executed successfully.<br>";
    echo "Premium percentage: " . ($premiumPercentage['percentuale_premium'] ?? 'N/A') . "%<br>";
} catch (Exception $e) {
    echo "Error testing Premium Percentage: " . $e->getMessage() . "<br>";
}

// Test operation 8: Average Ads Before Premium
echo "<h2>Testing Operation 8: Average Ads Before Premium</h2>";
try {
    $avgAds = $dbh->getAverageAdsBeforePremium();
    echo "Average ads query executed successfully.<br>";
    echo "Average ads before premium: " . ($avgAds['media_pubblicita_prima_premium'] ?? 'N/A') . "<br>";
} catch (Exception $e) {
    echo "Error testing Average Ads: " . $e->getMessage() . "<br>";
}

// Test operation 10: Get All Users
echo "<h2>Testing Operation 10: Get All Users</h2>";
try {
    $users = $dbh->getAllUsers();
    echo "Get all users query executed successfully.<br>";
    echo "Number of users: " . count($users) . "<br>";
} catch (Exception $e) {
    echo "Error testing Get All Users: " . $e->getMessage() . "<br>";
}

// Test helper methods
echo "<h2>Testing Helper Methods</h2>";
try {
    $artists = $dbh->getAllArtists();
    echo "Get all artists query executed successfully.<br>";
    echo "Number of artists: " . count($artists) . "<br>";
    
    $albums = $dbh->getAllAlbums();
    echo "Get all albums query executed successfully.<br>";
    echo "Number of albums: " . count($albums) . "<br>";
} catch (Exception $e) {
    echo "Error testing helper methods: " . $e->getMessage() . "<br>";
}

echo "<h2>Testing Complete</h2>";
echo "All operations have been tested. Check the output above for results.";
