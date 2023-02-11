<?php
class Warehouses
{
   public static function getWarehouses()
   {
      Db::getInstance()->Execute('SET @num_row=0;');
      $sql = "SELECT  (@num_row:=@num_row+1) AS num_row, id_warehouse, c.`name` as company, w.`name` as warehouse, address_1 FROM `" . _DB_PREFIX_ . "warehouses` AS W , " . _DB_PREFIX_ . "companies AS C WHERE w.id_company=c.id_company AND w.op_status='A'";
      $res = Db::getInstance()->ExecuteS($sql);
      if ($res) {
         return $res;
      }
   }
   public static function getWarehouseById($id)
   {
      $res = Db::getInstance()->ExecuteS("SELECT id_warehouse, c.`name` as company, w.`name` as warehouse, w.address_1,w.address_2 FROM `" . _DB_PREFIX_ . "warehouses` AS W , " . _DB_PREFIX_ . "companies AS C WHERE w.id_company=c.id_company AND w.op_status='A' AND w.id_warehouse=" . $id);
      if ($res) {
         return $res[0];
      }
   }
   public static function new()
   {
      Db::getInstance()->Execute("INSERT INTO `" . _DB_PREFIX_ . "warehouses` (`id_company`, `name`, `address_1`, `address_2`, `op_status`) VALUES ('" . Tools::getValue('company') . "', '" . Tools::getValue('name') . "', '" . Tools::getValue('address') . "', '" . Tools::getValue('address2') . "', 'A')");
   }
   public static function save($id, $id_company, $address1, $address2, $name)
   {
      $res = Db::getInstance()->Execute("UPDATE `" . _DB_PREFIX_ . "warehouses` SET `id_company`='" . $id_company . "', `address_1`='" . $address1 . "', `address_2`='" . $address2 . "', `name`='" . $name . "',op_status='A' WHERE id_warehouse='" . $id . "'");
      if ($res) {
         return true;
      }
   }
   public static function getStockByProduct($id)
   {
      $sql = "SELECT w.name, s.current_stock FROM " . _DB_PREFIX_ . "stock as s, " . _DB_PREFIX_ . "warehouses w  WHERE id_product='" . $id . "' AND id_warehouse=1";
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res)) {
         return $res;
      } else {
         return false;
      }
   }
   public static function getStock()
   {
      Db::getInstance()->Execute('SET @num_row=0;');
      $sql = "SELECT  (@num_row:=@num_row+1) AS num_row, s.id_stock,	w.`name` AS warehouse, p.`name` AS product, p.short_description AS `desc`, ROUND(s.current_stock,0) AS stock FROM `fs_stock` as s,`fs_warehouses` as w, `fs_products` as p	WHERE	s.id_warehouse = w.id_warehouse AND	s.id_product = p.id_product ORDER BY product ASC";
      $res = Db::getInstance()->ExecuteS($sql);
      if (!empty($res)) {
         return $res;
      } else {
         return false;
      }
   }
   public static function getRequests()
   {
      Db::getInstance()->Execute('SET @num_row=0;');
      $sql = "SELECT  (@num_row:=@num_row+1) AS num_row,sr.id_stock_request, CONCAT(r.firstname, ' ', r.lastname) AS requestor, CONCAT(a.firstname, ' ',	a.lastname) AS approver, sr.date, sr.op_status, CASE WHEN op_status='P' THEN 'PENDIENTE' WHEN op_status='A' THEN 'APROBADO' ELSE 'RECHAZADO' END AS status FROM fs_entities as r	INNER JOIN fs_stock_requests as sr INNER JOIN fs_entities as a	ON r.id_entity = sr.id_requestor AND a.id_entity = sr.id_approver AND sr.op_status!='N' ORDER BY  sr.id_stock_request DESC";
      $res = Db::getInstance()->ExecuteS($sql);
      if (!empty($res)) {
         return $res;
      } else {
         $sql = "SELECT sr.id_stock_request, CONCAT(r.firstname, ' ', r.lastname) AS requestor, sr.date, sr.op_status, CASE WHEN op_status='P' THEN 'PENDIENTE' WHEN op_status='A' THEN 'APROBADO' ELSE 'RECHAZADO' END AS status,'' as approver FROM fs_entities as r INNER JOIN fs_stock_requests as sr	ON r.id_entity = sr.id_requestor AND sr.op_status!='N' ORDER BY sr.id_stock_request DESC";
         $res = Db::getInstance()->ExecuteS($sql);
         if (!empty($res)) {
            return $res;
         } else {
            return [];
         }
      }
   }
   public static function newRequest()
   {
      $sql = "INSERT INTO `fs_stock_requests`(`id_requestor`,`date`, `op_status`) VALUES ('" . Session::get('_uid') . "',NOW(),'N')";
      $res = Db::getInstance()->Execute($sql);
      $sql = "SELECT MAX(id_stock_request) as id FROM fs_stock_requests WHERE op_status='N'";
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res)) {
         return $res['id'];
      }
   }

   public static function getRequestById()
   {
      Db::getInstance()->Execute('SET @num_row=0;');
      $sql = "SELECT  (@num_row:=@num_row+1) AS num_row, sr.id_stock_request, CONCAT(r.firstname, ' ', r.lastname) AS requestor, sr.date, sr.op_status, CASE WHEN op_status='P' THEN 'PENDIENTE' WHEN op_status='A' THEN 'APROBADO' ELSE 'RECHAZADO' END AS status,'' as approver FROM fs_entities as r INNER JOIN fs_stock_requests as sr	ON r.id_entity = sr.id_requestor AND sr.op_status!='N' WHERE id_stock_request='" . Tools::getValue('id') . "'";
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res)) {
         return $res;
      } else {
         return false;
      }
   }
   public static function getRequestDetails()
   {
      Db::getInstance()->Execute('SET @num_row=0;');
      $sql = "SELECT  (@num_row:=@num_row+1) AS num_row, srd.id_stock_request_detail as id, w.`name` as warehouse, p.`name` as product, srd.quantity FROM fs_stock_request_details as srd INNER JOIN fs_warehouses as w ON srd.id_warehouse = w.id_warehouse INNER JOIN fs_products as p ON srd.id_product = p.id_product WHERE id_stock_request='" . Tools::getValue('id') . "' AND srd.op_status='A' ORDER BY id DESC";
      $res = Db::getInstance()->ExecuteS($sql);
      if (!empty($res)) {
         return $res;
      } else {
         return [];
      }
   }
   public static function approve_request()
   {
      $sql = "UPDATE `fs_stock_requests` SET `id_approver`='" . Session::get('_uid') . "',`op_status`='A' WHERE id_stock_request='" . Tools::getValue('id') . "'";
      $res = Db::getInstance()->Execute($sql);
      self::updateStock();
      if (!empty($res)) {
         return true;
      } else {
         return false;
      }
   }
   public static function decline_request()
   {
      $sql = "UPDATE `fs_stock_requests` SET `id_approver`='" . Session::get('_uid') . "',`op_status`='C' WHERE id_stock_request='" . Tools::getValue('id') . "'";
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res)) {
         return true;
      } else {
         return false;
      }
   }
   public static function addNewStockRequestLine()
   {
      $sql = "INSERT INTO `fs_stock_request_details`(`id_stock_request`, `id_warehouse`, `id_product`, `quantity`,`op_status`) VALUES ('" . Tools::getValue('id') . "','" . Tools::getValue('warehouse') . "','" . Tools::getValue('product') . "','" . Tools::getValue('quantity') . "','A')";
      if (Db::getInstance()->Execute($sql)) {
         return true;
      } else {
         return false;
      }
   }
   public static function removeStockRequestLine()
   {
      $sql = "UPDATE `fs_stock_request_details` SET `op_status`='E' WHERE id_stock_request_detail='" . Tools::getValue('id') . "'";
      if (Db::getInstance()->Execute($sql)) {
         return true;
      } else {
         return false;
      }
   }
   public static function updateStock()
   {
      $sql = "SELECT * FROM fs_stock_request_details WHERE id_stock_request='" . Tools::getValue('id') . "' AND op_status ='A'";
      $res = Db::getInstance()->ExecuteS($sql);
      if (!empty($res)) {
         foreach ($res as $r) {
            $sql = "UPDATE `fs_stock` SET `id_warehouse`='" . $r['id_warehouse'] . "',`current_stock`=(SELECT (current_stock + '" . $r['quantity'] . "') AS SUM FROM fs_stock WHERE id_product='" . $r['id_product'] . "'  AND id_warehouse='" . $r['id_warehouse'] . "') WHERE id_product='" . $r['id_product'] . "' AND id_warehouse='" . $r['id_warehouse'] . "'";
            $res = Db::getInstance()->Execute($sql);
            if (!empty($res)) {
               return true;
            } else {
               return false;
            }
         }
      }
   }
   public static function sendStockRequest()
   {
      $sql = "UPDATE `fs_stock_requests` SET `op_status`='P' WHERE id_stock_request='" . Tools::getValue('id') . "'";
      if (Db::getInstance()->Execute($sql)) {
         return true;
      } else {
         return false;
      }
   }
}
