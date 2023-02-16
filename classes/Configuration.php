<?php
class Configuration
{
   public static function get($name)
   {
      $response = Db::getInstance()->execute('SELECT VALUE FROM ' . _DB_PREFIX_ . 'configurations WHERE name =?', [$name]);
      if (!empty($response)) {
         return $response[0];
      } else {
         return '';
      }
   }
   public static function set($name, $value)
   {
      $response = Db::getInstance()->execute("SELECT id_configuration FROM fs_configurations WHERE `name` = '" . $name . "'");
      if (empty($response)) {
         Db::getInstance()->execute('INSERT INTO fs_configurations (name,value) VALUES (?,?)', [$name, $value]);
      } else {
         Db::getInstance()->execute('UPDATE fs_configurations SET value = ? WHERE name = ?', [$value, $name]);
      }
   }
}
