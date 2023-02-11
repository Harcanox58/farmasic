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
      $response = Configuration::get($name);
      if (!$response) {
         Db::getInstance()->execute('INSERT INTO ' . _DB_PREFIX_ . 'configuration (name,value) VALUES (?,?)', [$name, $value]);
      } else {
         Db::getInstance()->execute('UPDATE ' . _DB_PREFIX_ . 'configuration SET value = ? WHERE name = ?', [$value, $name]);
      }
   }
}
