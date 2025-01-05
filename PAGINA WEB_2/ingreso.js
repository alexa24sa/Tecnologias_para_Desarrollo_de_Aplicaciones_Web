document.addEventListener("DOMContentLoaded", () => {
  // Asegúrate de inicializar correctamente el validador
  const form = document.querySelector("form#login");

  if (!form) {
    console.error("Formulario con id 'login' no encontrado.");
    return;
  }

  // Inicialización del validador (ajusta según la biblioteca que uses)
  const validator = new Validator(form);

  validator.onSuccess((e) => {
    e.preventDefault(); // Previene el envío por defecto del formulario

    // Enviar los datos usando AJAX
    $.ajax({
      url: "./php/validarSesion.php",
      method: "POST",
      data: $(form).serialize(),
      cache: false,
      success: (respAX) => {
        try {
          // Intentar parsear el JSON de respuesta
          let objAX = JSON.parse(respAX);

          Swal.fire({
            title: "Usuarios",
            html: objAX.msj,
            icon: objAX.icono,
            footer: objAX.extra,
            didDestroy: () => {
              if (objAX.cod == 1) {
                window.location.href = "./index.php";
              } else {
                window.location.reload();
              }
            },
          });
        } catch (error) {
          console.error("Error al parsear JSON:", error);
          Swal.fire({
            title: "Error",
            text: "Ocurrió un error inesperado. Intenta nuevamente.",
            icon: "error",
          });
        }
      },
      error: (jqXHR, textStatus, errorThrown) => {
        console.error("Error en la solicitud AJAX:", textStatus, errorThrown);
        Swal.fire({
          title: "Error",
          text: "No se pudo completar la solicitud. Intenta de nuevo más tarde.",
          icon: "error",
        });
      },
    });
  });
});
