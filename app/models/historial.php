<?php
/*
*	Clase para manejar la tabla usuarios de la base de datos. Es clase hija de Validator.
*/
class Historial extends Validator
{
    // Declaración de atributos (propiedades).
    private $id = null;
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

    public function setAlias($value)
    {
        if ($this->validateAlphanumeric($value, 1, 50)) {
            $this->alias = $value;
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
    
    public function getAlias()
    {
        return $this->alias;
    }
    
    /*
    *   Métodos para gestionar la cuenta del usuario.
    */
    
    public function createRowHistorial()
    {
        // Se ingresa el registro de historial.
        $sql = 'INSERT INTO public.historial_sesiones(alias, fecha) VALUES (?, CURRENT_TIMESTAMP);';
        $params = array($this->alias);
        return Database::executeRow($sql, $params);
    }  
    
    public function readAll()
    {
        $sql = 'SELECT alias, fecha
                FROM public.historial_sesiones;';
        $params = null;
        return Database::getRows($sql, $params);
    }
}
