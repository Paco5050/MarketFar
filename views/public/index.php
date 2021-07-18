<?php
// Se incluye la clase con las plantillas del documento.
require_once('../../app/helpers/public_page.php');
// Se imprime la plantilla del encabezado enviando el título de la página web.
Public_Page::headerTemplate('Supermercado');
?>

<!-- Componente Slider con indicadores, altura de 400px y una duración entre transiciones de 6 segundos -->
<div class="slider" id="slider">
    <ul class="slides">
        <li>
            <img src="../../resources/img/slider/img1.jpg" alt="Primera foto">
            <div class="caption center-align">
                <h2>¿Dato curioso?</h2>
                <h4>El producto más consumido en El Salvador es el maíz</h4>
            </div>
        </li>
        <li>
            <img src="../../resources/img/slider/img2.jpg" alt="Segunda foto">
            <div class="caption left-align">
                <h2>¿Preocupado por tus compras?</h2>
                <h4>Aquí en Marketfar, se te ofrece una cantidad de variedad de productos para que puedas realizar tus compras</h4>
            </div>
        </li>
    </ul>
</div>

<!-- Contenedor para mostrar el catálogo de tipos de producto -->
<div class="container">
    <!-- Título del contenido principal -->
    <h4 class="center indigo-text" id="title">Nuestro catálogo</h4>
    <!-- Fila para mostrar las categorías disponibles -->
    <div class="row" id="categorias"></div>
</div>

<?php
// Se imprime la plantilla del pie enviando el nombre del controlador para la página web.
Public_Page::footerTemplate('index.js');
?>