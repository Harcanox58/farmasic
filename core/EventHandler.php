<?php
class EventHandler
{
    public function init()
    {
        # code...
    }
    public static function getCurrentConnection()
    {
        $current = Db::getInstance()->Execute('SELECT max(id_connection) from ' . _DB_PREFIX_ . 'connections');
        return $current[0];
    }
    public static function generateConnection()
    {
        Db::getInstance()->Execute("INSERT INTO `" . _DB_PREFIX_ . "_connections`(`date`, `token`, `type`) VALUES ('" . date("Y-m-d") . "','" . Session::get('SESSION_TOKEN') . "','1')");
    }
}
