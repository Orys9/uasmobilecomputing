<?php
$host = 'teknologi22.xyz';
$username = 'teky6584_api_ryski';
$password = 'Ikkygantengdp1!';
$database = 'teky6584_api_ryski';

$conn = new mysqli($host, $username, $password, $database);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>
