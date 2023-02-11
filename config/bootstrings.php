
<?php
// echo ROOT_DIR . '/config/parameters.php';
// exit;
$config = require_once ROOT_DIR . '/config/parameters.php';
define('_DB_HOST_', $config['parameters']['database']['database_host']);
define('_DB_NAME_', $config['parameters']['database']['database_name']);
define('_DB_PORT_', $config['parameters']['database']['database_port']);
define('_DB_USER_', $config['parameters']['database']['database_user']);
define('_DB_PASSWD_', $config['parameters']['database']['database_password']);
define('_DB_PREFIX_',  $config['parameters']['database']['database_prefix']);
define('_DB_ENGINE_',  $config['parameters']['database']['database_engine']);
define('_DB_CHARSET_',  $config['parameters']['database']['database_charset']);
define('_CACHING_SYSTEM_',  $config['parameters']['caching']['caching_system']);
define('_CACHE_LIFETIME_',  $config['parameters']['caching']['cache_lifetime']);
define('_DB_FETCH_',  PDO::FETCH_ASSOC);
if (!defined('APP_VERSION')) {
  define('APP_VERSION', Configuration::get('APP_VERSION'));
}
