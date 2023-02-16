<?php
require '../config/config.inc.php';

class Cron
{
   public static function init()
   {
      echo '<pre>';
      echo '<b>COMENZANDO PROCESO...</b><br>';
      Cron::log();
      Cron::ExchangeRates();
      echo '<b>PROCESO FINALIZADO.</b>';
   }
   public static function getTest()
   {
      $input_line = file_get_contents('https://criptodolar.net/cotizacion/dolar-bcv');
      print_r(preg_split('/<h2 class="card-title">(.*)<\/div>/', $input_line));
   }
   private static function ExchangeRates()
   {
      echo 'CONSULTANDO TAZA DE CAMBIO... <br>';
      $currentRate = ExchangeRates::getCurrentRate();
      echo 'TAZA DE CAMBIO ANTERIOR: <b>$' .  round($currentRate, 2) . '</b><br>';
      $extRate = ExchangeRates::getRateUSDfromBCV();
      echo 'TAZA DE CAMBIO ACTUAL: <b>$' . round($extRate, 2) . '</b><br>';
      if ($extRate != $currentRate) {
         echo 'ACTUALIZANDO TAZA DE CAMBIO... <br>';
         ExchangeRates::saveNewRate();
         echo 'NUEVA TAZA DE CAMBIO ESTABLECIDA EN : <b>$' . round(ExchangeRates::getCurrentRate(), 2) . '</b><br><br><br>';
         Cron::updatePrices();
      } else {
         echo '<br>';
      }
   }
   public static function updatePrices()
   {
      $sql = "SELECT * FROM fs_products WHERE op_status = 'A'";
      $res = Db::getInstance()->ExecuteS($sql);
      $count = count($res);
      echo 'BUSCANDO PRODUCTOS PARA ACTUALIZACIÓN DE PRECIOS...<br>';
      echo 'TOTAL DE PRODUCTOS ENCONTRADOS: <b>' . $count . '</b><br>';
      echo 'ACTUALIZANDO LOS PRECIOS DE LOS PRODUCTOS...<br><br>';
      foreach ($res as $p) {
         $sale_price = $p['price_usd'];
         $price_cost = $p['price_cost'];
         $profit_margin = $p['profit_margin'];
         $newPriceProfit = 0;
         $price_suggested = 0;
         $price_suggested_usd = 0;
         $price = 0;
         $msg = '';
         if (empty($sale_price)) {
            $newProfit = ($price_cost * $profit_margin / 100);
            $newPriceProfit = $price_cost + $newProfit;
            $price = $newPriceProfit;
            $price_suggested_usd = $price;
            $msg = 'Precio de Venta USD:';
         } else {
            if ($sale_price != $newPriceProfit) {
               $price = $sale_price;
               $newProfit = ($price_cost * $profit_margin / 100);
               $price_suggested_usd = $price_cost + $newProfit;
               $msg = 'Precio de Venta USD Personalizado:';
            } else {
               $price = $newPriceProfit;
               $msg = 'Precio de Venta USD:';
            }
         }

         // if ($newPriceProfit == $p['price_usd']) {
         //    $newPriceProfit = $p['price_usd'];
         // }
         $newPrice = ExchangeRates::getCurrentRate() * $price;
         // echo 'newPrice:' . $newPrice . '<br><br>';
         // $newPrice = ($newPrice * ($p['profit_margin'] / 100)) + $newPrice;}
         $discount = Db::getInstance()->Execute("SELECT percentage FROM fs_discounts WHERE id_discount='" . $p['id_discount'] . "'");
         if (!empty($discount['percentage']) && $discount != 0) {
            $discount = $discount['percentage'];
            $percentage = ($newPrice * $discount / 100);
            $percentage_usd = ($price * $discount / 100);
         } else {
            $percentage = 0;
            $percentage_usd = 0;
            $discount = 0;
            // continue;
         }
         $profitSuggested = ($newPrice * $profit_margin / 100);
         $price_suggested = $newPrice + $profitSuggested;
         $netPrice = $newPrice - $percentage;
         $netPrice_usd = $price - $percentage_usd;

         echo 'Producto <b>#' . $p['id_product'] . ' ' . $p['name'] .  '</b><br>Precio de Costo: <b>$' . $price_cost . '</b><br>Beneficio al (<b>' . $profit_margin . '%</b>)<br>Precio USD Sugerido: <b>$' . $price_suggested_usd . '</b><br>Precio BS Sugerido: <b>$' . $price_suggested . '</b><br>' . $msg . ' <b>$' . $price . '</b><br>Precio en BS: <b>' . $newPrice . '</b><br>Descuento del (<b>' . $discount . '%</b>) <br>Precio Neto: <b>' . $netPrice . '</b> en USD: <b>' . $netPrice_usd . '</b><br><br>';

         $sql = "UPDATE " . _DB_PREFIX_ . "products SET `price`='" . $newPrice . "',`price_usd`='" . $price . "',`price_suggested_usd`='" . $price_suggested_usd . "',`price_suggested`='" . $price_suggested . "',`net_price`='" . $netPrice . "',`net_price_usd`='" . $netPrice_usd . "' WHERE id_product=" . $p['id_product'];
         Db::getInstance()->Execute($sql);
      }
   }
   public static function log()
   {
      $log  =
         "-------------------------" . PHP_EOL .
         "CRON JOB: BCV EXCHANGE RATE [" . ExchangeRates::getRateUSDfromBCV() . "] TO [" . ExchangeRates::getCurrentRate() . "]" . ' IN ' . date("F j, Y, g:i a") . PHP_EOL .
         "-------------------------" . PHP_EOL;
      //-
      file_put_contents(ROOT_DIR . '/var/log/cron.log', $log, FILE_APPEND);
   }
}
