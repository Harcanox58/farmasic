<?php

class Request
{
    private $_controlador, $_metodo, $_argumentos, $_modulo, $_modules;
    public function __construct()
    {
        if (isset($_GET['url'])) {
            $url = filter_input(INPUT_GET, 'url', FILTER_SANITIZE_URL);
            $url = explode('/', $url);
            $this->_modules = $this->diployModules();
            $this->_modulo = mb_strtolower(array_shift($url));
            if (in_array($this->_modulo, $this->_modules)) {
                $this->_controlador = $this->_modulo;
                $this->_modulo = true;
            } else {
                $this->_controlador = $this->_modulo;
                $this->_modulo = false;
            }
            if (!Tools::getValue('action')) {
                $this->_metodo = mb_strtolower(array_shift($url));
            } else {
                $this->_metodo = Tools::getValue('action');
            }
            $this->_argumentos = $url;
        }
        // echo $this->_controlador;
        if (!$this->_controlador) {
            $this->_controlador = DEFAULT_CONTROLLER;
        }
        if (!$this->_metodo) {
            $this->_metodo = 'index';
        }
        if (!$this->_argumentos) {
            $this->_argumentos = array();
        }
    }
    public function getModulo()
    {
        return $this->_modulo;
    }
    public function getControlador()
    {
        return $this->_controlador;
    }
    public function getMetodo()
    {
        return $this->_metodo;
    }
    public function getArgumentos()
    {
        return $this->_argumentos;
    }
    public function diployModules()
    {
        $mod = Db::getInstance()->ExecuteS('SELECT * FROM ' . _DB_PREFIX_ . 'modules');
        $modules = array();
        for ($i = 0; $i < count($mod); $i++) {
            $modules[$i] = $mod[$i]['name'];
        }
        return $modules;
    }
    public static function getControllerURI()
    {
        $controller = filter_input(INPUT_GET, 'controller', FILTER_SANITIZE_URL);
        return $controller;
    }
}
