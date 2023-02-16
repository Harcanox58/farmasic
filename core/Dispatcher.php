<?php

/**
 *
 */
class Dispatcher
{

    const ADMIN = 0;
    const FRONT = 1;
    const MODULE = 3;
    private static $rq;
    private $controller_not_found;
    public $controller_type;
    private function __construct()
    {
        $this->controller_not_found = 'notfound';
        if (defined('ADMIN_DIR')) {
            $this->controller_type = self::ADMIN;
        } else {
            $this->controller_type = self::FRONT;
        }
        // echo 'controlador tipo:' . $this->controller_type . '<br>';
    }
    public static function getInstanse()
    {

        if (!self::$rq instanceof self) {
            try {
                self::$rq = new self;
            } catch (PDOException $err) {
                echo $err->getMessage();
            }
        }
        return self::$rq;
    }
    public function dispatch()
    {
        self::$rq = new Request();
        Session::init();
        // $modulo = self::$rq->getModulo();
        $controlador = self::$rq->getControlador();
        $controlador = strtolower(self::$rq->getControlador()) . 'Controller';
        $metodo = self::$rq->getMetodo();
        $args = self::$rq->getArgumentos();


        // if ($controlador != 'loginController' || $controlador != 'AdminLoginController') {
        //     if (!Session::get('_uid')) {
        //         if (defined('ADMIN_DIR')) {
        //             Tools::redirectAdmin();
        //         } else {
        //             Tools::redirect();
        //         }
        //     }
        // }

        switch ($this->controller_type) {
            case self::ADMIN:
                $controlador = Request::getControllerURI();
                if (empty($controlador)) {
                    $controlador = $this->getDefaultController($this->controller_type, false);
                }
                if (!Tools::getValue('token')) {
                    Tools::redirectAdmin("?controller=" . ucfirst($controlador) . "&token=" . Hash::lite(Session::get('_token')));
                }
                $controlador = ucfirst($controlador) . 'Controller';
                if ($controlador != 'AdminLoginController') {
                    if (!Session::get('_uid')) {
                        Tools::redirect();
                    }
                }
                $rutaControlador =  CONTROLLER_DIR . 'admin/' . ucfirst($controlador) . '.php';
                break;
            case self::MODULE:
                $rutaControlador =  MODULE_DIR . '/controllers/' . ucfirst($controlador) . '.php';
                break;
            default:
                if (defined('ADMIN_PATH')) {
                    $defaultController = 'Admin' . DEFAULT_CONTROLLER . 'Controller';
                } else {
                    $defaultController = DEFAULT_CONTROLLER . 'Controller';
                }
                if ($controlador != $defaultController) {
                    if (!Session::get('_uid')) {
                        Tools::redirect();
                    }
                }
                $rutaControlador = CONTROLLER_DIR . 'front/'  . ucfirst($controlador) . '.php';
                break;
        }
        // echo $rutaControlador . '<br>';
        // exit;
        if (is_readable($rutaControlador)) {
            require_once $rutaControlador;
            $controlador = new $controlador;
            // var_dump(is_callable(array($controlador, $metodo)) . '<br>');
            // echo $metodo;
            // exit;
            if (Tools::getValue('action')) {
                $metodo = Tools::getValue('action');
            }
            // if (is_callable(array($controlador, $metodo))) {
            //     $metodo = self::$rq->getMetodo();
            // } else {
            //     $metodo = 'home';
            // }
            // echo $metodo;
            // exit;
            if (isset($args)) {
                try {
                    call_user_func_array(array($controlador, $metodo), $args);
                } catch (\Throwable $th) {
                    CodeException('Error al procesar la solicitud ' . $th->getMessage());
                }
            } else {
                call_user_func(array($controlador, $metodo));
            }
        } else {
            CodeException('Controlador no Encontrado');
        }
    }
    private function getDefaultController($controller_type, bool $employee = null)
    {
        switch ($controller_type) {
            case self::ADMIN:
                // Default
                $defaultController = 'AdminDashboard';
                // If there is an employee with a default tab set
                if (!$employee) {
                    $defaultController = 'AdminLogin';
                }
                break;
            case self::MODULE:
                $defaultController = 'default';
                break;
            default:
                $defaultController = 'index';
        }

        return $defaultController;
    }
    public static function getControllers($dirs)
    {
        if (!is_array($dirs)) {
            $dirs = array($dirs);
        }

        $controllers = array();
        foreach ($dirs as $dir) {
            $controllers = array_merge($controllers, Dispatcher::getControllersInDirectory($dir));
        }

        return $controllers;
    }
    public static function getControllersInDirectory($dir)
    {
        if (!is_dir($dir)) {
            return array();
        }

        $controllers = array();
        $controller_files = scandir($dir, SCANDIR_SORT_NONE);
        foreach ($controller_files as $controller_filename) {
            if ($controller_filename[0] != '.') {
                if (!strpos($controller_filename, '.php') && is_dir($dir . $controller_filename)) {
                    $controllers += Dispatcher::getControllersInDirectory(
                        $dir . $controller_filename . DIRECTORY_SEPARATOR
                    );
                } elseif ($controller_filename != 'index.php') {
                    $key = str_replace(array('controller.php', '.php'), '', strtolower($controller_filename));
                    $controllers[$key] = basename($controller_filename, '.php');
                }
            }
        }

        return $controllers;
    }
}
