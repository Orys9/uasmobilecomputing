<?php
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Origin: *");

include 'db.php';

$sql = "SELECT name, goals FROM players ORDER BY created_at DESC";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $players = [];
    while ($row = $result->fetch_assoc()) {
        $players[] = $row;
    }
    echo json_encode($players);
} else {
    echo json_encode([]);
}

$conn->close();
?>
