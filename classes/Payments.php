<?php
class Payments
{
   public static function getOrderExchangeRate()
   {
      $sql = "SELECT fo.exchange_rate FROM fs_orders fo WHERE fo.id_order='" . Tools::getValue('order') . "'";
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res)) {
         return $res['exchange_rate'];
      } else {
         return false;
      }
   }
   public static function reportPayment()
   {
      Tools::fileUpload('img', IMG_DIR . 'cp/' . Tools::getValue('order') . '/');
      Tools::fileUpload('img_psicotropicos', IMG_DIR . 'cp/' . Tools::getValue('order') . '/');

      $comprobante = Tools::getValue('img')['name'];
      $psicotripico = Tools::getValue('img_psicotropicos')['name'];

      if (Tools::getValue('currency') == 1) {
         $amount = Tools::getValue('amount');
         $amount_usd = Tools::getValue('amount') / self::getOrderExchangeRate();
      } else {
         $amount = Tools::getValue('amount') * self::getOrderExchangeRate();
         $amount_usd = Tools::getValue('amount');
      }
      $sql = "INSERT INTO `fs_payments`(`id_customer`, `id_order`, `id_payment_method`, `id_bank`, `op_currency`, `reference`, `exchange_rate`,`amount`,`amount_usd`, `created_at`,`img_psycho`, `img_support`, `observations`, `op_status`) VALUES ('" . Session::get('_uid') . "','" . Tools::getValue('order') . "','" . Tools::getValue('method') . "','" . Tools::getValue('bank') . "','" . Tools::getValue('currency') . "','" . Tools::getValue('ref') . "','" . self::getOrderExchangeRate() . "','" . str_replace(',', '.', $amount) . "','" . str_replace(',', '.', $amount_usd) . "',NOW(),'" . Tools::getValue('img_psicotropicos')['name'] . "','" . Tools::getValue('img')['name'] . "','" . Tools::getValue('obs') . "','P')";
      try {
         Db::getInstance()->Execute($sql);
         Tools::ajaxResponse([
            'response' => [
               'type' => 'success',
               'message' => 'Datos Guardados.',
               'redirect' => Tools::baseUrl() . 'payments'
            ],
         ]);
      } catch (\Throwable $th) {
         //throw $th;
      }
   }
   public static function getTotalPaymentPerOrder()
   {
      $sql = "SELECT CASE WHEN SUM(amount) > 0 THEN SUM(amount) ELSE 0 END AS amount ,CASE WHEN SUM(amount_usd) > 0 THEN SUM(amount_usd) ELSE 0 END AS amount_usd FROM fs_payments WHERE id_order='" . Tools::getValue('id') . "' AND op_status = 'A'";
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res)) {
         return $res;
      } else {
         return false;
      }
   }
   public static function report()
   {
      if (!empty(Tools::getValue('img_psicotropicos')['name']) && !empty(Tools::getValue('img')['name'])) {
         $sql = "INSERT INTO `fs_payments`(`id_customer`, `id_order`, `id_payment_method`, `id_bank`, `op_currency`, `reference`, `amount`, `created_at`,`img_psycho`, `img_support`, `observations`, `op_status`) VALUES ('" . Session::get('_uid') . "','" . Tools::getValue('order') . "','" . Tools::getValue('method') . "','" . Tools::getValue('bank') . "','" . Tools::getValue('currency') . "','" . Tools::getValue('ref') . "','" . str_replace(',', '.', Tools::getValue('amount')) . "',NOW(),'" . Tools::getValue('img_psicotropicos')['name'] . "','" . Tools::getValue('img')['name'] . "','" . Tools::getValue('obs') . "','P')";
         if (Tools::fileUpload('img', IMG_DIR . 'cp/') && Tools::fileUpload('img_psicotropicos', IMG_DIR . 'cpp/')) {
         }
      } elseif (!empty(Tools::getValue('img')['name'])) {
         $sql = "INSERT INTO `fs_payments`(`id_customer`, `id_order`, `id_payment_method`, `id_bank`, `op_currency`, `reference`, `amount`, `created_at`, `img_support`, `observations`, `op_status`) VALUES ('" . Session::get('_uid') . "','" . Tools::getValue('order') . "','" . Tools::getValue('method') . "','" . Tools::getValue('bank') . "','" . Tools::getValue('currency') . "','" . Tools::getValue('ref') . "','" . str_replace(',', '.', Tools::getValue('amount')) . "',NOW(),'" . Tools::getValue('img')['name'] . "','" . Tools::getValue('obs') . "','P')";
         if (Tools::fileUpload('img', IMG_DIR . 'cp/')) {
            if (Db::getInstance()->Execute($sql)) {
               return true;
            } else {
               return false;
            }
         }
      } elseif (!empty(Tools::getValue('img_psicotropicos')['name'])) {
         $sql = "INSERT INTO `fs_payments`(`id_customer`, `id_order`, `id_payment_method`, `id_bank`, `op_currency`, `reference`, `amount`, `created_at`,`img_psycho`, `observations`, `op_status`) VALUES ('" . Session::get('_uid') . "','" . Tools::getValue('order') . "','" . Tools::getValue('method') . "','" . Tools::getValue('bank') . "','" . Tools::getValue('currency') . "','" . Tools::getValue('ref') . "','" . str_replace(',', '.', Tools::getValue('amount')) . "',NOW(),'" . Tools::getValue('img_psicotropicos')['name'] . "','" . Tools::getValue('obs') . "','P')";
         if (Tools::fileUpload('img_psicotropicos', IMG_DIR . 'cpp/')) {
            if (Db::getInstance()->Execute($sql)) {
               return true;
            } else {
               return false;
            }
         }
      } else {
         $sql = "INSERT INTO `fs_payments`(`id_customer`, `id_order`, `id_payment_method`, `id_bank`, `op_currency`, `reference`, `amount`, `created_at`,`observations`, `op_status`) VALUES ('" . Session::get('_uid') . "','" . Tools::getValue('order') . "','" . Tools::getValue('method') . "','" . Tools::getValue('bank') . "','" . Tools::getValue('currency') . "','" . Tools::getValue('ref') . "','" . str_replace(',', '.', Tools::getValue('amount')) . "',NOW(),'" . Tools::getValue('obs') . "','P')";
         if (Db::getInstance()->Execute($sql)) {
            return true;
         } else {
            return false;
         }
      }
   }
   public static function getPaymentsByCustomer()
   {
      $sql = "SELECT p.id_payment, pm.`name`, p.created_at, p.updated_at, p.amount,p.amount_usd, CASE WHEN p.op_status ='P' THEN 'ENVIADO' WHEN p.op_status ='C' THEN 'CANCELADO' WHEN p.op_status ='R' THEN 'RECHAZADO' ELSE 'PROCESADO' END AS op_status, CASE WHEN p.op_status ='P' THEN 'success' WHEN p.op_status ='C' THEN 'navy' WHEN p.op_status ='R' THEN 'danger' ELSE 'info' END AS op_status_color FROM fs_payments as p INNER JOIN fs_payment_methods as pm ON p.id_payment_method = pm.id_payment_menthod WHERE p.id_customer ='" . Session::get('_uid') . "'";
      $res = Db::getInstance()->ExecuteS($sql);
      if (!empty($res)) {
         return $res;
      } else {
         return false;
      }
   }
   public static function getPayments()
   {
      $sql = "SELECT p.created_at, p.op_currency, p.id_payment, pm.`name`, CASE WHEN p.op_status='A' THEN 'APROBADO' WHEN p.op_status='R' THEN 'RECHAZADO' ELSE 'PENDIENTE' END AS status,p.reference, p.amount,CONCAT(b.name,' (',b.num_account,')') AS bank, CASE WHEN p.op_currency = 1 THEN 'BOLIVARES' ELSE 'DOLARES' END AS currency, CASE WHEN p.op_status ='P' THEN 'ENVIADO' WHEN p.op_status ='C' THEN 'CANCELADO' WHEN p.op_status ='R' THEN 'RECHAZADO' ELSE 'PROCESADO' END AS op_status, CASE WHEN p.op_status ='P' THEN 'success' WHEN p.op_status ='C' THEN 'navy' WHEN p.op_status ='R' THEN 'danger' ELSE 'info' END AS op_status_color FROM fs_payments AS p INNER JOIN fs_payment_methods AS pm ON p.id_payment_method = pm.id_payment_menthod INNER JOIN fs_banks AS b ON p.id_bank=b.id_bank ORDER BY p.id_payment";
      $res = Db::getInstance()->ExecuteS($sql);
      if (!empty($res)) {
         return $res;
      } else {
         return false;
      }
   }
   public static function getPaymentsById()
   {
      $sql = "SELECT p.created_at, p.op_currency, LPAD(p.id_order,6,'0') AS id_order,p.id_order AS folder, p.id_payment,p.op_status, p.img_support,p.img_psycho, pm.`name` AS method, CASE WHEN p.op_status='A' THEN 'APROBADO' WHEN p.op_status='R' THEN 'RECHAZADO' ELSE 'PENDIENTE' END AS status,p.reference,b.num_account,b.`name`AS name_bank, p.amount,p.amount_usd,CONCAT(b.name,' (',b.num_account,')') AS bank, CASE WHEN p.op_currency = 1 THEN 'BOLIVARES' ELSE 'DÓLARES' END AS currency FROM fs_payments AS p INNER JOIN fs_payment_methods AS pm ON p.id_payment_method = pm.id_payment_menthod INNER JOIN fs_banks AS b ON p.id_bank=b.id_bank WHERE p.id_payment ='" . Tools::getValue('id') . "' ORDER BY p.id_payment";
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res)) {
         return $res;
      } else {
         return false;
      }
   }
   public static function getPaymentDocs()
   {
   }
   public static function getBanks()
   {
      $sql = "SELECT * FROM fs_banks";
      $res = Db::getInstance()->ExecuteS($sql);
      if (!empty($res)) {
         return $res;
      } else {
         return false;
      }
   }
   public static function getMethods($tangible = false)
   {
      $append = "";
      if ($tangible == false) {
         $append = "WHERE is_tangible='0'";
      }
      $sql = "SELECT * FROM fs_payment_methods " . $append;
      $res = Db::getInstance()->ExecuteS($sql);
      if (!empty($res)) {
         return $res;
      } else {
         return [];
      }
   }
   public static function countPaymentsByCustomer()
   {
      $sql = "SELECT COUNT(id_payment) AS count FROM fs_payments WHERE op_status <> 'C' AND id_customer='" . Session::get('_uid') . "'";
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res)) {
         return $res['count'];
      } else {
         return false;
      }
   }
   public static function countPayments()
   {
      $sql = "SELECT COUNT(id_payment) AS count FROM fs_payments WHERE op_status <> 'C' ";
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res)) {
         return $res['count'];
      } else {
         return false;
      }
   }
}
