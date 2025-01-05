<?php
$host = "localhost";
$user = "root";
$password = "Cuatecon23+"; // Ajustan tu contraseña
$database = "sapj_web"; // nombre de la base es sapj_web

$mysqli = new mysqli($host, $user, $password, $database);

if ($mysqli->connect_error) {
    die("Error al conectar con la base de datos: " . $mysqli->connect_error);
}
?>



