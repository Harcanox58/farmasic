<?php
define('E_FATAL',  E_ERROR | E_USER_ERROR | E_PARSE | E_CORE_ERROR |
    E_COMPILE_ERROR | E_RECOVERABLE_ERROR);

define('ENV', 'dev');

//Custom error handling vars
define('DISPLAY_ERRORS', TRUE);
define('ERROR_REPORTING', E_ALL | E_STRICT);
define('LOG_ERRORS', TRUE);

ini_set('display_errors', 'off');

set_error_handler('handler');
register_shutdown_function('shut');
// set_error_handler((array(__CLASS__, 'handler'));


//Function to catch no user error handler function errors...
function shut()
{

    $error = error_get_last();

    if ($error && ($error['type'] & E_FATAL)) {
        handler($error['type'], $error['message'], $error['file'], $error['line']);
    }
}

function handler($errno, $errstr, $errfile, $errline)
{

    switch ($errno) {

        case E_ERROR: // 1 //
            $typestr = 'E_ERROR';
            break;
        case E_WARNING: // 2 //
            $typestr = 'E_WARNING';
            break;
        case E_PARSE: // 4 //
            $typestr = 'E_PARSE';
            break;
        case E_NOTICE: // 8 //
            $typestr = 'E_NOTICE';
            break;
        case E_CORE_ERROR: // 16 //
            $typestr = 'E_CORE_ERROR';
            break;
        case E_CORE_WARNING: // 32 //
            $typestr = 'E_CORE_WARNING';
            break;
        case E_COMPILE_ERROR: // 64 //
            $typestr = 'E_COMPILE_ERROR';
            break;
        case E_CORE_WARNING: // 128 //
            $typestr = 'E_COMPILE_WARNING';
            break;
        case E_USER_ERROR: // 256 //
            $typestr = 'E_USER_ERROR';
            break;
        case E_USER_WARNING: // 512 //
            $typestr = 'E_USER_WARNING';
            break;
        case E_USER_NOTICE: // 1024 //
            $typestr = 'E_USER_NOTICE';
            break;
        case E_STRICT: // 2048 //
            $typestr = 'E_STRICT';
            break;
        case E_RECOVERABLE_ERROR: // 4096 //
            $typestr = 'E_RECOVERABLE_ERROR';
            break;
        case E_DEPRECATED: // 8192 //
            $typestr = 'E_DEPRECATED';
            break;
        case E_USER_DEPRECATED: // 16384 //
            $typestr = 'E_USER_DEPRECATED';
            break;
    }

    $myFile = $errfile;
    $lines = file($myFile);
    $errorContent = null;

    $x = 1;
    foreach ($lines as $value) {
        if ($x == $errline) {
            $errorContent = htmlspecialchars("Línea " . $x . ": " . $value);
        }
        $x++;
    }

    $message = "<pre></pre><hr><div class='badge badge-danger' style='display: inline-block;
        padding: .25em .4em;
        font-size: 1em;
        font-weight: 700;
        line-height: 1;
        white-space: nowrap;
        vertical-align: baseline;
        border-radius: .25rem;
        transition: color .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out,box-shadow .15s ease-in-out;
        color: #fff;
        background-color: #dc3545;width:99%;height:auto!important;white-space:normal'><b>$typestr: </b>$errstr<b> IN FILE: </b>$errfile</div><hr><pre style='    font-size: .9em;
        border: 1px solid grey;
        width: 98%;
        border-left: 5px solid red;
        border-radius: 5px;
        padding: 10px;
        line-height: 24px;
        background-image: repeating-linear-gradient( 180deg, #eee 0px, #eee 24px, #fff 24px, #fff 48px);
        background-position: 0px 10px;'>" . $errorContent . "</pre>";

    if (LOG_ERRORS)
        $report = "[" . date("Y-m-d h:m:s") . "] [$typestr: $errstr] [IN FILE $errfile] [LINE $errline]\n";
    if (!is_dir(VAR_DIR)) {
        mkdir(VAR_DIR);
        if (!is_dir(VAR_DIR) . 'log')
            mkdir(VAR_DIR . 'log');
    }
    error_log($report, 3, VAR_DIR . 'log/'  . 'error.log');

    if (!($errno & ERROR_REPORTING))
        return;

    if (DISPLAY_ERRORS)
        printf('%s', $message);
    exit;
}
function CodeException($message = null)
{
    echo '<pre>';
    // echo '<h1>Error 500</h1>';
    echo '<h1>' . $message . '</h1>';
    echo '</pre>';
    exit;
}
