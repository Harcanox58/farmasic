<?php
class Orders
{
   public static function getOrders()
   {
      Db::getInstance()->Execute('SET @num_row=0;');
      $sql = "SELECT (@num_row:=@num_row+1) AS num_row, o.id_order, CONCAT(o.order_type,'-',LPAD(o.id_order,6,'0')) AS `order`, CASE WHEN r.role_type='A' THEN CONCAT(e.firstname,' ',e.lastname) ELSE e.company_name END AS name, 	o.amount, o.amount_usd,	o.op_status, o.created_at,CASE WHEN o.op_status = 'A' THEN 'EN ESPERA DEL PAGO' WHEN o.op_status = 'C' THEN 'COMPLETADO' WHEN o.op_status = 'X' THEN 'CANCELADO' WHEN o.op_status = 'R' THEN 'PAGO RECHAZADO' END AS status,CASE WHEN o.op_status = 'A' THEN 'indigo' WHEN o.op_status = 'C' THEN 'success' WHEN o.op_status = 'X' THEN 'navy' WHEN o.op_status = 'R' THEN 'danger' END AS op_status_color FROM	fs_orders AS o INNER JOIN	fs_entities AS e ON o.id_customer = e.id_entity INNER JOIN fs_roles AS r ON r.id_role=e.id_role ORDER BY o.id_order DESC";
      $res = Db::getInstance()->ExecuteS($sql);
      if (!empty($res)) {
         return $res;
      } else {
         return false;
      }
   }
   public static function getOrderByCustomers()
   {
      $sql = "SELECT id_order, CONCAT(o.order_type,'-',LPAD(o.id_order,6,'0')) AS `order`, created_at, updated_at, CASE WHEN o.op_status = 'A' THEN 'EN ESPERA DEL PAGO' WHEN o.op_status = 'C' THEN 'COMPLETADO' WHEN o.op_status = 'X' THEN 'CANCELADO' WHEN o.op_status = 'R' THEN 'PAGO RECHAZADO' END AS status,CASE WHEN o.op_status = 'A' THEN 'indigo' WHEN o.op_status = 'C' THEN 'success' WHEN o.op_status = 'X' THEN 'navy' WHEN o.op_status = 'R' THEN 'danger' END AS op_status_color, o.op_status,order_type, amount, amount_usd, exchange_rate FROM fs_orders as o WHERE id_customer='" . Session::get('_uid') . "' ORDER BY id_order DESC";
      $res = Db::getInstance()->Executes($sql);
      if (!empty($res)) {
         return $res;
      } else {
         return false;
      }
   }
   public static function getOrdersOpenByCustomers()
   {
      $sql = "SELECT id_order, amount, amount_usd FROM " . _DB_PREFIX_ . "orders WHERE op_status='P' AND id_customer='" . Session::get('_uid') . "'";
      $res = Db::getInstance()->ExecuteS($sql);
      if (!empty($res)) {
         return $res;
      } else {
         return [];
      }
   }
   public static function countOrdersByCustomer()
   {
      $sql = "SELECT count(fs_orders.id_order) AS res FROM	fs_orders WHERE id_customer = '" . Session::get('_uid') . "'";
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res)) {
         return $res['res'];
      } else {
         return false;
      }
   }
   public static function getPDFOrderLines($OrderId, $limit_inf, $limit_sup)
   {
      $sql = "SELECT	`code`, `name`, quantity, ( quantity * units_per_pack ) AS units, price,(quantity * price) AS subtotal FROM fs_order_lines AS ol INNER JOIN fs_products AS p ON ol.id_product = p.id_product WHERE id_order ='" . $OrderId . "' LIMIT " . $limit_inf . "," . $limit_sup . ";";
      $res = Db::getInstance()->ExecuteS($sql);
      if (!empty($res)) {
         return $res;
      } else {
         return [];
      }
   }
   public static function repayCXC()
   {
      $sql = "UPDATE `fs_cxc` SET `balance`=(SELECT CASE WHEN p.op_currency = 1 THEN (cxc.balance - p.amount) ELSE cxc.balance END as newBalance FROM fs_cxc AS cxc INNER JOIN fs_payments AS p	ON cxc.id_order = p.id_order WHERE cxc.id_order='" . Tools::getValue('id_order') . "' AND p.id_payment='" . Tools::getValue('id_payment') . "'),`balance_usd`=(SELECT CASE WHEN p.op_currency = 2 THEN (cxc.balance_usd - p.amount) ELSE cxc.balance_usd END as newBalance FROM fs_cxc AS cxc INNER JOIN fs_payments AS p	ON cxc.id_order = p.id_order WHERE cxc.id_order='" . Tools::getValue('id_order') . "' AND p.id_payment='" . Tools::getValue('id_payment') . "') WHERE id_order='" . Tools::getValue('id_order') . "'";
      if (Db::getInstance()->Execute($sql)) {
         return true;
      } else {
         return false;
      }
   }
   public static function setPaymentStatus($status)
   {
      $sql = "UPDATE `fs_payments` SET `op_status`='" . $status . "',`updated_at`=NOW() WHERE id_payment='" . Tools::getValue('id_payment') . "'";
      if (Db::getInstance()->Execute($sql)) {
         return true;
      } else {
         return false;
      }
   }
   public static function getOrderById()
   {
      $sql = "SELECT	*, CASE WHEN op_status='P' THEN 'ENVIADO' ELSE 'FACTURADO' END as status  FROM fs_orders WHERE id_order = " . Tools::getValue('id');
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res)) {
         return $res;
      } else {
         return false;
      }
   }
   public static function getItemsByOrderId()
   {
      $sql = "SELECT ol.id_order_line,ol.id_order,ol.id_product,p.name,ol.quantity, ol.amount, ol.amount_usd,(ol.amount *ol.quantity) AS total, (ol.amount_usd *ol.quantity) AS total_usd, (SELECT SUM(current_stock) FROM fs_stock WHERE id_product=ol.id_product) AS current_stock FROM fs_order_lines AS ol INNER JOIN fs_products AS p ON p.id_product=ol.id_product WHERE ol.id_order='" . Tools::getValue('id') . "' ORDER BY ol.id_order_line";
      $res = Db::getInstance()->ExecuteS($sql);
      if (!empty($res)) {
         return $res;
      } else {
         return false;
      }
   }
   public static function getClientByOrderId($id)
   {
      $sql = "SELECT	e.*, CASE WHEN r.role_type='A' THEN CONCAT(e.firstname,' ',e.lastname) ELSE e.company_name END AS name FROM fs_entities AS e INNER JOIN fs_roles AS r ON r.id_role=e.id_role WHERE id_entity ='" . $id . "'";
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res)) {
         return $res;
      } else {
         return false;
      }
   }
   public static function getPaymentsByOrderId()
   {
      $sql = "SELECT p.created_at, p.op_currency, p.id_payment, pm.`name` AS method,p.id_order, CASE WHEN p.op_status='A' THEN 'APROBADO' WHEN p.op_status='R' THEN 'RECHAZADO' ELSE 'PENDIENTE' END AS status,p.reference,b.num_account,b.`name`AS name_bank, p.amount,CONCAT(b.name,' (',b.num_account,')') AS bank, CASE WHEN p.op_currency = 1 THEN 'BOLIVARES' ELSE 'DÓLARES' END AS currency FROM fs_payments AS p INNER JOIN fs_payment_methods AS pm ON p.id_payment_method = pm.id_payment_menthod INNER JOIN fs_banks AS b ON p.id_bank=b.id_bank WHERE p.id_order ='" . Tools::getValue('id') . "' ORDER BY p.id_payment";
      $res = Db::getInstance()->ExecuteS($sql);
      if (!empty($res)) {
         return $res;
      } else {
         return [];
      }
   }
   public static function countOrders()
   {
      $sql = "SELECT COUNT(id_order) AS count FROM fs_orders WHERE op_status='A'";
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res)) {
         return $res['count'];
      } else {
         return false;
      }
   }
   public static function newOrder($type = 'N')
   {
      $sql = "INSERT INTO `fs_orders`(`id_customer`, `order_type`, `amount`, `amount_usd`, `exchange_rate`, `created_at`,`op_status`) VALUES ('" . Session::get('_uid') . "','" . $type . "','" . Cart::getTotalsBS() . "','" . Cart::getTotalsUSD() . "','" . Cart::getCurrentRate() . "',NOW(),'A')";
      $res = Db::getInstance()->Execute($sql);
      self::fetch_lines();
      Accounting::generateCXC(self::getCurrentIdOrder(), Session::get('_uid'), Cart::getTotalsBS(), Cart::getTotalsUSD());
      if (!empty($res)) {
         return true;
      } else {
         return false;
      }
   }
   public static function getLastOrderSend()
   {
      $sql = "SELECT MAX(id_order) as id FROM fs_orders WHERE op_status='A' AND id_customer='" . Session::get('_uid') . "'";
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res['id'])) {
         return $res['id'];
      } else {
         return false;
      }
   }
   public static function genReference()
   {
      $reference = strtoupper(bin2hex(random_bytes(5)));
      $sql = Db::getInstance()->Execute("SELECT id_order FROM fs_orders WHERE reference='" . $reference . "'");
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res)) {
         if (!empty(self::genReference())) {
            return self::genReference();
         }
      } else {
         return $reference;
      }
   }
   public static function fetch_lines()
   {
      $sql = "SELECT * FROM	fs_cart_lines WHERE op_status<>'E' AND id_cart = '" . Cart::getCurrentCart() . "'";
      $cart_lines = Db::getInstance()->ExecuteS($sql);
      foreach ($cart_lines as $cl) {
         $sql = "INSERT INTO `fs_order_lines`(`id_order`, `id_product`, `quantity`, `amount`, `amount_usd`, `created_at`) VALUES ('" . Cart::getCurrentCart() . "','" . $cl['id_product'] . "','" . $cl['quantity'] . "','" . $cl['total'] . "','" . $cl['total_usd'] . "',NOW())";
         Db::getInstance()->Execute($sql);
      }
   }
   public static function getCurrentIdOrder()
   {
      $id = Db::getInstance()->Execute("SELECT MAX(id_order) as id FROM fs_orders WHERE id_customer='" . Session::get('_uid') . "'");
      if (!empty($id)) {
         return $id['id'];
      } else {
         return false;
      }
   }
   public static function getOrderItems()
   {
      $sql = "SELECT ol.id_order_line, p.id_product, p.`name`, ol.quantity, ol.amount, ol.amount_usd, (ol.amount *ol.quantity) AS total, (ol.amount_usd *ol.quantity) AS total_usd, SUM(s.current_stock) AS current_stock FROM fs_order_lines AS ol	INNER JOIN fs_products AS p	ON ol.id_product = p.id_product INNER JOIN fs_stock AS s ON p.id_product = s.id_product WHERE ol.id_order='" . Tools::getValue('id') . "'";
      $res = Db::getInstance()->ExecuteS($sql);
      if (!empty($res)) {
         return $res;
      } else {
         return false;
      }
   }
   public static function processOrder()
   {
      $sql = "UPDATE `fs_cxc` SET `op_status`='F' WHERE id_order='" . Tools::getValue('id') . "'";
      Db::getInstance()->Execute($sql);
      $sql = "UPDATE `fs_orders` SET `updated_at`=NOW(),`op_status`='" . Tools::getValue('op_status') . "' WHERE id_order='" . Tools::getValue('id') . "'";
      Db::getInstance()->Execute($sql);
   }

   public static function genInvoice()
   {
      $sql = "SELECT COUNT(id_invoice) AS res FROM fs_invoices WHERE id_order='" . Tools::getValue('id') . "'";
      $res = Db::getInstance()->Execute($sql);
      if (empty($res['res'])) {
         $orderInfo = Db::getInstance()->Execute("SELECT * FROM fs_orders  WHERE id_order='" . Tools::getValue('id') . "'");
         $corelative = Db::getInstance()->Execute("SELECT CASE WHEN MAX(corelative) IS NULL THEN 1 ELSE MAX(corelative)+1 END as corelative FROM fs_invoices WHERE op_invoice_type='" . Tools::getValue('print_type') . "'");
         $sql = "INSERT INTO `fs_invoices`(`id_entity`, `id_order`, `op_invoice_type`, `corelative`, `amount`, `amount_usd`, `op_currency`, `created_at`, `id_created_by`) VALUES ('" . $orderInfo['id_customer'] . "','" . Tools::getValue('id') . "','" . Tools::getValue('print_type') . "','" . $corelative['corelative'] . "','" . $orderInfo['amount'] . "','" . $orderInfo['amount_usd'] . "','1',NOW(),'" . Session::get('_uid') . "')";
         Db::getInstance()->Execute($sql);
         $res = Db::getInstance()->Execute("SELECT id_invoice FROM fs_invoices WHERE id_order='" . Tools::getValue('id') . "'");
         return $res['id_invoice'];
      } else {
         return null;
      }
   }
   public static function getInvoiceType()
   {
      $res = Db::getInstance()->Execute("SELECT i.op_invoice_type FROM fs_invoices AS i WHERE i.id_order = '" . Tools::getValue('id') . "'");
      if (!empty($res)) {
         return $res['op_invoice_type'];
      } else {
         return false;
      }
   }
   public static function getInvoicesByCustomer()
   {
      Db::getInstance()->Execute('SET @num_row=0;');
      $sql = "SELECT (@num_row:=@num_row+1) AS num_row, i.id_invoice, i.id_order, i.created_at,i.amount,i.amount_usd, CASE WHEN i.op_invoice_type='F' THEN 'FACTURA DE VENTA' ELSE 'NOTA DE VENTA' END AS invoice_type, CASE WHEN r.role_type='A' THEN CONCAT(e.firstname,' ',e.lastname) ELSE CONCAT(e.company_name) END AS name,CONCAT(op_invoice_type,'-',LPAD(i.corelative,6,'0')) AS corelative FROM fs_invoices AS i INNER JOIN fs_entities AS e ON e.id_entity=i.id_entity INNER JOIN fs_roles as r ON r.id_role=e.id_role WHERE i.id_entity='" . Session::get('_uid') . "'";
      $res = Db::getInstance()->ExecuteS($sql);
      if (!empty($res)) {
         return $res;
      } else {
         return false;
      }
   }
   public static function getInvoices()
   {
      Db::getInstance()->Execute('SET @num_row=0;');
      $sql = "SELECT (@num_row:=@num_row+1) AS num_row, i.id_invoice, i.id_order, i.created_at,i.amount,i.amount_usd, CASE WHEN i.op_invoice_type='F' THEN 'FACTURA DE VENTA' ELSE 'NOTA DE VENTA' END AS invoice_type, CASE WHEN r.role_type='A' THEN CONCAT(e.firstname,' ',e.lastname) ELSE CONCAT(e.company_name) END AS name,CONCAT(op_invoice_type,'-',LPAD(i.corelative,6,'0')) AS corelative FROM fs_invoices AS i INNER JOIN fs_entities AS e ON e.id_entity=i.id_entity INNER JOIN fs_roles as r ON r.id_role=e.id_role ";
      $res = Db::getInstance()->ExecuteS($sql);
      if (!empty($res)) {
         return $res;
      } else {
         return false;
      }
   }
   public static function getPDFInvoiceInfo($OrderId)
   {
      $sql = "SELECT LPAD(MAX(corelative),6,'0') as id, max(created_at) AS created_at, op_invoice_type, max(amount) AS amount FROM fs_invoices WHERE id_order='" . $OrderId . "'";
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res)) {
         return $res;
      } else {
         return false;
      }
   }
   public static function getPDFOrderInfo($OrderId)
   {
      $sql = "SELECT LPAD(MAX(id_order),6,'0') as id, max(created_at) AS created_at FROM fs_orders WHERE id_order='" . $OrderId . "'";
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res)) {
         return $res;
      } else {
         return false;
      }
   }
   public static function getPDFClientInfo($OrderId)
   {
      $sql = "SELECT e.`code`, CASE WHEN r.role_type='A' THEN CONCAT(CASE WHEN e.dni<>'' THEN CONCAT(e.dni,'  ') ELSE '' END, e.firstname,' ',e.lastname) ELSE CONCAT(e.dni,' ',e.company_name) END AS name, e.phone, e.address, opt.`name` AS state,e.email FROM fs_orders AS o INNER JOIN fs_entities AS e ON o.id_customer = e.id_entity INNER JOIN fs_options AS opt	ON e.op_state = opt.id_option INNER JOIN fs_roles AS r ON e.id_role = r.id_role WHERE id_order='" . $OrderId . "'";
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res)) {
         return $res;
      } else {
         return false;
      }
   }

   public static function getPDFLinesPerPage($OrderId, $limiter)
   {
      $sql = "SELECT abs(FLOOR(-(SELECT COUNT(id_order_line) FROM fs_order_lines WHERE id_order=" . $OrderId . ")/" . $limiter . ")) AS max_page";
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res)) {
         return $res['max_page'];
      } else {
         return false;
      }
   }
}
