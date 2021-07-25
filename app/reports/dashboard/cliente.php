<?php
require('../../helpers/report_landscape.php');
require('../../models/clientes.php');

// Se instancia la clase para crear el reporte.
$pdf = new Report;
// Se inicia el reporte con el encabezado del documento.
$pdf->startReport2('Cliente del mes :D');

// Se instancia el módelo Categorías para obtener los datos.
$categoria = new Clientes;
// Se verifica si existen registros (categorías) para mostrar, de lo contrario se imprime un mensaje.
if ($dataCategorias = $categoria->readBest()) {
    // Se recorren los registros ($dataCategorias) fila por fila ($rowCategoria).
    foreach ($dataCategorias as $rowCategoria) {
        // Se establece un color de relleno para mostrar el nombre de la categoría.
        $pdf->SetFillColor(175);
        // Se establece la fuente para el nombre de la categoría.
        $pdf->SetFont('Times', 'B', 12);
        // Se imprime una celda con el nombre de la categoría.
        $pdf->Cell(0, 10, utf8_decode('Cliente más fiel: '.$rowCategoria['nombres_cliente']), 1, 1, 'C', 1);
        // Se establece un color de relleno para los encabezados.
        $pdf->SetFillColor(215);
        // Se establece la fuente para los encabezados.
        $pdf->SetFont('Times', 'B', 11);
        // Se imprimen las celdas con los encabezados.
        $pdf->Cell(0, 10, utf8_decode('Total: '.$rowCategoria['total'].' compras ha realizado el cliente'), 1, 0, 'C', 1);
        // Se establece la fuente para los datos de los productos.
        $pdf->SetFont('Times', '', 11);
    }
} else {
    $pdf->Cell(0, 10, utf8_decode('No hay cliente para mostrar'), 1, 1);
}

// Se envía el documento al navegador y se llama al método Footer()
$pdf->Output();
?>