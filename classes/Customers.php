<?php
class Customers
{
   public static function getCustomers()
   {
      Db::getInstance()->Execute('SET @num_row=0;');
      $sql = "SELECT  (@num_row:=@num_row+1) AS num_row, e.id_entity, e.dni,	e.`code`, e.company_name,CASE WHEN e.op_status='A' THEN 'ACTIVO' ELSE 'INACTIVO' END AS status, e.op_status FROM fs_entities AS e	INNER JOIN fs_roles	ON fs_roles.id_role = e.id_role WHERE fs_roles.role_type = 'C'";
      $res = Db::getInstance()->ExecuteS($sql);
      if (!empty($res)) {
         return $res;
      } else {
         return false;
      }
   }
   public static function getCustomersInfoById()
   {
      $sql = "SELECT e.*,CASE WHEN r.role_type='A' THEN CONCAT(e.firstname,' ',e.lastname) ELSE e.company_name END AS name,CASE WHEN e.op_status='A' THEN 'ACTIVO' WHEN e.op_status='S' THEN 'SUPERUSUARIO' ELSE 'INACTIVO' END AS status FROM fs_entities AS e INNER JOIN	fs_roles AS r	ON e.id_role = r.id_role WHERE id_entity='" . Session::get('_uid') . "'";
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res)) {
         return $res;
      } else {
         return [];
      }
   }
   public static function getCustomersById()
   {
      $sql = "SELECT e.*,CASE WHEN r.role_type='A' THEN CONCAT(e.firstname,' ',e.lastname) ELSE e.company_name END AS name FROM fs_entities AS e INNER JOIN	fs_roles AS r	ON e.id_role = r.id_role WHERE id_entity='" . Tools::getValue('id') . "'";
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res)) {
         return $res;
      } else {
         return [];
      }
   }
   public static function getCustomersBySession()
   {
      $sql = "SELECT e.*,CASE WHEN r.role_type='A' THEN CONCAT(e.firstname,' ',e.lastname) ELSE e.company_name END AS name FROM fs_entities AS e INNER JOIN	fs_roles AS r	ON e.id_role = r.id_role WHERE id_entity='" . Session::get('_uid') . "'";
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res)) {
         return $res;
      } else {
         return [];
      }
   }
   public static function newCustomer()
   {
      $sql = "INSERT INTO `fs_entities`(`id_role`, `dni`, `code`, `company_name`, `username`, `email`, `password`, `address`, `trade_discount`, `credit_limit`, `credit_time`, `contact_person`, `phone`, `op_city`, `op_state`, `op_country`, `date_creation`, `op_status`) VALUES ('2','" . Tools::getValue('dni') . "','" . Tools::getValue('code') . "','" . Tools::getValue('company_name') . "','" . Tools::getValue('username') . "','" . Tools::getValue('email') . "','" . Hash::make(Tools::getValue('password')) . "','" . Tools::getValue('address') . "','" . Tools::getValue('trade_discount') . "','" . Tools::getValue('credit_limit') . "','" . Tools::getValue('credit_time') . "','" . Tools::getValue('contact_person') . "','" . Tools::getValue('phone') . "','" . Tools::getValue('op_city') . "','" . Tools::getValue('op_state') . "','" . Tools::getValue('op_country') . "',NOW(),'" . Tools::getValue('op_status') . "')";
      if (Db::getInstance()->Execute($sql)) {
         return true;
      } else {
         return false;
      }
   }
   public static function saveCustomer()
   {
      $sql = "UPDATE `fs_entities` SET `dni`='" . Tools::getValue('dni') . "',`code`='" . Tools::getValue('code') . "',`company_name`='" . Tools::getValue('company_name') . "',`username`='" . Tools::getValue('username') . "',`email`='" . Tools::getValue('email') . "',`password`='" . Hash::make(Tools::getValue('password')) . "',`address`='" . Tools::getValue('address') . "',`trade_discount`='" . Tools::getValue('trade_discount') . "',`credit_limit`='" . str_replace('$ ', '', str_replace(',', '.', Tools::getValue('credit_limit'))) . "',`credit_time`='" . Tools::getValue('credit_time') . "',`contact_person`='" . Tools::getValue('contact_person') . "',`phone`='" . Tools::getValue('phone') . "',`op_city`='" . Tools::getValue('op_city') . "',`op_state`='" . Tools::getValue('op_state') . "',`op_country`='" . Tools::getValue('op_country') . "',`op_status`='" . Tools::getValue('op_status') . "' WHERE id_entity ='" . Tools::getValue('id') . "'";
      if (Db::getInstance()->Execute($sql)) {
         return true;
      } else {
         return false;
      }
   }
   public function removeCustomer()
   {
      $sql = "UPDATE `fs_entities` SET `op_status`='E' WHERE id_entity ='" . Tools::getValue('id') . "'";
      if (Db::getInstance()->Execute($sql)) {
         return true;
      } else {
         return false;
      }
   }
   public static function getDocuments()
   {
      $sql = "SELECT id_document, CASE WHEN op_document_type =1 THEN 'CEDUDLA DE INDENTIDAD DEL REGENTE' WHEN op_document_type =2 THEN 'COPIA DEL PERMISO DE FUNCIONAMIENTO ACTUALIZADO' WHEN op_document_type =3 THEN 'COPIA DEL TITULO COMO PROFECIONAL FARMACÉUTICO'	END AS type, DATE_FORMAT(expire_date,'%d/%m/%Y') as expire_date,	CASE WHEN expire_date < NOW() THEN 'VENCIDO' ELSE 'VIGENTE' END AS status FROM `" . _DB_PREFIX_ . "documents` WHERE id_entity='" . Session::get('_uid') . "' ORDER BY op_document_type ASC";
      $res = Db::getInstance()->ExecuteS($sql);
      if (!empty($res)) {
         return $res;
      } else {
         return false;
      }
   }
   public static function getDocumentsById()
   {
      $sql = "SELECT id_document,op_document_type, expire_date, img_support FROM `" . _DB_PREFIX_ . "documents` WHERE id_document='" . Tools::getValue('id') . "'";
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res)) {
         return $res;
      } else {
         return false;
      }
   }
   public static function uploadDocuments()
   {
      if (Tools::fileUpload('img', IMG_DIR . 'd/' . Session::get('_uid') . '/')) {
         $sql = "SELECT id_document FROM `fs_documents` WHERE op_document_type='" . Tools::getValue('type') . "' AND id_entity='" . Session::get('_uid') . "'";
         $res = Db::getInstance()->Execute($sql);
         if (empty($res['id_document'])) {
            $sql = "INSERT INTO `fs_documents`(`id_entity`, `op_document_type`, `expire_date`, `img_support`) VALUES ('" . Session::get('_uid') . "','" . Tools::getValue('type') . "','" . Tools::getValue('expire_date') . "','" . Tools::getValue('img')['name'] . "')";
         } else {
            $sql = "UPDATE `fs_documents` SET `expire_date`='" . Tools::getValue('expire_date') . "',`img_support`='" . Tools::getValue('img')['name'] . "' WHERE id_document='" . Tools::getValue('id') . "'";
         }
         try {
            Db::getInstance()->Execute($sql);
            Tools::ajaxResponse([
               'response' => [
                  'type' => 'success',
                  'message' => 'Datos Guardados.',
               ],
               'reloadIMG' => IMG_URI . 'd/' . Session::get('_uid') . '/' . Tools::getValue('img')['name'],
            ]);
         } catch (\Throwable $th) {
            //throw $th;
         }
      }
   }
   public static function getDocumentStatus($document)
   {
      $sql = "SELECT expire_date FROM `" . _DB_PREFIX_ . "documents` WHERE id_entity='" . Session::get('_uid') . "' AND op_document_type='" . $document . "'";
      $res = Db::getInstance()->Execute($sql);
      if (empty($res)) {
         return ' <span class="badge badge-warning">Nulo</span>';
      } else {
         $date1 = strtotime($res['expire_date']);
         $date2 = strtotime(date('Y-m-d'));
         if ($date1 < $date2) {
            return ' <span class="badge badge-danger">Vencido</span>';
         } else {
            return ' <span class="badge badge-info">Vigente</span>';
         }
      }
   }
   public static function bloqDocuments()
   {
      $sql = "SELECT count(id_document) as res FROM `" . _DB_PREFIX_ . "documents` WHERE id_entity='" . Session::get('_uid') . "'";
      $res = Db::getInstance()->Execute($sql);
      if ($res['res'] >= 3) {
         return true;
      }
      return false;
   }
   public static function getDocumentValid($doc)
   {
      $sql = "SELECT expire_date, NOW(), CASE WHEN DATE_FORMAT(expire_date,'%d-%m-%Y') >= DATE_FORMAT(NOW(),'%d-%-%Y') THEN TRUE ELSE FALSE END AS valid  FROM `fs_documents` WHERE id_entity='" . Session::get('_uid') . "' AND op_document_type='" . $doc . "'";
      $res = Db::getInstance()->Execute($sql);
      if ($res['valid'] != 0) {
         return true;
      }
      return false;
   }
   public static function validDocuments()
   {
      if (self::getDocumentValid(1) && self::getDocumentValid(2) && self::getDocumentValid(3)) {
         return true;
      } else {
         return false;
      }
   }
}
