<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
include("conexion.php"); // Archivo de conexión a la base de datos.

if (isset($_POST['registrar'])) {
    // Verificar que los campos no estén vacíos.
    if (
        strlen($_POST['username']) >= 1 &&
        strlen($_POST['email']) >= 1 &&
        strlen($_POST['password']) >= 1
    ) {
        // Sanitizar y preparar los datos.
        $username = trim($_POST['username']);
        $email = trim($_POST['email']);
        $password = trim($_POST['password']);
        $fecha = date('Y-m-d'); // Formato adecuado para MySQL.

        // Hashear la contraseña para mayor seguridad.
        $hashed_password = password_hash($password, PASSWORD_DEFAULT);

        // Consulta preparada para evitar inyección SQL.
        $stmt = $conex->prepare("INSERT INTO datos (username, email, contrasena, fecha_registro) VALUES (?, ?, ?, ?)");
        $stmt->bind_param("ssss", $username, $email, $hashed_password, $fecha);

        // Ejecutar la consulta y manejar el resultado.
        if ($stmt->execute()) {
            // Alerta de éxito con SweetAlert.
            echo "<script>
                    Swal.fire({
                        title: 'Registro exitoso',
                        text: '¡Tu cuenta ha sido creada correctamente!',
                        icon: 'success'
                    }).then(() => {
                        window.location = 'login.php'; // Redirige al login después del registro.
                    });
                  </script>";
        } else {
            // Alerta de error en caso de fallo.
            echo "<script>
                    Swal.fire({
                        title: 'Error',
                        text: 'Hubo un problema al registrar tu cuenta. Inténtalo nuevamente.',
                        icon: 'error'
                    });
                  </script>";
        }

        $stmt->close(); // Cerrar la consulta preparada.
    } else {
        // Campos vacíos: alerta de error.
        echo "<script>
                Swal.fire({
                    title: 'Campos incompletos',
                    text: 'Por favor, completa todos los campos.',
                    icon: 'warning'
                });
              </script>";
    }
}
?>
