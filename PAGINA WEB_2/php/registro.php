<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<?php
include("../conexion.php"); // Archivo de conexión a la base de datos.


$respAX = [];
$hoy = date("j M Y / h:i:s");

if (isset($_POST['registrar'])) {
    // Verificar que los campos no estén vacíos.
    if (
        strlen($_POST['curp']) >= 1 &&
        strlen($_POST['numero_empleado']) >= 1 &&
        strlen($_POST['password']) >= 1
    ) {
        // Sanitizar y preparar los datos.
        $curp = trim($_POST['curp']);
        $numero_empleado = trim($_POST['numero_empleado']);
        $password = trim($_POST['password']);
        //$fecha = date('Y-m-d'); // Formato adecuado para MySQL.

        // Hashear la contraseña para mayor seguridad.
        $hashed_password = password_hash($password, PASSWORD_DEFAULT);

        // Consulta preparada para evitar inyección SQL.
        
        $stmt = $mysqli->prepare("UPDATE usuarios SET contraseña = ? WHERE curp = ?");
        $stmt->bind_param("ss", $hashed_password, $curp);

        // Ejecutar la consulta y manejar el resultado.
        if ($stmt->execute()) {
            // Alerta de éxito con SweetAlert.
            $respAX["cod"] = 1;
            $respAX["msj"] = "Se registró correctamente tu información";
            $respAX["icono"] = "success";
            $respAX["extra"] = $hoy;
        } else {
            // Alerta de error en caso de fallo.
            $respAX["cod"] = 0;
            $respAX["msj"] = "Favor de intentarlo nuevamente";
            $respAX["icono"] = "error";
            $respAX["extra"] = $hoy;
        }

        $stmt->close(); // Cerrar la consulta preparada.
    } else{
        $respAX["cod"] = 2;
        $respAX["msj"] = "Falta un campo por colocar";
        $respAX["icono"] = "error";
        $respAX["extra"] = $hoy;
      }
    
      //header('Content-Type: application/json');
      echo json_encode($respAX);
}
?>
