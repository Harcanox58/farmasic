<?php
class Cart
{
   public static function addItemToCart()
   {
      if (self::verifiqueEmptyCart() && !self::currentCartIsOpen()) {
         if (self::isPsychotropic()) {
            self::newCart('P');
            Audit::trail('create', 'creado un nuevo carrito tipo psicotrópicos #' . Cart::getCurrentCart(), 'fs_cart_lines', Cart::getCurrentCart());
         } else {
            self::newCart('N');
            Audit::trail('create', 'creado un nuevo carrito #' . Cart::getCurrentCart(), 'fs_cart_lines', Cart::getCurrentCart());
         }
      }
      if (!self::isCartPsychotropic()) {
         if (!self::isPsychotropic()) {
            self::addNewLine();
            Tools::ajaxResponse(['response' => ['type' => 'success', 'message' => 'Producto agregado exitosamente.']]);
         } else {
            Tools::ajaxResponse(['response' => ['type' => 'warning', 'message' => 'Lo siento. no puedes solicitar psicotrópicos antes de terminar el pedido actual.']]);
         }
      } else {
         if (self::isPsychotropic()) {
            self::addNewLine('P');
            Tools::ajaxResponse(['response' => ['type' => 'success', 'message' => 'Producto agregado exitosamente.']]);
         } else {
            Tools::ajaxResponse(['response' => ['type' => 'warning', 'message' => 'Lo siento. primero tienes que terminar el pedido psicotrópico actual antes de solicitar otro tipo de producto.']]);
         }
      }
   }

