<?php
/*
*	Clase para manejar la tabla clientes de la base de datos. Es clase hija de Validator.
*/
class Ordenes extends Validator
{
    // Declaración de atributos (propiedades).
    private $id = null;
    private $nombres = null;
    private $apellidos = null;
    private $correo = null;

    /*
    *   Métodos para validar y asignar valores de los atributos.
    */
    
    public function setId($value)
    {
        if ($this->validateNaturalNumber($value)) {
            $this->id = $value;
            return true;
        } else {
            return false;
        }
    }

    public function setNombres($value)
    {
        if ($this->validateAlphabetic($value, 1, 50)) {
            $this->nombres = $value;
            return true;
        } else {
            return false;
        }
    }

    public function setApellidos($value)
    {
        if ($this->validateAlphabetic($value, 1, 50)) {
            $this->apellidos = $value;
            return true;
        } else {
            return false;
        }
    }

    public function setCorreo($value)
    {
        if ($this->validateEmail($value)) {
            $this->correo = $value;
            return true;
        } else {
            return false;
        }
    }

    /*
    *   Métodos para obtener valores de los atributos.
    */

    public function getId()
    {
        return $this->id;
    }

    public function getNombres()
    {
        return $this->nombres;
    }

    public function getApellidos()
    {
        return $this->apellidos;
    }

    public function getCorreo()
    {
        return $this->correo;
    }

    /*
    *   Métodos para gestionar la cuenta del cliente.
    */
 
    public function readAll()
    {
        $sql = 'SELECT id_detalle, nombre_producto, cantidad_producto, d.precio_producto, p.estado_pedido, p.id_pedido
        FROM detalle_pedido d, pedidos p, productos s
        WHERE d.id_pedido=p.id_pedido AND d.id_producto=s.id_producto AND p.estado_pedido=1;';
        $params = null;
        return Database::getRows($sql, $params);
    }

    // Método para finalizar un pedido por parte del cliente.
    public function finish()
    {
        $this->estado = 2;
        $sql = 'UPDATE pedidos
                SET estado_pedido = ?
                WHERE id_pedido = ?';
        $params = array($this->estado, $this->id);
        return Database::executeRow($sql, $params);
    }

    public function searchRows($value)
    {
        $sql = 'SELECT id_cliente, nombres_cliente, apellidos_cliente, correo_cliente, dui_cliente, telefono_cliente, nacimiento_cliente, direccion_cliente
                FROM clientes
                WHERE apellidos_cliente ILIKE ? OR nombres_cliente ILIKE ? OR correo_cliente ILIKE ?
                ORDER BY apellidos_cliente';
        $params = array("%$value%", "%$value%", "%$value%");
        return Database::getRows($sql, $params);
    }
}
