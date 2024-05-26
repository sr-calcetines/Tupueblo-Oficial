<?php
$servername = "localhost";
$username = "tupueblo";
$password = "1234";
$dbname = "tupueblo";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die(json_encode(['error' => 'Conexión fallida: ' . $conn->connect_error]));
}

$id = $_GET['id'] ?? null;

if (!$id) {
    echo json_encode(['error' => 'ID no proporcionado']);
    $conn->close();
    exit();
}

// Escapar el ID para evitar inyecciones SQL
$id = $conn->real_escape_string($id);

$sql = "SELECT id, nombre, descripcion, lat, lon, imagenes FROM pueblos WHERE id = '$id'";
$result = $conn->query($sql);

if ($result && $row = $result->fetch_assoc()) {
    echo json_encode($row);
} else {
    echo json_encode(['error' => 'Error en la consulta o no se encontró el pueblo: ' . $conn->error]);
}

$conn->close();
?>