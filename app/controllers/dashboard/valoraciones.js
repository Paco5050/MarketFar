const API_COMENTARIO = '../../app/api/dashboard/valoraciones.php?action=';

// Método manejador de eventos que se ejecuta cuando el documento ha cargado.
document.addEventListener('DOMContentLoaded', function () {
    // Se llama a la función que obtiene los registros para llenar la tabla. Se encuentra en el archivo components.js
    readRows(API_COMENTARIO);
});

// Función para llenar la tabla con los datos de los registros. Se manda a llamar en la función readRows().
function fillTable(dataset) {
    let content = '';
    // Se recorre el conjunto de registros (dataset) fila por fila a través del objeto row.
    dataset.map(function (row) {
        // Se establece un icono para el estado del cliente.
        // Se crean y concatenan las filas de la tabla con los datos de cada registro.
        content +=`
            <tr>
                <td>${row.nombre_producto}</td>
                <td>${row.descripcion_producto}</td>
                <td>
                    <a href="comentarios.php?id=${row.id_producto}" class="btn waves-effect blue tooltipped" data-tooltip="Ver Comentarios"><i class="material-icons">comment</i></a>
                </td>
            </tr>
        `;
    });
    // Se agregan las filas al cuerpo de la tabla mediante su id para mostrar los registros.
    document.getElementById('tbody-rows').innerHTML = content;
    // Se inicializa el componente Tooltip asignado a los enlaces para que funcionen las sugerencias textuales.
    M.Tooltip.init(document.querySelectorAll('.tooltipped'));
}
