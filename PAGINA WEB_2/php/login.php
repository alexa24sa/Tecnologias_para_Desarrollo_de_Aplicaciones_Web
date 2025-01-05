<?php
require "../conexion.php";
session_start();

if (isset($_POST['login'])) {
    // Validar que los campos no estén vacíos
    if (!empty($_POST['curp']) && !empty($_POST['contraseña'])) {
        $curp = $_POST['curp'];
        $password = $_POST['contraseña'];

        // Usar una consulta preparada
        $sql = "SELECT curp, contraseña, nombre, id_rol FROM usuarios WHERE curp = ?";
        $stmt = $mysqli->prepare($sql);
        $stmt->bind_param("s", $curp);
        $stmt->execute();
        $resultado = $stmt->get_result();
        $num = $resultado->num_rows;

        if ($num > 0) { // Si el usuario existe
            $row = $resultado->fetch_assoc();
            $password_bd = $row['contraseña'];

            if (password_verify($password, $password_bd)) { // Verificar la contraseña
                $_SESSION['curp'] = $row['curp'];
                $_SESSION['nombre'] = $row['nombre'];
                $_SESSION['id_rol'] = $row['id_rol'];

                header("Location: ../principal.php");
                exit();
            } else {
                echo "La contraseña no coincide";
            }
        } else {
            echo "No existe el usuario";
        }
    } else {
        echo "Por favor completa todos los campos.";
    }
}
?>