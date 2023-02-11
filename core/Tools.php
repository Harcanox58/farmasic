<?php
class Tools
{

    protected static function methodPost($clave)
    {
        if (isset($_POST[$clave]) && !empty($_POST[$clave])) {
            // $_POST[$clave]=htmlspecialchars($_POST[$clave],END_QUOTES);
            return trim($_POST[$clave]);
        }
        return '';
    }
    protected function methodGet($int)
    {
        $int = (int) $int;
        if (is_int($int)) {
            return $int;
        } else {
            return 0;
        }
    }
    public static function redirect($url = false)
    {

        if ($url) {
            if (defined('ADMIN_DIR')) {
                header("location:" . Tools::baseUrl() . ADMIN_PATH . $url);
            } else {
                header("location:" . Tools::baseUrl() . $url);
            }
            exit();
        } else {
            if (defined('ADMIN_DIR')) {
                header("location:" . Tools::baseUrl() . ADMIN_PATH);
            } else {
                header("location:" . Tools::baseUrl());
            }
            exit();
        }
    }
    public static function redirectAdmin($url = false)
    {
        header("location:" . $url);
        exit();
    }
    public static function getValue($key, $default_value = false)
    {
        if (empty($key) || !is_string($key)) {
            return false;
        }

        $value = (isset($_POST[$key]) ? $_POST[$key] : (isset($_GET[$key]) ? $_GET[$key] : $default_value));

        if (is_string($value)) {
            return urldecode(preg_replace('/((\%5C0+)|(\%00+))/i', '', urlencode($value)));
        }
        if (isset($_FILES[$key])) {
            return $_FILES[$key];
        }

        return $value;
    }
    public static function isAjaxRequest()
    {
        return !empty($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest';
    }
    public static function ajaxResponse($arr)
    {
        header('Content-Type: application/json');
        echo json_encode($arr);
    }
    public static function ajaxRedirectTo(string $target)
    {
        if (defined('ADMIN_DIR')) {
            $rute = Tools::baseUrl() . ADMIN_PATH . '/?controller=' . $target . '&token=' . Tools::getValue('token');
        } else {
            $rute =  Tools::baseUrl() . $target;
        }
        header('Content-Type: application/json');
        echo json_encode($rute);
    }
    public static function ajaxRedirect(string $target)
    {
        if (defined('ADMIN_DIR')) {
            $arr = array('redirect' => Tools::baseUrl() . ADMIN_PATH . '/?controller=' . $target . '&token=' . Tools::getValue('token'));
        } else {
            $arr = array('redirect' => Tools::baseUrl() . $target);
        }
        header('Content-Type: application/json');
        echo json_encode($arr);
    }
    public static function valid($validate)
    {
        if (isset($validate)) {
            return $validate;
        } else {
            return null;
        }
    }
    public static function select2($id, $name, $value,  $YesOrNot = false)
    {
        $html = '<option value="-1"></option>';
        if (isset($value) && $value == $id) {
            $html .= '<option value="' . $id . '" selected="selected">' . $name . '</option>';
        } else {
            $html .= '<option value="' . $id . '">' . $name . '</option>';
        }
        return $html;
    }
    public static function fetchGrid($headers)
    {
        $rows = array();
        foreach (Catalog::getDiscounts() as $d) {
            $line = '';
            foreach ($headers as $head) {
                if (isset($head['type'])) {
                    switch ($head['type']) {
                        case 'img':
                            break;
                        case 'two-lines':
                            $line .=  '<td class="' . (isset($head['class']) ? $head['class'] : '') . '"><span class="' . (isset($head['one']['class']) ? $head['one']['class'] : '') . '">' . $d[$head['one']['field']] . '</span><br><span class="' . (isset($head['two']['class']) ? $head['two']['class'] : '') . '">' . $d[$head['two']['field']] . '</span></td>';
                            break;
                    }
                } else {
                    $line .=  '<td class="' . (isset($head['class']) ? $head['class'] : '') . '">' . $d[$head['field']] . '</td>';
                }
            }
            print_r($line);
            $rows[] = $line;
        }
        return $rows;
    }
    public static function genOptions($source)
    {
        $options = array();
        foreach ($source as $opt) {
            $option = array();
            $option['value'] = $opt['id_option'];
            $option['label'] = $opt['name'];
            $options[] = $option;
        }
        return $options;
    }
    public static function baseUrl()
    {
        // if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off') {
        //     $protocolo = 'https';
        // } else {
        //     $protocolo = 'http';
        // }
        // $server_name = $_SERVER['SERVER_NAME'];
        // $uri = $_SERVER['REQUEST_URI'];
        // // $uri = explode("/", parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH));
        // $uri(array_slice($uri, -2, 1)[0]);

        // if ($uri == ROOT_PATH) {
        //     // $path = explode('/', parse_url($uri, PHP_URL_PATH));
        //     // print_r($path);
        //     return $protocolo . '://' . $server_name . '/' . $uri . '/';
        // } else {
        //     return $protocolo . '://' . $server_name . '/';
        // }
        $protocol = empty($_SERVER['HTTPS']) ? 'http' : 'https';
        return $protocol . '://' . $_SERVER['SERVER_NAME'] . dirname($_SERVER['SCRIPT_NAME']) . '/';
    }
    public static function moneyFormat($amount, $currency = 'BS', $useSimbol = true)
    {
        $decimals = 0;
        $dec_point = '';
        $thousands_sep = '';
        $simbol = '';
        switch ($currency) {
            case 'USD':
                $decimals = 2;
                $dec_point = '.';
                $thousands_sep = ',';
                $simbol = '$';
                break;

            case 'BS':
                $decimals = 2;
                $dec_point = ',';
                $thousands_sep = '.';
                $simbol = 'Bs. ';
                break;
        }
        if ($useSimbol == false) {
            echo number_format($amount, $decimals, $dec_point, $thousands_sep);
        } else {
            echo $simbol . number_format($amount, $decimals, $dec_point, $thousands_sep);
        }
    }
    public static function  displayPrice($price, $type = null)
    {

        $formatter = new NumberFormatter('en_GB',  NumberFormatter::CURRENCY);
        if ($type == null) {
            $type = 'USD';
        }
        echo $formatter->formatCurrency($price, $type);
    }
    public static function fileUpload(string $inputName, string $target_dir = null, int $maxSize = null)
    {
        if (!empty($_FILES)) {
            if (!file_exists($target_dir)) {
                mkdir($target_dir, 0777, true);
            }
            $target_file = $target_dir . basename($_FILES[$inputName]["name"]);
            if (file_exists($target_file) && !empty(basename($_FILES[$inputName]["name"]))) {
                unlink($target_file);
            }
            if ($_FILES[$inputName]["size"] < 50000000000) {
                if (move_uploaded_file($_FILES[$inputName]["tmp_name"], $target_file)) {
                    return true;
                }
                return false;
            }
            return false;
        }
        return false;
    }
    public static function findFilesToUrl(string $directory, array $extensions)
    {
        $arrFiles = array();
        $files = scandir($directory);
        for ($i = 0; $i < count($files); $i++) {
            $file = array_flip(explode('.', $files[$i]));
            foreach ($extensions as $ext) {
                if (isset($file[$ext])) {
                    $arrFiles[] = Tools::pathToURL($directory) . $files[$i];
                }
            }
        }

        return $arrFiles;
        // $it = new RecursiveDirectoryIterator($directory);
        // foreach (new RecursiveIteratorIterator($it) as $file) {
        //     $FILE = array_flip(explode('.', $file));
        //     dev($FILE);

        //     for ($i = 0; $i < count($extensions); $i++) {
        //         if (isset($FILE[$extensions[$i]])) {
        //             echo $file;
        //         }
        //     }
        // }
    }
    public static function response($type, $message)
    {
        return Tools::ajaxResponse(['type' => $type, 'message' => $message]);
    }
    public static function clearUSD($value)
    {
        return str_replace('$ ', '', str_replace(',', '.', $value));
    }
    public static function clearBS($value)
    {
        return str_replace('Bs. ', '', str_replace(',', '.', $value));
    }
    public static function ajaxRequest($request)
    {
        if (defined('ADMIN_DIR')) {
            return Tools::baseUrl() . ADMIN_PATH . '/?controller=' . $request . '&token=' . Tools::getValue('token');
        } else {
            return Tools::baseUrl() . $request;
        }
    }
    public static function  pathToURL($path)
    {
        //Replace backslashes to slashes if exists, because no URL use backslashes
        $path = str_replace("\\", "/", realpath($path));

        //if the $path does not contain the document root in it, then it is not reachable
        $pos = strpos($path, $_SERVER['DOCUMENT_ROOT']);
        if ($pos === false) return false;

        if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off') {
            $protocolo = 'https';
        } else {
            $protocolo = 'http';
        }
        $server_name = $_SERVER['SERVER_NAME'];
        //just cut the DOCUMENT_ROOT part of the $path
        return $protocolo . '://' . $server_name . substr($path, strlen($_SERVER['DOCUMENT_ROOT'])) . '/';
        //Note: usually /images is the same with http://somedomain.com/images,
        //      So let's not bother adding domain name here.
    }
    public static function getClientIP()
    {
        if (!empty($_SERVER['HTTP_CLIENT_IP'])) {
            $ip = $_SERVER['HTTP_CLIENT_IP'];
        } elseif (!empty($_SERVER['HTTP_X_FORWARDED_FOR'])) {
            $ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
        } else {
            $ip = $_SERVER['REMOTE_ADDR'];
        }
        return $ip;
    }
    public static function ip_details($ip)
    {
        $json = file_get_contents("http://ipinfo.io/{$ip}/geo");
        $details = json_decode($json, true);
        return $details;
    }
}
