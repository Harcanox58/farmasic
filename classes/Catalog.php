<?php
class Catalog
{
   public static function getCategories()
   {
      $sql = "SELECT * FROM " . _DB_PREFIX_ . "categories";
      $res = Db::getInstance()->ExecuteS($sql);
      if (!empty($res)) {
         return $res;
      } else {
         return false;
      }
   }
   public static function getCategoryById($id)
   {
      $sql = "SELECT * FROM " . _DB_PREFIX_ . "categories WHERE id_category=" . Tools::getValue('id');
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res)) {
         return $res;
      } else {
         return false;
      }
   }
   public static function newCategory()
   {
      if (Tools::fileUpload('img', IMG_DIR . 'c/')) {
         $sql = "INSERT INTO " . _DB_PREFIX_ . "categories (name, img, op_status) VALUES ('" . Tools::getValue('name') . "', '" . Tools::getValue('img')['name'] . "', 'A')";
         if (Db::getInstance()->Execute($sql)) {
            Audit::trail('insert', 'Categoria creada', 'categories');
            return true;
         } else {
            return false;
         }
      } else {
         return false;
      }
   }
   public static function saveCategory()
   {
      if (Tools::fileUpload('img', IMG_DIR . 'c/')) {
         $sql = "UPDATE " . _DB_PREFIX_ . "categories SET name='" . Tools::getValue('name') . "', img='" . Tools::getValue('img')['name'] . "' WHERE id_category=" . Tools::getValue('id');
         if (Db::getInstance()->Execute($sql)) {
            Audit::trail('update', 'Categoria actualizada', 'categories', Tools::getValue('id'));
            return true;
         } else {
            return false;
         }
      } else {
         return false;
      }
   }
   public static function removeCategory($id)
   {
      $sql = "UPDATE " . _DB_PREFIX_ . "categories SET op_status='E' WHERE id_categories=" . $id;
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res)) {
         Audit::trail('remove', 'Categoria eliminada', 'categories');
         return true;
      } else {
         return false;
      }
   }
   // public static function getProducts()
   // {
   //    $sql = "SELECT p.id_product, p.`name`, p.`code`,p.`img_name`, c.`name` as category, p.price,p.price_usd, p.stock,p.is_active, p.bar_code FROM fs_products as p ,fs_categories as c 
   //    WHERE p.id_category=c.id_category";
   //    $res = Db::getInstance()->ExecuteS($sql);
   //    if (!empty($res)) {
   //       return $res;
   //    } else {
   //       return false;
   //    }
   // }
   public static function getProductById()
   {
      $sql = "SELECT * FROM " . _DB_PREFIX_ . "products WHERE id_product=" . Tools::getValue('id');
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res)) {
         return $res;
      } else {
         return false;
      }
   }
   public static function prepareProduct()
   {
      $sql = "INSERT INTO " . _DB_PREFIX_ . "products (created_at,op_status,is_active) VALUES (NOW(),'N',0)";
      $res = Db::getInstance()->Execute($sql);
      $sql = "SELECT MAX(id_product) as id FROM fs_products WHERE op_status='N'";
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res)) {
         Audit::trail('insert', 'Producto Creado', 'products');
         return $res['id'];
      }
   }

   public static function newProduct()
   {
      $sql = "SELECT op_status FROM fs_products WHERE id_product='" . Tools::getValue('id') . "'";
      $res = Db::getInstance()->Execute($sql);
      if ($res['op_status'] == 'N') {
         $sql = "UPDATE fs_products SET `name`='" . Tools::getValue('name') . "',op_status='A' WHERE id_product='" . Tools::getValue('id') . "'";
         if (Db::getInstance()->Execute($sql)) {
            return true;
         } else {
            return false;
         }
      }
      return null;
   }
   public static function getNewProductDate()
   {
      $sql = "SELECT created_at as created_at FROM fs_products WHERE id_product=(SELECT MAX(id_product) FROM fs_products WHERE op_status='N')";
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res)) {
         return $res['created_at'];
      }
   }
   public static function changeProductStatus()
   {
      $sql = "UPDATE `fs_products` SET `is_active`='" . Tools::getValue('checked') . "' WHERE id_product='" . Tools::getValue('id') . "'";
      try {
         Db::getInstance()->Execute($sql);
         Tools::ajaxResponse(['response' => ['type' => 'success', 'message' => 'Estado Actualizado.']]);
      } catch (Exception $e) {

         Tools::ajaxResponse(['response' => ['type' => 'error', 'message' => 'Error al procesar la solicitud.']]);
      }
   }
   public static function getProductStock()
   {
      Db::getInstance()->Execute('SET @num_row=0;');
      $sql = "SELECT  (@num_row:=@num_row+1) AS num_row, external.* FROM ( SELECT id_stock,s.id_warehouse,s.id_product, ROUND(s.current_stock,0) as current_stock , w.`name` AS warehouse FROM fs_stock AS s INNER JOIN	fs_warehouses AS w ON s.id_warehouse = w.id_warehouse WHERE s.id_product='" . Tools::getValue('id') . "'  ORDER BY warehouse ASC) external";
      $res = Db::getInstance()->ExecuteS($sql);
      if (!empty($res)) {
         return $res;
      } else {
         return [];
      }
   }
   public static function updateProductStock()
   {
      $sql = "SELECT id_stock FROM fs_stock WHERE id_product='" . Tools::getValue('id_product') . "' AND id_warehouse='" . Tools::getValue('id_warehouse') . "'";
      $id = Db::getInstance()->Execute($sql);
      if (empty($id['id_stock'])) {
         $sql = "INSERT INTO `fs_stock`(`id_warehouse`, `id_product`, `current_stock`) VALUES ('" . Tools::getValue('id_warehouse') . "','" . Tools::getValue('id_product') . "','" . Tools::getValue('quantity') . "')";
         if (Db::getInstance()->Execute($sql)) {
            return true;
         } else {
            return false;
         }
      } else {
         $sql = "UPDATE `fs_stock` SET `current_stock`='" . Tools::getValue('quantity') . "' WHERE id_stock='" . $id['id_stock'] . "'";
         if (Db::getInstance()->Execute($sql)) {
            return true;
         } else {
            return false;
         }
      }
   }
   public static function saveProduct()
   {
      $prices = self::calculePrices();
      $sql = "UPDATE `fs_products` SET `id_brand`='" . Tools::getValue('brand') . "',`id_category`='" . Tools::getValue('category') . "',`id_tax`='" . Tools::getValue('tax') . "',`id_active_compound`='" . Tools::getValue('active') . "',`id_discount`='" . Tools::getValue('discount') . "',`id_supplier`='" . Tools::getValue('supplier') . "',`ref`='" . Tools::getValue('reference') . "',`name`='" . Tools::getValue('name') . "',`short_description`='" . Tools::getValue('short_desc') . "',`description`='" . Tools::getValue('description') . "',`code`='" . Tools::getValue('code') . "',`bar_code`='" . Tools::getValue('barcode') . "',`price_cost`='" . $prices['price_cost'] . "',`price`='" . $prices['price'] . "',`price_unit`='" . $prices['price_unit'] . "',`price_unit_usd`='" . $prices['price_unit_usd'] . "',`price_usd`='" . $prices['price_usd'] . "',`price_suggested`='" . $prices['price_suggested'] . "',`price_suggested_usd`='" . $prices['price_suggested_usd'] . "',`net_price`='" . $prices['net_price'] . "',`net_price_usd`='" . $prices['net_price_usd'] . "',`min_sell`='" . Tools::getValue('min_sell') . "',`max_sell`='" . Tools::getValue('max_sell') . "',`multiple_sell`='" . Tools::getValue('multiple_sell') . "',`units_per_pack`='" . Tools::getValue('per_pack') . "',`codisb`='" . Tools::getValue('codisb') . "',`expire_at`='" . Tools::getValue('expire') . "',`profit_margin`='" . $prices['profit_margin'] . "',`is_regulated`='" . Tools::getValue('is_regulated') . "',`is_featured`='" . Tools::getValue('is_featured') . "' WHERE id_product=" . Tools::getValue('id');
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res)) {
         Audit::trail('update', 'Producto actualizado', 'products', Tools::getValue('id'));
         return true;
      } else {
         return false;
      }
   }
   public static function calculePricesExternal($id_product, $rate, $profit)
   {
      $sql = "SELECT price_usd, price_cost, units_per_pack FROM fs_products WHERE id_product ='" . $id_product . "'";
      $data = Db::getInstance()->Execute($sql);
      $sale_price = $data['price_usd'];
      $price_cost = $data['price_cost'];
      $profit_margin = $profit;
      $per_pack = $data['units_per_pack'];
      $newPriceProfit = 0;
      $price_suggested = 0;
      $price_suggested_usd = 0;
      $price = 0;
      if (empty($sale_price)) {
         $newProfit = ($price_cost * $profit_margin / 100);
         $newPriceProfit = $price_cost + $newProfit;
         $price = $newPriceProfit;
         $price_suggested_usd = $price;
      } else {
         if ($sale_price != $newPriceProfit) {
            $price = $sale_price;
            $newProfit = ($price_cost * $profit_margin / 100);
            $price_suggested_usd = $price_cost + $newProfit;
         } else {
            $price = $newPriceProfit;
         }
      }
      $newPrice = $rate * $price;
      $discount = Db::getInstance()->Execute("SELECT percentage FROM fs_discounts WHERE id_discount='" . Tools::getValue('id_discount') . "'");
      if (!empty($discount['percentage']) && $discount != 0) {
         $discount = $discount['percentage'];
         $percentage = ($newPrice * $discount / 100);
         $percentage_usd = ($price * $discount / 100);
      } else {
         $percentage = 0;
         $percentage_usd = 0;
         $discount = 0;
      }
      $profitSuggested = ($newPrice * $profit_margin / 100);
      $price_suggested = $newPrice + $profitSuggested;
      $netPrice = $newPrice - $percentage;
      $netPrice_usd = $price - $percentage_usd;
      $price_unit = $newPrice / $per_pack;
      $price_unit_usd = $price / $per_pack;
      return [
         'price_cost' => $price_cost,
         'profit_margin' => $profit_margin,
         'price' => $newPrice,
         'price_usd' => $price,
         'price_suggested' => $price_suggested,
         'price_suggested_usd' => $price_suggested_usd,
         'net_price' => $netPrice,
         'net_price_usd' => $netPrice_usd,
         'price_unit' => $price_unit,
         'price_unit_usd' => $price_unit_usd,
      ];
   }
   public static function calculePrices()
   {
      $sale_price = str_replace('$ ', '', str_replace(',', '.', Tools::getValue('price_usd')));
      $price_cost = str_replace('$ ', '', str_replace(',', '.', Tools::getValue('price_cost')));
      $profit_margin = str_replace('%', '', Tools::getValue('profit_margin'));
      $per_pack = Tools::getValue('per_pack');
      $newPriceProfit = 0;
      $price_suggested = 0;
      $price_suggested_usd = 0;
      $price = 0;
      if (empty($sale_price)) {
         $newProfit = ($price_cost * $profit_margin / 100);
         $newPriceProfit = $price_cost + $newProfit;
         $price = $newPriceProfit;
         $price_suggested_usd = $price;
      } else {
         if ($sale_price != $newPriceProfit) {
            $price = $sale_price;
            $newProfit = ($price_cost * $profit_margin / 100);
            $price_suggested_usd = $price_cost + $newProfit;
         } else {
            $price = $newPriceProfit;
         }
      }
      $newPrice = ExchangeRates::getCurrentRate() * $price;
      $discount = Db::getInstance()->Execute("SELECT percentage FROM fs_discounts WHERE id_discount='" . Tools::getValue('id_discount') . "'");
      if (!empty($discount['percentage']) && $discount != 0) {
         $discount = $discount['percentage'];
         $percentage = ($newPrice * $discount / 100);
         $percentage_usd = ($price * $discount / 100);
      } else {
         $percentage = 0;
         $percentage_usd = 0;
         $discount = 0;
      }
      $profitSuggested = ($newPrice * $profit_margin / 100);
      $price_suggested = $newPrice + $profitSuggested;
      $netPrice = $newPrice - $percentage;
      $netPrice_usd = $price - $percentage_usd;
      $price_unit = $newPrice / $per_pack;
      $price_unit_usd = $price / $per_pack;
      return [
         'price_cost' => $price_cost,
         'profit_margin' => $profit_margin,
         'price' => $newPrice,
         'price_usd' => $price,
         'price_suggested' => $price_suggested,
         'price_suggested_usd' => $price_suggested_usd,
         'net_price' => $netPrice,
         'net_price_usd' => $netPrice_usd,
         'price_unit' => $price_unit,
         'price_unit_usd' => $price_unit_usd,
      ];
   }
   public static function removeProduct()
   {
      $sql = "UPDATE " . _DB_PREFIX_ . "products SET op_status='E' WHERE id_product='" . Tools::getValue('id') . "'";
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res)) {
         Audit::trail('remove', 'Producto eliminado', 'products', Tools::getValue('id'));
         return true;
      } else {
         return false;
      }
   }
   public static function getDiscounts()
   {
      $sql = "SELECT id_discount, name, CONCAT(ROUND(percentage,0),'%') as percentage FROM " . _DB_PREFIX_ . "discounts";
      $res = Db::getInstance()->ExecuteS($sql);
      if ($res != '') {
         return $res;
      } else {
         return false;
      }
   }
   public static function getDiscountById()
   {
      $sql = "SELECT * FROM " . _DB_PREFIX_ . "discounts WHERE id_discount=" . Tools::getValue('id');
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res)) {
         return $res;
      } else {
         return false;
      }
   }
   public static function newDiscount()
   {
      $sql = "INSERT INTO " . _DB_PREFIX_ . "discounts (`id_discount`, `name`, `coupon_code`, `amount`, `amount_usd`, `percentage`, `quantity`, `start_date`, `end_date`, `min_order_value`, `max_order_value`, `op_status`) VALUES (NULL, '" . Tools::getValue('name') . "', '" . Tools::getValue('coupon_code') . "', '" . Tools::getValue('amount') . "', '" . Tools::getValue('amount_usd') . "', '" . Tools::getValue('percentage') . "', '" . Tools::getValue('quantity') . "', '" . Tools::getValue('start_date') . "', '" . Tools::getValue('end_date') . "', '" . Tools::getValue('min_order_value') . "', '" . Tools::getValue('max_order_value') . "', 'A')";
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res)) {
         Audit::trail('insert', 'Descuento Creado', 'discounts');
         return true;
      } else {
         return false;
      }
   }
   public static function getProducts($psico = false, $featured = false, $positive = false)
   {
      $append = "";
      if ($psico == true) {
         $append = "AND a.is_psychotropic='1'";
      } else {
         $append = "AND a.is_psychotropic!='1'";
      }
      $star = "";
      if ($featured == true) {
         $star = "AND p.is_featured='1'";
      }
      $pos = "";
      if ($positive == true) {
         $pos = "AND(SELECT SUM(current_stock)>0 FROM fs_stock as st WHERE id_product=p.id_product)";
      }
      Db::getInstance()->Execute('SET @num_row=0;');
      $sql = "SELECT  (@num_row:=@num_row+1) AS num_row, p.id_product,	p.`name`,	p.description,	p.`code`,	p.bar_code,	b.`name` AS brand,	p.price_suggested as price,	p.price_suggested_usd as price_usd,	p.img_name,(SELECT SUM(current_stock) FROM fs_stock WHERE id_product=p.id_product)	AS current_stock,	t.rate,	c.`name` AS category,	a.`name` AS active, d.percentage, d.amount, d.amount_usd,p.is_active,p.is_featured,p.net_price,p.net_price_usd  FROM	fs_products AS p,	fs_brands AS b,	fs_categories AS c,	fs_taxes AS t,	fs_active_compounds AS a,fs_discounts AS d WHERE	b.id_brand = p.id_brand AND p.id_tax = t.id_tax 	AND p.id_active_compound = a.id_active_compound AND p.id_category = c.id_category AND p.id_discount=d.id_discount " . $append . $star . $pos . " AND p.is_active='1'";
      $res = Db::getInstance()->ExecuteS($sql);
      if (!empty($res)) {
         return $res;
      } else {
         return false;
      }
   }
   public static function uploadProductIMG()
   {
      if (Tools::fileUpload('img', IMG_DIR . 'p/')) {
         $sql = "UPDATE `fs_products` SET `img_name`='" . Tools::getValue('img')['name'] . "' WHERE id_product='" . Tools::getValue('id') . "'";
         $res = Db::getInstance()->Execute($sql);
         if (!empty($res)) {
            // Audit::trail('update', 'Producto actualizado', 'products', Tools::getValue('id'));
            return true;
         } else {
            return false;
         }
      }
      return false;
   }
   public static function removeProductIMG()
   {
      $sql = "UPDATE `fs_products` SET `img_name`=null WHERE id_product='" . Tools::getValue('id') . "'";
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res)) {
         // Audit::trail('update', 'Producto actualizado', 'products', Tools::getValue('id'));
         return true;
      } else {
         return false;
      }
   }
   public static function getProductsMain()
   {
      Db::getInstance()->Execute('SET @num_row=0;');
      $sql = "SELECT  (@num_row:=@num_row+1) AS num_row,	p.id_product,	p.`name`,	p.description,	p.`code`,	p.bar_code,	b.`name` AS brand,	p.price,	p.price_usd,	p.img_name,	(SELECT ROUND(SUM(current_stock),0) FROM fs_stock WHERE id_product=p.id_product) AS current_stock, t.rate, c.`name` AS category, a.`name` AS active, d.percentage,	d.amount,	d.amount_usd,	p.is_active,	p.is_featured,	p.net_price, p.net_price_usd FROM	fs_products AS p	LEFT JOIN fs_taxes AS t	ON p.id_tax = t.id_tax LEFT JOIN	fs_brands AS b ON p.id_brand = b.id_brand	LEFT JOIN fs_categories AS c	ON p.id_category = c.id_category LEFT JOIN fs_discounts AS d	ON p.id_discount = d.id_discount LEFT JOIN	fs_active_compounds AS a ON p.id_active_compound = a.id_active_compound WHERE p.op_status!='E' AND p.op_status!='N' ORDER BY p.id_product DESC";
      $res = Db::getInstance()->ExecuteS($sql);
      if (!empty($res)) {
         return $res;
      } else {
         return false;
      }
   }
   public static function saveDiscount()
   {
      $sql = "UPDATE " . _DB_PREFIX_ . "discounts SET name='" . Tools::getValue('name') . "', coupon_code='" . Tools::getValue('coupon_code') . "', amount='" . Tools::getValue('amount') . "', amount_usd='" . Tools::getValue('amount_usd') . "', percentage='" . Tools::getValue('percentage') . "', quantity='" . Tools::getValue('quantity') . "', start_date='" . Tools::getValue('start_date') . "', end_date='" . Tools::getValue('end_date') . "', min_order_value='" . Tools::getValue('min_order_value') . "', max_order_value='" . Tools::getValue('max_order_value') . "' WHERE id_discount=" . Tools::getValue('id');
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res)) {
         Audit::trail('update', 'Descuento actualizado', 'discounts', Tools::getValue('id'));
         return true;
      } else {
         return false;
      }
   }
   public static function removeDiscount()
   {
      $sql = "UPDATE " . _DB_PREFIX_ . "discounts SET op_status='E' WHERE id_discount=" . Tools::getValue('id');
      $res = Db::getInstance()->Execute($sql);
      Audit::trail(Tools::getValue('id'), 'Discount', 'Remove');
      if (!empty($res)) {
         Audit::trail('remove', 'Descuento eliminado', 'discounts', Tools::getValue('id'));
         return true;
      } else {
         return false;
      }
   }
   public static function getBrands()
   {
      $sql = "SELECT * FROM " . _DB_PREFIX_ . "brands";
      $res = Db::getInstance()->ExecuteS($sql);
      if (!empty($res)) {
         return $res;
      } else {
         return false;
      }
   }
   public static function newBrand()
   {
      if (Tools::fileUpload('img', IMG_DIR . 'b/')) {
         $sql = "INSERT INTO " . _DB_PREFIX_ . "brands (`id_brand`, `name`, `img`, `op_status`) VALUES (null,'" . Tools::getValue('name') . "', '" . Tools::getValue('img')['name'] . "', 'A')";
         $res = Db::getInstance()->Execute($sql);
         if (!empty($res)) {
            return true;
         } else {
            return false;
         }
      }
   }
   public static function getBrandById()
   {
      $sql = "SELECT * FROM " . _DB_PREFIX_ . "brands WHERE id_brand=" . Tools::getValue('id');
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res)) {
         return $res;
      } else {
         return false;
      }
   }
   public static function saveBrand()
   {
      if (Tools::fileUpload('img', IMG_DIR . 'b/')) {
         $sql = "UPDATE " . _DB_PREFIX_ . "brands SET name='" . Tools::getValue('name') . "', img='" . Tools::getValue('img')['name'] . "' WHERE id_brand=" . Tools::getValue('id');
         $res = Db::getInstance()->Execute($sql);
         if (!empty($res)) {
            return true;
         } else {
            return false;
         }
      }
   }
   public static function removeBrand()
   {
      $sql = "UPDATE " . _DB_PREFIX_ . "brands SET op_status='E' WHERE id_brand=" . Tools::getValue('id');
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res)) {
         return true;
      } else {
         return false;
      }
   }
   public static function getTaxes()
   {
      $sql = "SELECT * FROM " . _DB_PREFIX_ . "taxes";
      $res = Db::getInstance()->ExecuteS($sql);
      if (!empty($res)) {
         return $res;
      } else {
         return false;
      }
   }
   public static function getTaxById()
   {
      $sql = "SELECT * FROM " . _DB_PREFIX_ . "taxes WHERE id_tax=" . Tools::getValue('id');
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res)) {
         return $res;
      } else {
         return false;
      }
   }
   public static function newTax()
   {
      $sql = "INSERT INTO " . _DB_PREFIX_ . "taxes (name, rate, op_status) VALUES ('" . Tools::getValue('name') . "', '" . Tools::getValue('rate') . "', 'A')";
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res)) {
         return true;
      } else {
         return false;
      }
   }
   public static function saveTax()
   {
      $sql = "UPDATE " . _DB_PREFIX_ . "taxes SET name='" . Tools::getValue('name') . "', rate='" . Tools::getValue('rate') . "' WHERE id_tax=" . Tools::getValue('id');
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res)) {
         return true;
      } else {
         return false;
      }
   }
   public static function removeTax()
   {
      $sql = "UPDATE " . _DB_PREFIX_ . "taxes SET op_status='E' WHERE id_taxes=" . Tools::getValue('id');
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res)) {
         return true;
      } else {
         return false;
      }
   }
   public static function getActiveCompound()
   {
      $sql = "SELECT * FROM " . _DB_PREFIX_ . "active_compounds WHERE op_status='A'";
      $res = Db::getInstance()->ExecuteS($sql);
      if (!empty($res)) {
         return $res;
      } else {
         return false;
      }
   }
   public static function getActiveCompoundById()
   {
      $sql = "SELECT * FROM " . _DB_PREFIX_ . "active_compounds WHERE id_active_compound=" . Tools::getValue('id');
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res)) {
         return $res;
      } else {
         return false;
      }
   }
   public static function newActiveCompound()
   {
      $sql = "INSERT INTO " . _DB_PREFIX_ . "active_compounds (name, description, op_status) VALUES ('" . Tools::getValue('name') . "', '" . Tools::getValue('description') . "', 'A')";
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res)) {
         return true;
      } else {
         return false;
      }
   }
   public static function saveActiveCompound()
   {
      $sql = "UPDATE " . _DB_PREFIX_ . "active_compounds SET name='" . Tools::getValue('name') . "', description='" . Tools::getValue('description') . "' WHERE id_active_compound=" . Tools::getValue('id');
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res)) {
         return true;
      } else {
         return false;
      }
   }
   public static function removeActiveCompound()
   {
      $sql = "UPDATE " . _DB_PREFIX_ . "compound SET op_status='E' WHERE id_compound=" . Tools::getValue('id');
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res)) {
         return true;
      } else {
         return false;
      }
   }
   public static function countProductsInCatalog()
   {
      $sql = "SELECT count(fs_products.id_product) as res FROM fs_products WHERE op_status='A' AND is_active='1'";
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res)) {
         return $res['res'];
      } else {
         return false;
      }
   }
}
