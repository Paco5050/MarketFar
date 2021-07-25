<?php
// Se incluye la clase con las plantillas del documento.
require_once('../../app/helpers/dashboard_page.php');
// Se imprime la plantilla del encabezado enviando el título de la página web.
Dashboard_Page::headerTemplate('Bienvenido');
?>

<!-- Se muestra un saludo de acuerdo con la hora del cliente -->
<div class="row">
    <h4 class="center-align blue-text" id="greeting"></h4>
</div>

<!-- Se muestran las gráficas de acuerdo con algunos datos disponibles en la base de datos -->
<div class="row">
    <div class="col s6 m4">
        <!-- Se muestra una gráfica de barra con la cantidad de productos por categoría -->
        <canvas id="chart3"></canvas>
    </div>
    <div class="col s6 m4">
        <!-- Se muestra una gráfica de pastel con el porcentaje de productos por categoría -->
        <canvas id="chart2"></canvas>
    </div>
    <div class="col s6 m4">
        <!-- Se muestra una gráfica de pastel con el porcentaje de valoraciones por puntaje -->
        <canvas id="chart5"></canvas>
    </div>
</div>
<div class="row">
    
    <div class="col s6 m12">
        <!-- Se muestra una gráfica de pastel con el porcentaje de valoraciones por puntaje -->
        <canvas id="chart4"></canvas>
    </div>
</div>

<div class="row">
    <div class="col s6 m12">
        <!-- Se muestra una gráfica de pastel con el porcentaje de valoraciones por puntaje -->
        <canvas id="chart1"></canvas>
    </div>
</div>


<!-- Importación del archivo para generar gráficas en tiempo real. Para más información https://www.chartjs.org/ -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
 

<?php
// Se imprime la plantilla del pie enviando el nombre del controlador para la página web.
Dashboard_Page::footerTemplate('main.js');
?>
