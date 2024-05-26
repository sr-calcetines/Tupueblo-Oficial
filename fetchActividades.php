<?php
$servername = "localhost";
$username = "tupueblo";
$password = "1234";
$dbname = "tupueblo";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

$pueblo_id = $_POST['pueblo_id'];

$sql = "SELECT * FROM actividades WHERE pueblo_id = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $pueblo_id);
$stmt->execute();
$result = $stmt->get_result();

$actividades = array();
while ($row = $result->fetch_assoc()) {
    $actividades[] = $row;
}

echo json_encode($actividades);

$stmt->close();
$conn->close();
?>