<?php
/* Debug only */
if (!defined('_MODE_DEV_')) {
    define('_MODE_DEV_', true);
}
if (!defined('_MODE_MANT_')) {
    define('_MODE_MANT_', true);
}

date_default_timezone_set('America/Caracas');
ini_set('session.gc_maxlifetime', 28800);
session_set_cookie_params(28800);

// Defines directory
$currentDir = dirname(__FILE__);
if (!defined('CURRENT_DIR')) {
    define('CURRENT_DIR', realpath($currentDir . '/..'));
}
if (!defined('CORE_DIR')) {
    define('CORE_DIR', CURRENT_DIR . '/core/');
}
if (!defined('CONTROLLER_DIR')) {
    define('CONTROLLER_DIR', ROOT_DIR . '/controllers/');
}
if (!defined('MODULE_DIR')) {
    define('MODULE_DIR', ROOT_DIR . '/modules/');
}
if (!defined('CONFIG_DIR')) {
    define('CONFIG_DIR', CURRENT_DIR . '/config/');
}
if (!defined('CLASSES_DIR')) {
    define('CLASSES_DIR', CURRENT_DIR . '/classes/');
}
// if (!defined('IMGAES_DIR')) {
//     define('IMGAES_DIR', ROOT_DIR . '/images/');
// }
if (!defined('VAR_DIR')) {
    define('VAR_DIR', ROOT_DIR . '/var/');
}

if (_MODE_DEV_ === true) {
    // @ini_set('display_errors', 'on');
    // @error_reporting(E_ALL | E_STRICT);
    require_once CORE_DIR . 'ErrorHandler.php';
} else {
    @ini_set('display_errors', 'off');
}
// require_once realpath(dirname(__FILE__)) . '/autoload.php';
