<?php
class Companies
{
   public static function getCompanies()
   {
      $res = Db::getInstance()->Executes("SELECT id_company, name FROM `" . _DB_PREFIX_ . "companies` WHERE op_status='A'");
      if ($res) {
         return $res;
      }
   }
   public static function getCompaniesInfoById()
   {
      $res = Db::getInstance()->Execute("SELECT * FROM `" . _DB_PREFIX_ . "companies` WHERE id_company='1'");
      if ($res) {
         return $res;
      }
   }
   public static function getCompaniesbyId()
   {
      $res = Db::getInstance()->Execute("SELECT * FROM `" . _DB_PREFIX_ . "companies` WHERE id_company='" . Tools::getValue('id') . "'");
      if ($res) {
         return $res;
      }
   }
}
