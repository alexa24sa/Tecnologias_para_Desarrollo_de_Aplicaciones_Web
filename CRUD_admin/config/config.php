<?php
$host = "localhost";
$usuario = "root";
$contrasena = "Cuatecon23+";
$base_de_datos = "sapj_web";

$conexion = new mysqli($host, $usuario, $contrasena, $base_de_datos);

if ($conexion->connect_error) {
    die("Error de conexión: " . $conexion->connect_error);
}
