<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include 'db.php'; // Pastikan Anda memiliki file db.php untuk koneksi database.

$data = json_decode(file_get_contents("php://input"));

if (isset($data->name)) {
    $name = $conn->real_escape_string($data->name);

    // Query untuk menghapus pemain
    $sql = "DELETE FROM players WHERE name='$name'";

    if ($conn->query($sql) === TRUE) {
        echo json_encode(["message" => "Player deleted successfully"]);
    } else {
        echo json_encode(["message" => "Failed to delete player", "error" => $conn->error]);
    }
} else {
    echo json_encode(["message" => "Invalid input"]);
}

$conn->close();
?>