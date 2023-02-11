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
   }
   public static function remUserById()
   {
   }
}
