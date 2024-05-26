<?php
$servername = "localhost";
$username = "tupueblo";
$password = "1234";
$dbname = "tupueblo";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

$id = $_POST['id'];
$nombre = $_POST['nombre'];
$descripcion = $_POST['descripcion'];
$imagen = $_POST['imagen'];

$sql = "UPDATE actividades SET nombre = ?, descripcion = ?, imagen = ? WHERE id = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("sssi", $nombre, $descripcion, $imagen, $id);
$stmt->execute();

if ($stmt->affected_rows > 0) {
    echo "Actividad actualizada exitosamente";
} else {
    echo "Error actualizando actividad";
}

$stmt->close();
$conn->close();
?>