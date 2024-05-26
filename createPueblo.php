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

$nombre = $data['nombre'] ?? null;
$descripcion = $data['descripcion'] ?? null;
$lat = $data['lat'] ?? null;
$lon = $data['lon'] ?? null;
$imagenes = $data['imagenes'] ?? null;

// Verificar que todos los campos están presentes
if (!$nombre || !$lat || !$lon || !$imagenes) {
    die(json_encode(['error' => 'Faltan datos en la solicitud', 'data_received' => $data]));
}

// Escapar datos para evitar inyecciones SQL
$nombre = $conn->real_escape_string($nombre);
$descripcion = $conn->real_escape_string($descripcion);
$lat = $conn->real_escape_string($lat);
$lon = $conn->real_escape_string($lon);
$imagenes = json_encode($conn->real_escape_string($imagenes));

// Consulta SQL para insertar un nuevo pueblo
$sql = "INSERT INTO pueblos (nombre, descripcion, lat, lon, imagenes) VALUES ('$nombre', '$descripcion', '$lat', '$lon', '$imagenes')";

if ($conn->query($sql) === TRUE) {
    echo json_encode(['success' => 'Pueblo creado con éxito']);
} else {
    echo json_encode(['error' => 'Error: ' . $conn->error]);
}

$conn->close();
?>