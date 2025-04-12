<?php
session_start();
session_regenerate_id(true);
session_destroy(); // Destroy the session completely
header("Location: index.php"); // Redirect to the homepage or login page
exit;
?>