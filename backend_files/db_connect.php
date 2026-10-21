<?php
// Docker / Local Database Connection Helper for Redbubble PHP API

$host = getenv('DB_HOST') ?: 'db';
$user = getenv('DB_USER') ?: 'redbubble_user';
$password = getenv('DB_PASS') ?: 'redbubble_password';
$database = getenv('DB_NAME') ?: 'redbubble';
$port = getenv('DB_PORT') ?: 3306;

$conn = new mysqli($host, $user, $password, $database, (int)$port);

if ($conn->connect_error) {
    die(json_encode([
        "status" => "error",
        "message" => "Database connection failed: " . $conn->connect_error
    ]));
}

$conn->set_charset("utf8mb4");
?>
