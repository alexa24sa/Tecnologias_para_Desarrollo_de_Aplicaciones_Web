<?php
include("../config/config.php");

$fecha_actual = date("Y-m-d");
$filename = "empleados_" . $fecha_actual . ".csv";

// Encabezados para el archivo CSV
$fields = array('curp', 'numero_empleado', 'nombre', 'primer_apellido', 'segundo_apellido', 'Cargo', 'Avatar');

// Consulta SQL para obtener los datos de los empleados
$sql = "SELECT * FROM usuarios";
// Ejecutar la consulta
$result = $conexion->query($sql);

// Verificar si hay datos obtenidos de la consulta
if ($result->num_rows > 0) {
    // Abrir el archivo CSV para escritura
    $fp = fopen('php://output', 'w');

    // Agregar los encabezados al archivo CSV
    fputcsv($fp, $fields);

    // Iterar sobre los resultados y agregar cada fila al archivo CSV
    while ($row = $result->fetch_assoc()) {
        fputcsv($fp, $row);
    }

    // Cerrar el archivo CSV
    fclose($fp);

    // Establecer las cabeceras para descargar el archivo CSV
    header('Content-Type: text/csv');
    header('Content-Disposition: attachment; filename="' . $filename . '"');

    // Detener la ejecución del script para que solo se descargue el archivo CSV
    exit();
} else {
    // Si no hay datos de empleados, redireccionar o mostrar un mensaje de error
    echo "No hay empleados para generar el reporte.";
}

// Cerrar la conexión a la base de datos
$conexion->close();
