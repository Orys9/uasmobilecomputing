<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include 'db.php'; // Pastikan Anda memiliki file db.php untuk koneksi database.

$data = json_decode(file_get_contents("php://input"));

if (
    isset($data->team1) && 
    isset($data->team2) && 
    isset($data->league) && 
    isset($data->date) && 
    isset($data->time)
) {
    $team1 = $conn->real_escape_string($data->team1);
    $team2 = $conn->real_escape_string($data->team2);
    $league = $conn->real_escape_string($data->league);
    $date = $conn->real_escape_string($data->date);
    $time = $conn->real_escape_string($data->time);

    $sql = "INSERT INTO matches (team1, team2, league, date, time) VALUES ('$team1', '$team2', '$league', '$date', '$time')";

    if ($conn->query($sql) === TRUE) {
        echo json_encode(["message" => "Match added successfully"]);
    } else {
        echo json_encode(["message" => "Failed to add match", "error" => $conn->error]);
    }
} else {
    echo json_encode(["message" => "Invalid input"]);
}

$conn->close();
?>