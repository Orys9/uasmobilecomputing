<?php
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Origin: *");

include 'db.php';

$sql = "SELECT team1, team2, league, date, time FROM matches ORDER BY created_at DESC";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $matches = [];
    while ($row = $result->fetch_assoc()) {
        $matches[] = $row;
    }
    echo json_encode($matches);
} else {
    echo json_encode([]);
}

$conn->close();
?>
