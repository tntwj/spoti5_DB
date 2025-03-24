<?php

class SessionKey {
    public const LOGGED_IN = "logged_in";
    public const EMAIL = "email";
}

function isUserLoggedIn() {
    return session_status() === PHP_SESSION_ACTIVE && ($_SESSION[SessionKey::LOGGED_IN] ?? null) === true;
}


?>