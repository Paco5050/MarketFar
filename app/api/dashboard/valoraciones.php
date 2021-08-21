<?php
require_once('../../helpers/database.php');
require_once('../../helpers/validator.php');
require_once('../../models/valoraciones.php');

// Se comprueba si existe una acción a realizar, de lo contrario se finaliza el script con un mensaje de error.
if (isset($_GET['action'])) {
    // Se crea una sesión o se reanuda la actual para poder utilizar variables de sesión en el script.
    session_start();
    // Se instancia la clase correspondiente.
    $valoracion = new Valoracion;
    // Se declara e inicializa un arreglo para guardar el resultado que retorna la API.
    $result = array('status' => 0, 'error' => 0, 'message' => null, 'exception' => null);
    // Se verifica si existe una sesión iniciada como administrador, de lo contrario se finaliza el script con un mensaje de error.
    if (isset($_SESSION['id_usuario'])) {
        // Se compara la acción a realizar cuando un administrador ha iniciado sesión.
        switch ($_GET['action']) {
            case 'readAll':
                if ($result['dataset'] = $valoracion->readTable()) {
                    $result['status'] = 1;
                } else {
                    if (Database::getException()) {
                        $result['exception'] = Database::getException();
                    } else {
                        $result['exception'] = 'No hay productos registrados';
                    }
                }
                break;
            case 'createComment':
                if ($valoracion->setId($_POST['id_producto'])) {
                    if ($valoracion->setComentario($_POST['comentario'])) {
                        if ($valoracion->setEstrella($_POST['estrella'])) {
                            if ($valoracion->createRow()) {
                                $result['status'] = 1;
                                $result['message'] = 'Valoracion procesada correctamente';
                            } else {
                                $result['exception'] = Database::getException();
                            }
                        }
                        else {
                            $result['exception'] = 'Haga un comentario';
                        }
                    }
                    else {
                        $result['exception'] = 'Coloque corazones';
                    }
                } else {
                    $result['exception'] = 'Hubo un error';
                }
                break;
            case 'readComment':
                if ($valoracion->setId($_POST['id_productos'])) {
                    if ($result['dataset'] = $valoracion->read()) {
                        $result['status'] = 1;
                    } else {
                        // Se verifica si ocurrió un error en la base de datos, de lo contrario la consulta no devolvió un resultado.
                        if (Database::getException()) {
                            $result['exception'] = Database::getException();
                        } else {
                            $result['exception'] = 'Producto inexistente';
                        }
                    }
                } else {
                    $result['exception'] = 'Producto incorrecto';
                }
                break;
            case 'cantidadPolar':
                if ($result['dataset'] = $valoracion->cantidadValoraciones()) {
                    $result['status'] = 1;
                } else {
                    if (Database::getException()) {
                        $result['exception'] = Database::getException();
                    } else {
                        $result['exception'] = 'No hay datos disponibles';
                    }
                }
                break;
            case 'delete':
                if ($valoracion->setId($_POST['id_valoracion'])) {
                    if ($valoracion->deleteRow()) {
                        $result['status'] = 1;
                        $result['message'] = 'Valoracion eliminado correctamente';
                    } else {
                        $result['exception'] = Database::getException();
                    }
                } else {
                    $result['exception'] = 'Valoracion incorrecto';
                }
                break;
        }
        // Se indica el tipo de contenido a mostrar y su respectivo conjunto de caracteres.
        header('content-type: application/json; charset=utf-8');
        // Se imprime el resultado en formato JSON y se retorna al controlador.
        print(json_encode($result));
    } else {
        print(json_encode('Acceso denegado'));
    }
} else {
    print(json_encode('Recurso no disponible'));
}
