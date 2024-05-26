<?php
$servername = "localhost";
$username = "tupueblo";
$password = "1234";
$dbname = "tupueblo";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

$nuevoUsuario = $_POST['nuevo-usuario'];
$nuevaContrasena = $_POST['nueva-contrasena'];

// Encriptar la contraseña
$hashedContrasena = password_hash($nuevaContrasena, PASSWORD_DEFAULT);

$sql = "INSERT INTO usuarios (nombre_usuario, contrasena) VALUES ('$nuevoUsuario', '$hashedContrasena')";

if ($conn->query($sql)) {
    echo "Cuenta creada correctamente";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>
