<?php
class Users
{
   public static function getUsers()
   {
      Db::getInstance()->Execute('SET @num_row=0;');
      $sql = "SELECT (@num_row:=@num_row+1) AS num_row, e.id_entity ,CONCAT(e.firstname,' ',e.lastname) as name, r.name as role,e.date_creation,CASE WHEN e.op_status = 'A' THEN 'ACTIVO' ELSE 'INACTIVO' END AS op_status FROM fs_entities AS e INNER JOIN fs_roles AS r ON r.id_role=e.id_role WHERE r.role_type = 'A' AND e.op_status<>'E'";
      $res = Db::getInstance()->ExecuteS($sql);
      if (!empty($res)) {
         return $res;
      }
      return false;
   }
   public static function getUserById()
   {
      $sql = "SELECT * FROM fs_entities  WHERE id_entity='" . Tools::getValue('id') . "'";
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res)) {
         return $res;
      }
      return [];
   }
   public static function setUser()
   {
      $res = Db::getInstance()->Execute("SELECT * FROM fs_entities WHERE id_entity='" . Tools::getValue('id') . "'");
      if (empty($res)) {
         $hash = !empty(Tools::getValue('password')) ? Hash::make(Tools::getValue('password')) : 'NULL';
         $sql = "INSERT INTO `fs_entities`(`id_role`,`firstname`, `lastname`, `username`, `email`, `password`, `address`,`phone`, `op_city`, `op_state`, `op_country`,`is_deleted`, `op_status`) VALUES ('" . Tools::getValue('role') . "','[" . Tools::getValue('firstname') . "','" . Tools::getValue('lastname') . "','" . Tools::getValue('username') . "','" . Tools::getValue('email') . "','" . $hash . "','" . Tools::getValue('address') . "','" . Tools::getValue('phone') . "','" . Tools::getValue('op_city') . "','" . Tools::getValue('op_state') . "','" . Tools::getValue('op_country') . "','0','A')";
      } else {
         $hash = !empty(Tools::getValue('password')) ? "`password`='" . Hash::make(Tools::getValue('password')) . "'," : '';
         $sql = "UPDATE `fs_entities` SET `id_role`='" . Tools::getValue('role') . "',`firstname`='" . Tools::getValue('firstname') . "',`lastname`='" . Tools::getValue('lastname') . "',`username`='" . Tools::getValue('username') . "',`email`='" . Tools::getValue('email') . "'," . $hash . "`address`='" . Tools::getValue('address') . "',`phone`='" . Tools::getValue('phone') . "',`op_city`='" . Tools::getValue('op_city') . "',`op_state`='" . Tools::getValue('op_state') . "',`op_country`='" . Tools::getValue('op_country') . "' WHERE id_entity='" . Tools::getValue('id') . "'";
      }
      try {
         Db::getInstance()->Execute($sql);
         Tools::response('success', 'Datos Guardados.');
      } catch (PDOException $e) {
      }
   }
   public static function removeUser()
   {
      $sql = "UPDATE `fs_entities` SET `is_active`='0',`is_deleted`='1',`op_status`='E' WHERE id_entity='" . Tools::getValue('id') . "'";
      try {
         Db::getInstance()->Execute($sql);
      } catch (PDOException $e) {
      }
   }
}
