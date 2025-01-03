<?php 
error_reporting(0);
session_start();

$id_rol = $_SESSION['id_rol'];
$usuario = $_SESSION['usuario'];

if(isset($_SESSION['usuario'])){
    $respAX["cod"] = 0;
    $respAX["msj"] = "Primero debes inciar sesión y validar tus credenciales...";
    $respAX["icono"] = "error";
    $respAX["extra"] = $hoy;
    echo "<script>location.assign(../index.php)</script>";
}