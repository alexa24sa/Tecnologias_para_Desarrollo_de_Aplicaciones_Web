<?php
$host = "localhost";
$user = "root";
$password = "Cuatecon23+"; // Ajusta tu contraseña
$database = "formulario"; // Asegúrate de que este nombre es correcto

$conex = new mysqli($host, $user, $password, $database);

if ($conex->connect_error) {
    die("Error al conectar con la base de datos: " . $conex->connect_error);
}
?>



