
<?php
/* Theme URLs */
define('THEME_NAME', Configuration::get('FS_THEME_NAME'));
define('DEFAULT_THEME_NAME', Configuration::get('FS_DEFAULT_THEME_NAME'));
if (!defined('ADMIN_DIR')) {
    if ('THEME_NAME' != 'DEFAULT_THEME_NAME') {
        define('THEME_DIR', ROOT_DIR . '/themes/'  . THEME_NAME . '/');
    } else {
        define('THEME_DIR', ROOT_DIR . '/themes/' . DEFAULT_THEME_NAME . '/');
    }
} else {
    if ('THEME_NAME' != 'DEFAULT_THEME_NAME') {
        define('THEME_ADMIN_DIR', ADMIN_DIR . '/themes/' . THEME_NAME . '/');
    } else {
        define('THEME_ADMIN_DIR', ADMIN_DIR . '/themes/' . DEFAULT_THEME_NAME . '/');
    }
}
if (!defined('_DEFAULT_LAYOUT_')) {
    define('_DEFAULT_LAYOUT_', 'dashboard');
}

/* Image URLs */
define('IMG_DIR', ROOT_DIR . '/img/');
define('TMP_IMG_DIR', IMG_DIR . 'tmp/');
define('IMG_URI', Tools::baseUrl() . 'img/');
define('CAT_DIR', IMG_DIR . 'c/');
define('PROD_DIR', IMG_DIR . 'p/');
define('MANU_DIR', IMG_DIR . 'm/');
define('SUP_DIR', IMG_DIR . 'su/');
define('SHIP_DIR_', IMG_DIR . 's/');
define('STORE_DIR', IMG_DIR . 'st/');
define('LANG_DIR', IMG_DIR . 'l/');
define('COL_DIR', IMG_DIR . 'co/');
define('GENDERS_DIR', IMG_DIR . 'genders/');
define('PROD_URI', IMG_URI . 'p/');
define('CAT_URI', IMG_URI . 'c/');
