<?php
header("Content-Type: application/json");

// Include file koneksi database
include 'db.php';

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type");

// Periksa apakah request method adalah POST
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    echo json_encode([
        'status' => 'error',
        'message' => 'Invalid request method',
    ]);
    exit;
}

// Periksa apakah username tersedia di request
if (!isset($_POST['username'])) {
    echo json_encode([
        'status' => 'error',
        'message' => 'Username is required',
    ]);
    exit;
}

// Ambil username dari request
$username = $_POST['username'];

// Query untuk mengambil data user
$sql = "SELECT email, phone FROM users WHERE username = ?";
$stmt = $conn->prepare($sql);

if (!$stmt) {
    echo json_encode([
        'status' => 'error',
        'message' => 'Failed to prepare statement: ' . $conn->error,
    ]);
    exit;
}

// Bind parameter dan eksekusi query
$stmt->bind_param("s", $username);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    // Ambil data user
    $row = $result->fetch_assoc();
    echo json_encode([
        'status' => 'success',
        'email' => $row['email'],
        'phone' => $row['phone'],
    ]);
} else {
    echo json_encode([
        'status' => 'error',
        'message' => 'User not found',
    ]);
}

// Tutup statement dan koneksi
$stmt->close();
$conn->close();
?>