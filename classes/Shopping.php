<?php
class Shopping
{

   public static function newOrder()
   {
      $sql = "INSERT INTO `fs_shopping_orders`(`created_by`,`created_at`,`op_status`) VALUES ('" . Session::get('_uid') . "',NOW(),'N')";
      $res = Db::getInstance()->Execute($sql);
      $sql = "SELECT MAX(id_shopping_order) as id FROM fs_shopping_orders WHERE op_status='N'";
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res)) {
         return $res['id'];
      }
   }
   public static function getOrderDate()
   {
      $sql = "SELECT DATE_FORMAT(created_at, '%Y-%m-%d') created_at FROM fs_shopping_orders WHERE id_shopping_order='" . Tools::getValue('id') . "'";
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res)) {
         return $res['created_at'];
      }
   }
   public static function getOrders()
   {
      Db::getInstance()->Execute('SET @num_row=0;');
      $sql = "SELECT  (@num_row:=@num_row+1) AS num_row, so.id_shopping_order, s.company_name, FORMAT(so.amount,2,'es_VE') AS amount, FORMAT(so.amount_usd,2,'us_US') AS amount_usd, so.created_at, so.op_status,	CASE WHEN so.op_status='A' THEN 'ACTIVO' END AS status FROM	fs_shopping_orders AS so INNER JOIN	fs_entities AS s ON so.id_supplier = s.id_entity";
      $res = Db::getInstance()->ExecuteS($sql);
      if (!empty($res)) {
         return $res;
      } else {
         return false;
      }
   }
   public static function getOrderById()
   {
      $sql = "SELECT	* FROM fs_shopping_orders WHERE id_shopping_order='" . Tools::getValue('id') . "'";
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res)) {
         return $res;
      } else {
         return [];
      }
   }
   public static function getSuppliers()
   {
      Db::getInstance()->Execute('SET @num_row=0;');
      $sql = "SELECT  (@num_row:=@num_row+1) AS num_row, ext.* FROM (SELECT e.id_entity, e.dni,	e.`code`, e.company_name,CASE WHEN e.op_status='A' THEN 'ACTIVO' ELSE 'INACTIVO' END AS status, e.op_status FROM fs_entities AS e	INNER JOIN fs_roles	ON fs_roles.id_role = e.id_role WHERE fs_roles.role_type = 'P' ) ext";
      $res = Db::getInstance()->ExecuteS($sql);
      if (!empty($res)) {
         return $res;
      } else {
         return false;
      }
   }
   public static function getSupplierById()
   {
      $sql = "SELECT * FROM fs_entities WHERE id_entity='" . Tools::getValue('id') . "'";
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res)) {
         return $res;
      } else {
         return [];
      }
   }
   public static function newSupplier()
   {
      $sql = "INSERT INTO `fs_entities`(`id_role`, `dni`, `code`, `company_name`, `username`, `email`, `password`, `address`, `trade_discount`, `credit_limit`, `credit_time`, `contact_person`, `phone`, `op_city`, `op_state`, `op_country`, `date_creation`, `op_status`) VALUES ('2','" . Tools::getValue('dni') . "','" . Tools::getValue('code') . "','" . Tools::getValue('company_name') . "','" . Tools::getValue('username') . "','" . Tools::getValue('email') . "','" . Hash::make(Tools::getValue('password')) . "','" . Tools::getValue('address') . "','" . Tools::getValue('trade_discount') . "','" . Tools::getValue('credit_limit') . "','" . Tools::getValue('credit_time') . "','" . Tools::getValue('contact_person') . "','" . Tools::getValue('phone') . "','" . Tools::getValue('op_city') . "','" . Tools::getValue('op_state') . "','" . Tools::getValue('op_country') . "',NOW(),'" . Tools::getValue('op_status') . "')";
      if (Db::getInstance()->Execute($sql)) {
         return true;
      } else {
         return false;
      }
   }
   public static function saveSupplier()
   {
      $sql = "UPDATE `fs_entities` SET `dni`='" . Tools::getValue('dni') . "',`code`='" . Tools::getValue('code') . "',`company_name`='" . Tools::getValue('company_name') . "',`username`='" . Tools::getValue('username') . "',`email`='" . Tools::getValue('email') . "',`password`='" . Hash::make(Tools::getValue('password')) . "',`address`='" . Tools::getValue('address') . "',`trade_discount`='" . Tools::getValue('trade_discount') . "',`credit_limit`='" . str_replace('$ ', '', str_replace(',', '.', Tools::getValue('credit_limit'))) . "',`credit_time`='" . Tools::getValue('credit_time') . "',`contact_person`='" . Tools::getValue('contact_person') . "',`phone`='" . Tools::getValue('phone') . "',`op_city`='" . Tools::getValue('op_city') . "',`op_state`='" . Tools::getValue('op_state') . "',`op_country`='" . Tools::getValue('op_country') . "',`op_status`='" . Tools::getValue('op_status') . "' WHERE id_entity ='" . Tools::getValue('id') . "'";
      if (Db::getInstance()->Execute($sql)) {
         return true;
      } else {
         return false;
      }
   }
   public function removeSupplier()
   {
      $sql = "UPDATE `fs_entities` SET `op_status`='E' WHERE id_entity ='" . Tools::getValue('id') . "'";
      if (Db::getInstance()->Execute($sql)) {
         return true;
      } else {
         return false;
      }
   }
   public static function getPDFSupplierInfo()
   {
      $sql = "SELECT CASE WHEN r.role_type='A' THEN CONCAT(CASE WHEN e.dni<>'' THEN CONCAT(e.dni,' - ') ELSE '' END, e.firstname,' ',e.lastname) ELSE CONCAT(e.company_name) END AS name, e.address, e.phone,e.contact_person, e.email FROM	fs_shopping_orders AS so INNER JOIN fs_entities AS e ON so.id_supplier = e.id_entity INNER JOIN fs_roles AS r ON e.id_role = r.id_role WHERE id_shopping_order=(SELECT MAX(id_shopping_order) FROM fs_shopping_orders WHERE op_status='F')";
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res)) {
         return $res;
      } else {
         return false;
      }
   }
   public static function getPDFShoppingLines($limit_inf, $limit_sup)
   {
      $sql = "SELECT LPAD(sod.id_shopping_order_detail,6,'0') AS id, p.`name` AS product, sod.quantity, so.exchange_rate, ROUND(p.price_cost * sod.quantity,2) as sub_usd,ROUND(p.price_cost * so.exchange_rate,2) as punit,  ROUND(p.price_cost* sod.quantity * so.exchange_rate, 2) as sub_bs FROM fs_shopping_order_details AS sod	INNER JOIN dev_farmasic.fs_shopping_orders AS so	ON sod.id_shopping_order = so.id_shopping_order INNER JOIN	dev_farmasic.fs_products AS p	ON sod.id_product = p.id_product WHERE sod.id_shopping_order=(SELECT MAX(id_shopping_order) FROM fs_shopping_orders WHERE op_status='F') AND sod.op_status<>'E' ORDER BY p.name ASC LIMIT " . $limit_inf . "," . $limit_sup . ";";
      $res = Db::getInstance()->ExecuteS($sql);
      if (!empty($res)) {
         return $res;
      } else {
         return false;
      }
   }
   public static function getPDFShoppingOrderInfo()
   {
      $sql = "SELECT LPAD(MAX(id_shopping_order),6,'0') as id, max(created_at) AS created_at, max(amount) AS amount FROM fs_shopping_orders WHERE op_status='F'";
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res)) {
         return $res;
      } else {
         return false;
      }
   }
   public static function getPDFLinesPerPage($limiter)
   {
      $sql = "SELECT abs(FLOOR(-(SELECT COUNT(id_shopping_order_detail) FROM fs_shopping_order_details WHERE id_shopping_order=(SELECT MAX(id_shopping_order) FROM fs_shopping_orders WHERE op_status='F'))/" . $limiter . ")) AS max_page";
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res)) {
         return $res['max_page'];
      } else {
         return false;
      }
   }
   public static function validOrder()
   {
      $sql = "UPDATE `fs_shopping_orders` SET `id_supplier`='" . Tools::getValue('supplier') . "' WHERE id_shopping_order='" . Tools::getValue('id') . "'";
      if (Db::getInstance()->Execute($sql)) {
         return true;
      } else {
         return false;
      }
   }
   public static function UpdateRate()
   {
      $sql = "UPDATE `fs_shopping_orders` SET `exchange_rate`='" . str_replace('Bs. ', '', str_replace(',', '.', Tools::getValue('rate'))) . "' WHERE id_shopping_order='" . Tools::getValue('id') . "'";
      if (Db::getInstance()->Execute($sql)) {
         return true;
      } else {
         return false;
      }
   }
   public static function UpdateAmounts()
   {
      $sql = "UPDATE `fs_shopping_orders` SET `amount`='" . str_replace('Bs. ', '', str_replace(',', '.', Tools::getValue('bs'))) . "',`amount_usd`='" . str_replace('$ ', '', str_replace(',', '.', Tools::getValue('usd'))) . "' WHERE id_shopping_order='" . Tools::getValue('id') . "'";
      if (Db::getInstance()->Execute($sql)) {
         return true;
      } else {
         return false;
      }
   }
   public static function addNewShoppingOrderLine()
   {
      $sql = "INSERT INTO `fs_shopping_order_details`(`id_shopping_order`, `id_warehouse`, `id_product`, `profit_margin`, `quantity`,`op_status`) VALUES ('" . Tools::getValue('id') . "','" . Tools::getValue('warehouse') . "','" . Tools::getValue('product') . "','" . Tools::getValue('profit') . "','" . Tools::getValue('quantity') . "','A')";
      if (Db::getInstance()->Execute($sql)) {
         return true;
      } else {
         return false;
      }
   }
   public static function removeShoppingOrderLine()
   {
      $sql = "UPDATE `fs_shopping_order_details` SET `op_status`='E' WHERE id_shopping_order_detail='" . Tools::getValue('id') . "'";
      if (Db::getInstance()->Execute($sql)) {
         return true;
      } else {
         return false;
      }
   }
   public static function getOrderAmount()
   {
      $sql = "SELECT amount FROM fs_shopping_orders where id_shopping_order='" . Tools::getValue('id') . "'";
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res)) {
         return $res['amount'];
      } else {
         return false;
      }
   }
   public static function getOrderAmountUSD()
   {
      $sql = "SELECT amount_usd FROM fs_shopping_orders where id_shopping_order='" . Tools::getValue('id') . "'";
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res)) {
         return $res['amount_usd'];
      } else {
         return false;
      }
   }
   public static function getCurrentSupplier()
   {
      $sql = "SELECT id_supplier FROM fs_shopping_orders where id_shopping_order='" . Tools::getValue('id') . "'";
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res)) {
         return $res['id_supplier'];
      } else {
         return false;
      }
   }
   public static function updateShoppingOrder()
   {
      $sql = "UPDATE `fs_shopping_orders` SET `comments`='" . Tools::getValue('comments') . "', `updated_at`=NOW(), `op_status`='F' WHERE id_shopping_order='" . Tools::getValue('id') . "'";
      self::updateStock();
      self::updatePrices();
      Accounting::generateCXP(Tools::getValue('id'), self::getCurrentSupplier(), self::getOrderAmount(), self::getOrderAmountUSD());
      if (Db::getInstance()->Execute($sql)) {
         return true;
      } else {
         return false;
      }
   }
   public static function updateStock()
   {
      $sql = "SELECT * FROM fs_shopping_order_details WHERE id_shopping_order='" . Tools::getValue('id') . "'";
      foreach (Db::getInstance()->ExecuteS($sql) as $row) {
         $sql = "UPDATE `fs_stock` SET `current_stock`=(SELECT (current_stock + '" . $row['quantity'] . "') AS SUM FROM fs_stock WHERE id_product='" . $row['id_product'] . "' AND id_warehouse='" . $row['id_warehouse'] . "' ) WHERE id_product='" . $row['id_product'] . "' AND id_warehouse='" . $row['id_warehouse'] . "'";
         if (Db::getInstance()->Execute($sql)) {
            return true;
         } else {
            return false;
         }
      }
   }
   public static function updatePrices()
   {
      $sql = "SELECT * FROM fs_shopping_order_details WHERE id_shopping_order='" . Tools::getValue('id') . "'";
      foreach (Db::getInstance()->ExecuteS($sql) as $row) {
         $prices = Catalog::calculePricesExternal($row['id_product'], self::getShoppingOrderRate(), $row['profit_margin']);
         $sql = "UPDATE fs_products SET `price_cost`='" . $prices['price_cost'] . "',`price`='" . $prices['price'] . "',`price_unit`='" . $prices['price_unit'] . "',`price_unit_usd`='" . $prices['price_unit_usd'] . "',`price_usd`='" . $prices['price_usd'] . "',`price_suggested`='" . $prices['price_suggested'] . "',`price_suggested_usd`='" . $prices['price_suggested_usd'] . "',`net_price`='" . $prices['net_price'] . "',`net_price_usd`='" . $prices['net_price_usd'] . "',`profit_margin`='" . $row['profit_margin'] . "' WHERE id_product ='" . $row['id_product'] . "'";
         if (Db::getInstance()->Execute($sql)) {
            return true;
         } else {
            return false;
         }
      }
   }

   public static function getShoppingOrderRate()
   {
      $sql = "SELECT exchange_rate FROM fs_shopping_orders where id_shopping_order='" . Tools::getValue('id') . "'";
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res)) {
         return $res['exchange_rate'];
      } else {
         return false;
      }
   }
   public static function fetchShoppingDetails()
   {
      Db::getInstance()->Execute('SET @num_row=0;');
      $sql = "SELECT  (@num_row:=@num_row+1) AS num_row, sod.id_shopping_order_detail AS id, w.`name` AS warehouse, p.`name` AS product, sod.profit_margin, sod.quantity, so.exchange_rate, ROUND(p.price_cost * sod.quantity,2) as sub_usd,  ROUND(p.price_cost* sod.quantity * so.exchange_rate, 2) as sub_bs FROM fs_shopping_order_details AS sod	INNER JOIN dev_farmasic.fs_shopping_orders AS so	ON sod.id_shopping_order = so.id_shopping_order INNER JOIN dev_farmasic.fs_warehouses AS w	ON sod.id_warehouse = w.id_warehouse INNER JOIN	dev_farmasic.fs_products AS p	ON sod.id_product = p.id_product WHERE sod.id_shopping_order='" . Tools::getValue('id') . "' AND sod.op_status<>'E' ORDER BY p.name ASC";
      $res = Db::getInstance()->ExecuteS($sql);
      if (!empty($res)) {
         return $res;
      } else {
         return [];
      }
   }
   public static function sendOrder()
   {
      # code...
   }
}
