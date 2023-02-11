<?php
class Options
{
   public static function get($groupid)
   {
      $res = Db::getInstance()->execute("SELECT * FROM " . _DB_PREFIX_ . "options WHERE id_option_group='" . $groupid . "'");
      return $res;
   }
   public static function getAll($groupid)
   {
      $res = Db::getInstance()->ExecuteS("SELECT * FROM " . _DB_PREFIX_ . "options WHERE id_option_group='" . $groupid . "'");
      return $res;
   }
   public function add($groupid, $name, $value)
   {
      $res = Db::getInstance()->execute("INSERT INTO " . _DB_PREFIX_ . "options (id_option_group, name, value) VALUES ('" . $groupid . "', '" . $name . "', '" . $value . "')");
      return $res;
   }
}
