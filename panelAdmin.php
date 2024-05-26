<?php
session_start();
if (!array_key_exists("logged_in", $_SESSION)) {
  header("location: inicio.html");
  die();
}

if (!$_SESSION["logged_in"]) {
  header("location: inicio.html");
  die();
}
?>

<!DOCTYPE html>
<html lang="es">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="static/CSS/style.css">
  <title>Admin Panel</title>
  <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
</head>

<body>

  <header>
    <div class="header-container">
      <img src="static/IMG/logo.png" alt="Logo Tupueblo" class="logo">
      <nav>
        <ul>
          <li><a href="inicio.html">Inicio</a></li>
          <li><a href="sobreNosotros.html">Sobre nosotros</a></li>
          <li><a href="puebloMes.html">Pueblo del més</a></li>
          <li><a href="login.html">Login</a></li>
        </ul>
      </nav>
    </div>
  </header>

  <div class="container">
    <h2 style="background-color: #2b782e; border-radius: 10px;">Panel de Administración</h2>
    <h3>Pueblos</h3>
    <form id="crud-form">
      <input type="hidden" id="id">
      <label for="nombre">Nombre:</label>
      <input type="text" id="nombre" required>
      <label for="descripcion">Descripción:</label>
      <textarea id="descripcion" required></textarea>
      <label for="lat">Latitud:</label>
      <input type="text" id="lat" required>
      <label for="lon">Longitud:</label>
      <input type="text" id="lon" required>
      <label for="imagenes">Imágenes (JSON):</label>
      <textarea id="imagenes" required></textarea>
      <button type="button" onclick="createOrUpdate()">Guardar</button>
      <button type="button" onclick="clearForm()">Limpiar</button>
    </form>

    <h3>Lista de Pueblos</h3>
    <div id="listaPueblos">
      <table id="pueblos-table">
        <thead>
          <tr>
            <th>ID</th>
            <th>Nombre</th>
            <th>Descripción</th>
            <th>Latitud</th>
            <th>Longitud</th>
            <th>Imágenes</th>
            <th>Acciones</th>
          </tr>
        </thead>
        <tbody></tbody>
      </table>
    </div>
  </div>

  <script src="static/JS/crud.js"></script>
</body>

</html>