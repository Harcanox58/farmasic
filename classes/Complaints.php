<?php
class Complaints
{
   public static function report()
   {
      $sql = "INSERT INTO `fs_complaints`( `id_customer`, `op_priority`, `op_department`, `subject`, `contact_number`, `created_at`,`op_status`) VALUES ('" . Session::get('_uid') . "','" . Tools::getValue('priority') . "','" . Tools::getValue('departament') . "','" . Tools::getValue('subject') . "','" . Tools::getValue('contact') . "',NOW(),NOW(),'A')";
      if (Db::getInstance()->Execute($sql)) {
         if (Tools::fileUpload('img', IMG_DIR . 'm/')) {
            $sql = "SELECT MAX(id_complaint) as id FROM fs_complaints WHERE id_customer='" . Session::get('_uid') . "'";
            $res = Db::getInstance()->ExecuteS($sql);
            $sql = "INSERT INTO `fs_complaint_messages`(`id_complaint`, `id_entity`, `message`, `send_at`, `is_operator`,`img`) VALUES ('" . $res['id'] . "','" . Session::get('_uid') . "','" . Tools::getValue('msg') . "',NOW(),'0','" . Tools::getValue('img')['name'] . "')";
            self::setLastUpdate();
            if (Db::getInstance()->Execute($sql)) {
               return true;
            } else {
               return false;
            }
         }
      } else {
         return false;
      }
   }
   public static function response($operator = false)
   {
      if ($operator == false) {
         $operator = 0;
      } else {
         $operator = 1;
      }
      $sql = '';
      if (Tools::fileUpload('img', IMG_DIR . 'm/')) {
         $sql = "INSERT INTO `fs_complaint_messages`(`id_complaint`, `id_entity`, `message`, `send_at`, `is_operator`,`img`) VALUES ('" . Tools::getValue('id') . "','" . Session::get('_uid') . "','" . Tools::getValue('msg') . "',NOW(),'" . $operator . "','" . Tools::getValue('img')['name'] . "')";
      } else {
         $sql = "INSERT INTO `fs_complaint_messages`(`id_complaint`, `id_entity`, `message`, `send_at`, `is_operator`) VALUES ('" . Tools::getValue('id') . "','" . Session::get('_uid') . "','" . Tools::getValue('msg') . "',NOW(),'" . $operator . "')";
         self::setLastUpdate($operator);
      }
      self::setLastUpdate($operator);
      if (Db::getInstance()->Execute($sql)) {
         return true;
      } else {
         return false;
      }
   }
   public static function close()
   {
      $sql = "UPDATE `fs_complaints` SET `op_status`='C' WHERE id_complaint= '" . Tools::getValue('id') . "'";
      if (Db::getInstance()->Execute($sql)) {
         return true;
      } else {
         return false;
      }
   }
   public static function setLastUpdate($responseType = 0)
   {
      if ($responseType == 0) {
         $responseType = "op_status='RC'";
      } else {
         $responseType = "op_status='R'";
      }
      $sql = "UPDATE `fs_complaints` SET `last_update`= NOW()," . $responseType . " WHERE id_complaint= '" . Tools::getValue('id') . "'";
      if (Db::getInstance()->Execute($sql)) {
         return true;
      } else {
         return false;
      }
   }
   public static function getComplaints()
   {
      Db::getInstance()->Execute('SET @num_row=0;');
      $sql = "SELECT  (@num_row:=@num_row+1) AS num_row, c.id_complaint, CASE WHEN r.role_type='A' THEN CONCAT(CASE WHEN e.dni<>'' THEN CONCAT(e.dni,' - ') ELSE '' END, e.firstname,' ',e.lastname) ELSE CONCAT(e.dni,'-',e.company_name) END AS name, c.op_department, c.`subject`, CASE WHEN c.op_status = 'A' THEN 'ABIERTO' WHEN c.op_status = 'R' THEN 'RESPUESTA' WHEN c.op_status = 'RC' THEN 'RESPUESTA CLIENTE' WHEN c.op_status = 'C' THEN 'CERRADO' END AS op_status ,CASE	WHEN c.op_status = 'A' THEN	'info' WHEN c.op_status = 'R' THEN 'indigo' WHEN c.op_status = 'RC' THEN 'maroon' WHEN c.op_status = 'C' THEN 'danger' END AS op_status_color,CASE	WHEN c.op_priority = 'A' THEN 'danger' WHEN c.op_priority = 'B' THEN '' ELSE 'warning' END AS op_priority_color, CASE	WHEN c.op_priority = 'A' THEN 'ALTA' WHEN c.op_priority = 'B' THEN 'BAJA' ELSE 'MEDIA' END AS op_priority, c.last_update FROM fs_complaints AS c INNER JOIN fs_entities AS e ON c.id_customer=e.id_entity INNER JOIN fs_roles AS r ON r.id_role=e.id_role";
      $res = Db::getInstance()->ExecuteS($sql);
      if (!empty($res)) {
         return $res;
      } else {
         return false;
      }
   }
   public static function countComplaintsByCustomer()
   {
      $sql = "SELECT COUNT(id_complaint) AS count FROM fs_complaints WHERE op_status <> 'C' AND id_customer='" . Session::get('_uid') . "'";
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res)) {
         return $res['count'];
      } else {
         return false;
      }
   }
   public static function countComplaints()
   {
      $sql = "SELECT COUNT(id_complaint) AS count FROM fs_complaints WHERE op_status <> 'C'";
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res)) {
         return $res['count'];
      } else {
         return false;
      }
   }
   public static function getComplaintsByCustomer()
   {
      Db::getInstance()->Execute('SET @num_row=0;');
      $sql = "SELECT  (@num_row:=@num_row+1) AS num_row, id_complaint, op_department, CONCAT('#',id_complaint,' ',`subject`) as `subject`, CASE WHEN op_status = 'A' THEN 'ABIERTO' WHEN op_status = 'R' THEN 'RESPUESTA' WHEN op_status = 'RC' THEN 'RESPUESTA CLIENTE' WHEN op_status = 'C' THEN 'CERRADO' END AS op_status , last_update FROM fs_complaints WHERE id_customer='" . Session::get('_uid') . "'";
      $res = Db::getInstance()->ExecuteS($sql);
      if (!empty($res)) {
         return $res;
      } else {
         return false;
      }
   }
   public static function getComplaintInfo()
   {
      $sql = "SELECT c.id_complaint, c.op_department, c.`subject`,	c.op_status AS status, CASE WHEN r.role_type='A' THEN CONCAT(e.firstname,' ',e.lastname) ELSE e.company_name END AS name,CASE WHEN c.op_status = 'A' THEN	'ABIERTO' WHEN c.op_status = 'R' THEN	'RESPUESTA' WHEN c.op_status = 'RC' THEN 'RESPUESTA CLIENTE' WHEN c.op_status = 'C' THEN 'CERRADO' END AS op_status, CASE	WHEN c.op_status = 'A' THEN	'info' WHEN c.op_status = 'R' THEN 'indigo' WHEN c.op_status = 'RC' THEN 'maroon' WHEN c.op_status = 'C' THEN 'danger' END AS op_status_color,	last_update, CASE	WHEN c.op_priority = 'A' THEN 'ALTA' WHEN c.op_priority = 'B' THEN 'BAJA' ELSE 'MEDIA' END AS op_priority, c.created_at, e.firstname,	e.lastname FROM	fs_complaints AS c INNER JOIN fs_entities AS e ON c.id_customer = e.id_entity INNER JOIN fs_roles AS r ON r.id_role=e.id_role WHERE	id_complaint ='" . Tools::getValue('id') . "'";
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res)) {
         return $res;
      } else {
         return false;
      }
   }
   public function getColors()
   {
   }
   public static function getMessages()
   {
      $sql = "SELECT cm.id_complaint_message, CASE WHEN r.role_type='A' THEN CONCAT(e.firstname,' ',e.lastname) ELSE e.company_name END AS name, cm.img , cm.message, cm.send_at,cm.img, cm.is_operator FROM	fs_complaint_messages as cm INNER JOIN fs_entities as e ON cm.id_entity = e.id_entity INNER JOIN fs_roles AS r ON r.id_role=e.id_role WHERE cm.id_complaint = '" . Tools::getValue('id') . "' ORDER BY cm.id_complaint_message DESC";
      $res = Db::getInstance()->ExecuteS($sql);
      if (!empty($res)) {
         return $res;
      } else {
         return [];
      }
   }
}
