<?php
$servername = "localhost";
$username = "tupueblo";
$password = "1234";
$dbname = "tupueblo";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

$pueblo_id = isset($_GET['id']) ? (int) $_GET['id'] : 0;

$sql = "SELECT p.id, p.nombre, p.descripcion, p.imagenes,
        GROUP_CONCAT(DISTINCT a.nombre, '|', a.descripcion, '|', a.imagen SEPARATOR ';') AS actividades
        FROM pueblos p
        LEFT JOIN actividades a ON p.id = a.pueblo_id
        WHERE p.id = ?
        GROUP BY p.id";

$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $pueblo_id);
$stmt->execute();
$result = $stmt->get_result();

$pueblo = array(
    'id' => null,
    'nombre' => '',
    'descripcion' => '',
    'imagenes' => array(),
    'actividades' => array()
);

if ($row = $result->fetch_assoc()) {
    $actividades = array();
    if ($row['actividades']) {
        foreach (explode(';', $row['actividades']) as $actividad) {
            list($nombre, $descripcion, $imagen) = explode('|', $actividad);
            $actividades[] = array(
                'nombre' => $nombre,
                'descripcion' => $descripcion,
                'imagen' => $imagen
            );
        }
    }

    $imagenes = json_decode($row['imagenes']); // Decodifica el JSON de la columna 'imagenes'

    $pueblo = array(
        'id' => $row['id'],
        'nombre' => $row['nombre'],
        'descripcion' => $row['descripcion'],
        'imagenes' => $imagenes,
        'actividades' => $actividades
    );
}

echo json_encode($pueblo);

$stmt->close();
$conn->close();
?>