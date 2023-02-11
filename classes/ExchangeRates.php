<?php
class ExchangeRates
{
   public static function getRateUSDfromBCV()
   {
      $data = file_get_contents("http://s3.amazonaws.com/dolartoday/data.json");
      $data = json_decode(utf8_decode($data), true);
      return $data['USD']['sicad2'];
   }
   public static function saveNewRate()
   {
      $sql = "INSERT INTO `" . _DB_PREFIX_ . "exchange_rates`(`op_currency`,`inserted_at`, `rate_amount`, `op_status`) VALUES ('1',NOW(),'" . ExchangeRates::getRateUSDfromBCV() . "','A')";
      if (Db::getInstance()->Execute($sql)) {
         return true;
         Audit::trail('insert', 'Nueva Tasa de Cambio USD $' . ExchangeRates::getRateUSDfromBCV(), 'exchange_rates');
      } else {
         return false;
      }
   }
   public static function getRates()
   {
      $sql = "SELECT * FROM `" . _DB_PREFIX_ . "exchange_rates` WHERE op_status='A' ORDER BY 1 DESC";
      $res = Db::getInstance()->ExecuteS($sql);
      if (!empty($res)) {
         return $res;
      } else {
         return false;
      }
   }
   public static function getCurrentRate()
   {
      $sql = "SELECT rate_amount FROM `" . _DB_PREFIX_ . "exchange_rates` WHERE id_exchange_rate=(SELECT MAX(id_exchange_rate) FROM " . _DB_PREFIX_ . "exchange_rates WHERE op_status='A')";
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res)) {
         return $res['rate_amount'];
      } else {
         return false;
      }
   }
   public static function getLastDate()
   {
      $sql = "SELECT `inserted_at` FROM `" . _DB_PREFIX_ . "exchange_rates` WHERE id_exchange_rate=(SELECT MAX(id_exchange_rate) FROM " . _DB_PREFIX_ . "exchange_rates WHERE op_status='A')";
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res)) {
         return date("d-m-Y H:i:s", strtotime($res['inserted_at']));
      } else {
         return false;
      }
   }
   public function updateUSD()
   {
      # code...
   }
}
