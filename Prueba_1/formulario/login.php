<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

include("conexion.php"); // Conexión a la base de datos.

if (isset($_POST['login'])) {
    // Verificar que los campos no estén vacíos.
    if (
        !empty($_POST['email']) &&
        !empty($_POST['password'])
    ) {
        // Sanitizar y preparar los datos.
        $email = trim($_POST['email']);
        $password = trim($_POST['password']);

        // Consulta preparada para evitar inyección SQL.
        $stmt = $conex->prepare("SELECT * FROM datos WHERE email = ?");
        $stmt->bind_param("s", $email);
        $stmt->execute();
        $resultado = $stmt->get_result();

        if ($resultado->num_rows > 0) {
            $usuario = $resultado->fetch_assoc(); // Obtener los datos del usuario.

            // Verificar si la contraseña ingresada coincide con la almacenada.
            if (password_verify($password, $usuario['contrasena'])) {
                // Alerta de éxito con SweetAlert.
                echo "<script>
                        Swal.fire({
                            title: 'Bienvenido',
                            text: '¡Hola, " . htmlspecialchars($usuario['username']) . "!',
                            icon: 'success'
                        }).then(() => {
                            window.location = 'dashboard.php'; // Redirige a una página protegida después del login.
                        });
                      </script>";
            } else {
                // Contraseña incorrecta.
                echo "<script>
                        Swal.fire({
                            title: 'Error',
                            text: 'La contraseña ingresada es incorrecta.',
                            icon: 'error'
                        });
                      </script>";
            }
        } else {
            // Usuario no encontrado.
            echo "<script>
                    Swal.fire({
                        title: 'Error',
                        text: 'El correo ingresado no está registrado.',
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