   public static function isPsychotropic()
   {
      $sql = "SELECT ac.is_psychotropic AS res FROM fs_products AS p INNER JOIN fs_active_compounds AS ac ON p.id_active_compound = ac.id_active_compound WHERE p.id_product ='" . Tools::getValue('product') . "'";
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res) && $res['res'] != 0) {
         return true;
      } else {
         return false;
      }
   }
   public static function isCartPsychotropic()
   {
      $sql = "SELECT cart_type AS type FROM fs_cart WHERE id_cart ='" . Cart::getCurrentCart() . "'";
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res) && $res['type'] == 'P') {
         return true;
      } else {
         return false;
      }
   }

   public static function psychotropicInCart()
   {
      $sql = "SELECT	count(cl.product_type) as res FROM fs_cart_lines as cl WHERE cl.product_type='P' AND id_cart ='" . Cart::getCurrentCart() . "'";
      $res = Db::getInstance()->Execute($sql);
      if ($res['res'] != 0) {
         return true;
      } else {
         return false;
      }
   }

   public static function verifiqueEmptyCart()
   {
      $sql = "SELECT count(id_cart_line) as res FROM fs_cart_lines WHERE id_cart='" . Cart::getCurrentCart() . "'";
      $res = Db::getInstance()->Execute($sql);
      if ($res['res'] == 0) {
         return true;
      } else {
         return false;
      }
   }
   public static function currentCartIsOpen()
   {
      $sql = "SELECT op_status as res FROM fs_cart WHERE id_cart='" . Cart::getCurrentCart() . "'";
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res) && $res['res'] == 'A') {
         return true;
      } else {
         return false;
      }
   }
   public static function getCurrentCartIsPsychotropic()
   {
      $sql = "SELECT cart_type FROM fs_cart WHERE id_cart='" . Cart::getCurrentCart() . "'";
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res['cart_type']) && $res['cart_type'] == 'P') {
         return true;
      } else {
         return false;
      }
   }
   public static function getCartData()
   {
      $sql = "SELECT * FROM fs_cart WHERE id_cart='" . Cart::getCurrentCart() . "'";
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res)) {
         return $res;
      } else {
         return false;
      }
   }
   public static function verifiqueCart()
   {
      $sql = "SELECT	count(fs_active_compounds.is_psychotropic) as res FROM fs_cart_lines INNER JOIN fs_products ON fs_cart_lines.id_product = fs_products.id_product INNER JOIN fs_active_compounds ON fs_products.id_active_compound = fs_active_compounds.id_active_compound WHERE is_psychotropic = 1 AND id_cart ='" . Cart::getCurrentCart() . "'";
      $res = Db::getInstance()->ExecuteS($sql);
      if ($res['res'] != 0) {
         return true;
      } else {
         return false;
      }
   }

   public static function addNewLine($type = 'N')
   {
      $sql = "";
      $total = self::calcAmount();
      if (self::verifiqueLine()) {
         $sql = "UPDATE fs_cart_lines SET `quantity`='" . self::calcQuantity() . "', total='" . $total['total'] . "',total_usd='" . $total['total_usd'] . "' WHERE id_product='" . Tools::getValue('product') . "' AND id_cart='" . Cart::getCurrentCart() . "'";
      } else {
         $sql = "INSERT INTO `fs_cart_lines`(`id_cart`, `id_product`, `quantity`, `total`, `total_usd`,`discount_percentage`,`tax_rate`,`op_status`,`product_type`) VALUES ('" . Cart::getCurrentCart() . "','" . Tools::getValue('product') . "','" . self::calcQuantity() . "','" . $total['total'] . "','" . $total['total_usd'] . "','" . Cart::getDiscountPercentage() . "','" . Cart::getTaxRate() . "','A','" . $type . "')";
      }
      Cart::updateStock();
      if (Db::getInstance()->Execute($sql)) {
         Audit::trail('insert', 'Articulo agregado al carrito #' . Cart::getCurrentCart(), 'fs_cart_lines');
         return true;
      } else {
         return false;
      }
   }
   private static function calcAmount()
   {
      $sql = "SELECT price_suggested, price_suggested_usd FROM fs_products WHERE id_product='" . Tools::getValue('product') . "'";
      $prices = Db::getInstance()->Execute($sql);
      if (self::verifiqueLine()) {
         $currentProduct = self::getCurrentProductPerLine();
         $newQuantity = $currentProduct['quantity'] + Tools::getValue('quantity');
         return [
            'total' => $prices['price_suggested'] * $newQuantity,
            'total_usd' => $prices['price_suggested_usd'] * $newQuantity
         ];
      } else {
         return [
            'total' => $prices['price_suggested'] * Tools::getValue('quantity'),
            'total_usd' => $prices['price_suggested_usd'] * Tools::getValue('quantity')
         ];
      }
   }
   private static function calcQuantity()
   {
      if (self::verifiqueLine()) {
         $currentProduct = self::getCurrentProductPerLine();
         $newQuantity = $currentProduct['quantity'] + Tools::getValue('quantity');
         return $newQuantity;
      } else {
         return Tools::getValue('quantity');
      }
   }
   private static function verifiqueLine()
   {
      $sql = "SELECT count(cl.id_cart_line) as res FROM fs_cart_lines as cl WHERE id_product='" . Tools::getValue('product') . "' AND id_cart='" . Cart::getCurrentCart() . "'";
      $res = Db::getInstance()->Execute($sql);
      if ($res['res'] != 0) {
         return true;
      } else {
         return false;
      }
   }
   private static function getCurrentProductPerLine()
   {
      $sql = "SELECT * FROM fs_cart_lines as cl WHERE id_product='" . Tools::getValue('product') . "' AND id_cart='" . Cart::getCurrentCart() . "'";
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res)) {
         return $res;
      } else {
         return false;
      }
   }
   public static function verifiqueStock()
   {
      $sql = "SELECT current_stock FROM fs_stock WHERE id_product='" . Tools::getValue('product') . "' AND id_warehouse=1";
      $res = Db::getInstance()->Execute($sql);
      if ($res[0] > 0 && Tools::getValue('quantity') <= $res[0]) {
         return true;
      } else {
         return false;
      }
   }
   public static function getCurrentStock()
   {
      $sql = "SELECT current_stock FROM fs_stock WHERE id_product='" . Tools::getValue('product') . "' AND id_warehouse=1";
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res)) {
         return $res['current_stock'];
      } else {
         return false;
      }
   }
   public static function revertStock()
   {
      $sql = "UPDATE `fs_stock` SET current_stocK=(SELECT current_stocK + (SELECT quantity - " . Tools::getValue('quantity') . " FROM fs_cart_lines WHERE id_product = " . Tools::getValue('product') . " AND id_cart = " . self::getCurrentCart() . ") FROM fs_stock WHERE id_product=" . Tools::getValue('product') . " AND id_warehouse=(SELECT id_warehouse FROM fs_stock WHERE current_stock = (SELECT MAX(current_stock) FROM fs_stock WHERE id_product=" . Tools::getValue('product') . "))) WHERE id_product=" . Tools::getValue('product') . " AND id_warehouse=(SELECT id_warehouse FROM fs_stock WHERE current_stock = (SELECT MAX(current_stock) FROM fs_stock WHERE id_product=" . Tools::getValue('product') . "))";
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res)) {
         Audit::trail('update', 'se actualizo la existencia para el producto #' . Tools::getValue('product'), 'fs_cart_lines');
         return true;
      } else {
         return false;
      }
   }
   public static function updateStock()
   {
      $sql = "UPDATE `fs_stock` SET current_stocK=(SELECT current_stocK - '" . Tools::getValue('quantity') . "' WHERE id_product='" . Tools::getValue('product') . "' AND id_warehouse=1) WHERE id_product='" . Tools::getValue('product') . "' AND id_warehouse=1 ";
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res)) {
         Audit::trail('update', 'se actualizo la existencia para el producto #' . Tools::getValue('product'), 'fs_cart_lines');
         return true;
      } else {
         return false;
      }
   }
   public static function getTotalBS()
   {
      $sql = "SELECT price * " . Tools::getValue('quantity') . "  as price FROM fs_products WHERE id_product='" . Tools::getValue('product') . "'";
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res)) {
         return $res['price'];
      } else {
         return false;
      }
   }
   public static function getTotalUSD()
   {
      $sql = "SELECT price_usd * " . Tools::getValue('quantity') . " as price_usd FROM fs_products WHERE id_product='" . Tools::getValue('product') . "'";
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res)) {
         return $res['price_usd'];
      } else {
         return false;
      }
   }
   public static function removeItem()
   {
      $sql = "UPDATE `fs_cart_lines` SET `op_status`='E' WHERE id_cart='" . Cart::getCurrentCart() . "' AND id_cart_line='" . Tools::getValue('cart_line') . "'";
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res)) {
         Audit::trail('update', 'Articulo removido del carrito #' . Cart::getCurrentCart(), 'fs_cart_lines');
         return true;
      } else {
         return false;
      }
   }
   public static function cleanCart()
   {
      $sql = "UPDATE `fs_cart_lines` SET `op_status`='E' WHERE id_cart='" . Cart::getCurrentCart() . "'";
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res)) {
         Audit::trail('update', 'Se limpio el carrito #' . Cart::getCurrentCart(), 'fs_cart_lines');
         return true;
      } else {
         return false;
      }
   }
   public static function newCart($type)
   {
      $sql = "INSERT INTO `fs_cart`(`created_at`, `created_by`, `op_status`,`cart_type`,`exchange_rate`) VALUES (NOW(),'" . Session::get('_uid') . "' ,'A','" . $type . "','" . ExchangeRates::getCurrentRate() . "')";
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res)) {
         Audit::trail('insert', 'Carrito Creado', 'cart');
         return true;
      } else {
         return false;
      }
   }
   public static function getCurrentRate()
   {
      $sql = "SELECT exchange_rate FROM fs_cart WHERE id_cart='" . Cart::getCurrentCart() . "'";
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res)) {
         return $res['exchange_rate'];
      } else {
         return false;
      }
   }
   public static function getItems()
   {
      $sql = "SELECT * FROM fs_cart_lines as cl,fs_products as p WHERE cl.id_product=p.id_product AND cl.id_cart='" . Cart::getCurrentCart() . "' AND cl.op_status='A'";
      $res = Db::getInstance()->ExecuteS($sql);
      if (!empty($res)) {
         return $res;
      } else {
         return false;
      }
   }
   public static function updateItem()
   {
      $sql = "UPDATE `fs_cart_lines` SET `quantity`='" . Tools::getValue('quantity') . "',`total`='" . Cart::getTotalBS() . "',`total_usd`='" . Cart::getTotalUSD() . "' WHERE id_cart='" . Cart::getCurrentCart() . "' AND id_cart_line='" . Tools::getValue('cart_line') . "'";
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res)) {
         Audit::trail('update', 'Articulo actualizado del carrito #' . Cart::getCurrentCart(), 'fs_cart_lines');
         return true;
      } else {
         return false;
      }
   }
   public static function getItemTotals($id)
   {
      $sql = "SELECT SUM(total) as total,SUM(total_usd) as total_usd FROM fs_cart_lines as cl WHERE cl.id_cart_line='" . $id . "' AND cl.id_cart='" . Cart::getCurrentCart() . "' AND op_status='A'";
      $res = Db::getInstance()->ExecuteS($sql);
      if (!empty($res)) {
         return $res;
      } else {
         return false;
      }
   }
   public static function getTotals()
   {
      $sql = "SELECT SUM(total) as total, ROUND(SUM(total * (discount_percentage/100)),2) as discount,ROUND(SUM(total_usd * (discount_percentage/100)),2) as discount_usd, ROUND(SUM(total * (tax_rate/100)),2) as tax, ROUND(SUM(total_usd * (tax_rate/100)),2) as tax_usd,SUM(total_usd) as total_usd FROM `fs_cart_lines` WHERE id_cart='" . Cart::getCurrentCart() . "' AND op_status='A'";
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res)) {
         return $res;
      } else {
         return false;
      }
   }
   public static function getTotalsBS()
   {
      $sql = "SELECT SUM(ROUND(CASE WHEN discount_percentage IS NOT NULL THEN (total - (total * (discount_percentage / 100)) + (total * (tax_rate / 100)))  ELSE total END ,2)) as total FROM `fs_cart_lines` WHERE id_cart ='" . Cart::getCurrentCart() . "' AND op_status='A'";
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res)) {
         return $res['total'];
      } else {
         return false;
      }
   }
   public static function getTaxRate()
   {
      $res = Db::getInstance()->Execute("SELECT ft.rate FROM fs_taxes AS ft INNER JOIN fs_products AS fp ON ft.id_tax = fp.id_tax WHERE fp.id_product='" . Tools::getValue('product') . "'");
      if (!empty($res)) {
         return $res['rate'];
      } else {
         return false;
      }
   }
   public static function calcDiscountPerLine()
   {
      $percentage = self::getDiscountPercentage();
      $totals = self::calcAmount();

      $discount = ($totals['total'] * $percentage) + $totals['total'];
      $discount_usd = ($totals['total_usd'] * $percentage) + $totals['total_usd'];

      return [
         'amount' => $discount,
         'amount_usd' => $discount_usd
      ];
   }
   public static function getDiscountPercentage()
   {
      $product_percentage = Db::getInstance()->Execute("SELECT fs_discounts.percentage FROM fs_discounts INNER JOIN fs_products ON fs_discounts.id_discount = fs_products.id_discount WHERE id_product='" . Tools::getValue('product') . "'");
      $entity_percentage = Db::getInstance()->Execute("SELECT CASE WHEN fe.trade_discount IS NULL THEN 0 ELSE fe.trade_discount END AS percentage FROM fs_entities fe WHERE id_entity='" . Session::get('_uid') . "'");
      if ($entity_percentage['percentage'] > $product_percentage['percentage']) {
         return $entity_percentage['percentage'];
      } else {
         return $product_percentage['percentage'];
      }
   }
   public static function getTotalsUSD()
   {
      $sql = "SELECT SUM(ROUND(CASE WHEN discount_percentage IS NOT NULL THEN (total_usd - (total_usd * (discount_percentage / 100)) + (total_usd * (tax_rate / 100)))  ELSE total_usd END ,2)) as total_usd FROM `fs_cart_lines` WHERE id_cart ='" . Cart::getCurrentCart() . "' AND op_status='A'";
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res)) {
         return $res['total_usd'];
      } else {
         return false;
      }
   }
   public static function checkout()
   {
      $sql = "UPDATE `fs_cart` SET `items_total`='" . Cart::countItems() . "',`total`='" . Cart::getTotalsBS() . "',`total_usd`='" . Cart::getTotalsUSD() . "',`op_status`='C' WHERE id_cart='" . Cart::getCurrentCart() . "' AND op_status='A'";
      if (Db::getInstance()->Execute($sql)) {
         Accounting::generateCXC(Orders::getCurrentIdOrder(), Session::get('_uid'), Cart::getTotalBS(), Cart::getTotalsUSD());
         return true;
      } else {
         return false;
      }
   }
   public static function countItemsInCart()
   {
      $sql = "SELECT SUM(quantity) as count FROM `fs_cart_lines` WHERE id_cart='" . Cart::getCurrentCart() . "' AND op_status='A'";
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res)) {
         return $res['count'];
      } else {
         return false;
      }
   }
   public static function countItems()
   {
      $sql = "SELECT COUNT(id_cart_line) as COUNT FROM fs_cart_lines WHERE id_cart='" . Cart::getCurrentCart() . "' AND op_status='A'";
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res)) {
         return $res['COUNT'];
      } else {
         return false;
      }
   }
   public static function getCurrentCart()
   {
      $sql = "SELECT MAX(id_cart) AS id_cart FROM fs_cart WHERE created_by='" . Session::get('_uid') . "' AND op_status='A'";
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res)) {
         return $res['id_cart'];
      } else {
         return false;
      }
   }
}
