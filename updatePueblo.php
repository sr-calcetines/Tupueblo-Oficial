<?php
$servername = "localhost";
$username = "tupueblo";
$password = "1234";
$dbname = "tupueblo";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die(json_encode(['error' => 'Conexión fallida: ' . $conn->connect_error]));
}

// Obtener datos del cliente
$data = json_decode(file_get_contents('php://input'), true);

if (!$data) {
    die(json_encode(['error' => 'Datos no válidos']));
}

$id = $data['id'] ?? null;
$nombre = $data['nombre'] ?? null;
$descripcion = $data['descripcion'] ?? null;
$lat = $data['lat'] ?? null;
$lon = $data['lon'] ?? null;
$imagenes = $data['imagenes'] ?? null;

if (!$id || !$nombre || !$lat || !$lon || !$imagenes) {
    die(json_encode(['error' => 'Faltan datos en la solicitud', 'data_received' => $data]));
}

// Escapar datos para evitar inyecciones SQL
$id = $conn->real_escape_string($id);
$nombre = $conn->real_escape_string($nombre);
$descripcion = $conn->real_escape_string($descripcion);
$lat = $conn->real_escape_string($lat);
$lon = $conn->real_escape_string($lon);
$imagenes = json_encode($conn->real_escape_string($imagenes));

// Consulta SQL para actualizar un pueblo existente
$sql = "UPDATE pueblos SET nombre='$nombre', descripcion='$descripcion', lat='$lat', lon='$lon', imagenes='$imagenes' WHERE id='$id'";

if ($conn->query($sql) === TRUE) {
    echo json_encode(['success' => 'Pueblo actualizado con éxito']);
} else {
    echo json_encode(['error' => 'Error: ' . $conn->error]);
}

$conn->close();
?>