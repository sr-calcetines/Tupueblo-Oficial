<?php
$servername = "localhost";
$username = "tupueblo";
$password = "1234";
$dbname = "tupueblo";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

$sql = "SELECT p.id, p.nombre, p.descripcion, p.lat, p.lon, 
        GROUP_CONCAT(a.nombre, '|', a.descripcion, '|', a.imagen SEPARATOR ';') AS actividades
        FROM pueblos p
        LEFT JOIN actividades a ON p.id = a.pueblo_id
        GROUP BY p.id";

$result = $conn->query($sql);

$pueblos = array();
while ($row = $result->fetch_assoc()) {
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
    $pueblos[] = array(
        'id' => $row['id'],
        'nombre' => $row['nombre'],
        'descripcion' => $row['descripcion'],
        'lat' => $row['lat'],
        'lon' => $row['lon'],
        'actividades' => $actividades
    );
}

echo json_encode($pueblos);

$conn->close();
?>