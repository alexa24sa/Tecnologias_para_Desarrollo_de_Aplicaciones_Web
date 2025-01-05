<?php

session_start();
include "../conexion.php";

$usuario = $_POST['curp'];
$clave = $_POST['password'];
//EVITAMOS INYECCIONES DE SQL:
$stmt = $conexion->prepare("SELECT curp, contraseña, id_rol FROM usuarios WHERE curp = ?");
$stmt->bind_param("s", $usuario);
$stmt->execute();
$resultado = $stmt->get_result();

$respAX = [];
$hoy = date("j M Y / h:i:s");
if($resultado->num_rows>0){
   $row = $resultado->fetch_assoc();
   $hashed_clave = $row['contraseña'];

   if(password_verify($clave, $hashed_clave)!=NULL){
    $_SESSION['curp'] = $usuario;
    $_SESSION['id_rol'] = $row['id_rol'];

    $respAX["cod"] = 1;
    $respAX["msj"] = "Se registró correctamente tu información";
    $respAX["icono"] = "success";
    $respAX["extra"] = $hoy;
    header("locacion:../vistas/index1.php");
    exit();
   }else{//ERROR A CAUSA DE QUE EL USUARIO AUN NO HA SIDO CREADO
      $respAX["cod"] = 2;
      $respAX["msj"] = "Aun no ha creado su usuario";
      $respAX["icono"] = "error";
      $respAX["extra"] = $hoy;
    header("location:../index.php?error=1");
    exit();
   }

   echo json_encode($respAX);
}else{
   $respAX["cod"] = 2;
   $respAX["msj"] = "Ha ocurrido un error";
   $respAX["icono"] = "error";
   $respAX["extra"] = $hoy;
   header("location:../../index.php?error=1");
   exit();
   echo json_encode($respAX);
}