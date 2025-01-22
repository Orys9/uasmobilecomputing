<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include 'db.php'; // Pastikan Anda memiliki file db.php untuk koneksi database.

$data = json_decode(file_get_contents("php://input"));

if (
    isset($data->name) &&
    isset($data->goals)
) {
    $name = $conn->real_escape_string($data->name);
    $goals = $conn->real_escape_string($data->goals);

    $sql = "INSERT INTO players (name, goals) VALUES ('$name', '$goals')";

    if ($conn->query($sql) === TRUE) {
        echo json_encode(["message" => "Player added successfully"]);
    } else {
        echo json_encode(["message" => "Failed to add player", "error" => $conn->error]);
    }
} else {
    echo json_encode(["message" => "Invalid input"]);
}

$conn->close();
?>
