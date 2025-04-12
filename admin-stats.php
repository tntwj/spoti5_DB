<?php
require_once 'bootstrap.php';
$templateParams["title"] = "Spoti5 - Admin Statistics";
$templateParams["main-content"] = "template/admin-stats.php";
$templateParams["premium_percentage"] = $dbh->getPremiumPercentage();
$templateParams["avg_ads"] = $dbh->getAverageAdsBeforePremium();                                                            
require_once('template/base.php');
