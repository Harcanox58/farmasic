<?php
class Parameters
{
   public static function getCompanies()
   {
      $sql = "SELECT * FROM `" . _DB_PREFIX_ . "companies`";
      $res = Db::getInstance()->ExecuteS($sql);
      if (!empty($res)) {
         return $res;
      } else {
         return false;
      }
   }
   public static function getCompanyById()
   {
      $sql = "SELECT * FROM `" . _DB_PREFIX_ . "companies` WHERE id_company = '" . Tools::getValue('id') . "'";
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res)) {
         return $res;
      } else {
         return false;
      }
   }
   public static function getCities()
   {
      $options = array();
      foreach (Options::get(2) as $opt) {
         $options['value'] = $opt['id_option'];
         $options['label'] = $opt['name'];
      }
      return $options;
   }
   public static function getPDFCompanyInfo()
   {
      $sql = "SELECT c.address, c.email_contact AS email, c.phone FROM fs_companies AS c WHERE c.id_company=1";
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res)) {
         return $res;
      } else {
         return false;
      }
   }
}
