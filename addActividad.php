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
$nombre = $_POST['nombre'];
$descripcion = $_POST['descripcion'];
$imagen = $_POST['imagen'];

$sql = "INSERT INTO actividades (pueblo_id, nombre, descripcion, imagen) VALUES (?, ?, ?, ?)";
$stmt = $conn->prepare($sql);
$stmt->bind_param("isss", $pueblo_id, $nombre, $descripcion, $imagen);
$stmt->execute();

if ($stmt->affected_rows > 0) {
    echo "Actividad añadida exitosamente";
} else {
    echo "Error añadiendo actividad";
}

$stmt->close();
$conn->close();
?>