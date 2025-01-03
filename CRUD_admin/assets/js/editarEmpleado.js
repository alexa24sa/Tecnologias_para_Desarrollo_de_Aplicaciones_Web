/**
 * Función para mostrar la modal de editar el empleado
 */
async function editarEmpleado(curp) {
  try {
    // Ocultar la modal si está abierta
    const existingModal = document.getElementById("editarEmpleadoModal");
    if (existingModal) {
      const modal = bootstrap.Modal.getInstance(existingModal);
      if (modal) {
        modal.hide();
      }
      existingModal.remove(); // Eliminar la modal existente
    }

    const response = await fetch("modales/modalEditar.php");
    if (!response.ok) {
      throw new Error("Error al cargar la modal de editar el empleado");
    }
    const modalHTML = await response.text();

    // Crear un elemento div para almacenar el contenido de la modal
    const modalContainer = document.createElement("div");
    modalContainer.innerHTML = modalHTML;

    // Agregar la modal al documento actual
    document.body.appendChild(modalContainer);

    // Mostrar la modal
    const myModal = new bootstrap.Modal(
      modalContainer.querySelector("#editarEmpleadoModal")
    );
    myModal.show();

    await cargarDatosEmpleadoEditar(curp);
  } catch (error) {
    console.error(error);
  }
}

/**
 * Función buscar información del empleado seleccionado y cargarla en la modal
 */
async function cargarDatosEmpleadoEditar(curp) {
  try {
    const response = await axios.get(
      `acciones/detallesEmpleado.php?id=${curp}`
    );
    if (response.status === 200) {
      const { curp, numero_empleado, nombre, primer_apellido, segundo_apellido, cargo, avatar } =
        response.data;

      console.log(curp, numero_empleado, nombre, primer_apellido, segundo_apellido, cargo, avatar);
      document.querySelector("#curp").value = curp;
      document.querySelector("#numero_empleado").value = numero_empleado;
      document.querySelector("#nombre").value = nombre;
      document.querySelector("#primer_apellido").value = primer_apellido;
      document.querySelector("#segundo_apellido").value = segundo_apellido;

      // Seleccionar el número_empleado correspondiente
      seleccionarNombre(numero_empleado);

      // Obtener el elemento <select> de cargo
      seleccionarCargo(cargo);

      document.querySelector("#avatar").value = avatar;
      let elementAvatar = document.querySelector("#avatar");
      if (avatar) {
        elementAvatar.src = `acciones/fotos_empleados/${avatar}`;
      } else {
        elementAvatar.src = "assets/imgs/sin-foto.jpg";
      }
    } else {
      console.log("Error al cargar el empleado a editar");
    }
  } catch (error) {
    console.error(error);
    alert("Hubo un problema al cargar los detalles del empleado");
  }
}

/**
 * Función para seleccionar el id del empleado
 */
function seleccionarNumEmpleado(numero_empleado) {
  // Obtener los elementos de radio para "Masculino" y "Femenino"
  const radioAdmin = document.querySelector("#Admin");
  const radioCapitalHum = document.querySelector("#Capital_Humano");

  // Verificar el valor del sexo del empleado y establecer el atributo checked en el radio correspondiente
  if (numero_empleado <=1999) {
    radioAdmin.checked = true;
  } else if (numero_empleado <=3999 && numero_empleado >2999 ) {
    radioCapitalHum.checked = true;
  }
}

/**
 * Función para seleccionar el cargo del empleado de acuedo al cargo actual
 */
function seleccionarCargo(cargoEmpleado) {
  const selectCargo = document.querySelector("#cargo");
  selectCargo.value = cargoEmpleado;
}

async function actualizarEmpleado(event) {
  try {
    event.preventDefault();

    const formulario = document.querySelector("#formularioEmpleadoEdit");
    // Crear un objeto FormData para enviar los datos del formulario
    const formData = new FormData(formulario);
    const idempleado = formData.get("curp");

    // Enviar los datos del formulario al backend usando Axios
    const response = await axios.post("acciones/updateEmpleado.php", formData);

    // Verificar la respuesta del backend
    if (response.status === 200) {
      console.log("Empleado actualizado exitosamente");

      // Llamar a la función para actualizar la tabla de empleados
      window.actualizarEmpleadoEdit(idempleado);

      //Llamar a la función para mostrar un mensaje de éxito
      if (window.toastrOptions) {
        toastr.options = window.toastrOptions;
        toastr.success("¡El empleado se actualizo correctamente!.");
      }

      setTimeout(() => {
        $("#editarEmpleadoModal").css("opacity", "");
        $("#editarEmpleadoModal").modal("hide");
      }, 600);
    } else {
      console.error("Error al actualizar el empleado");
    }
  } catch (error) {
    console.error("Error al enviar el formulario", error);
  }
}
