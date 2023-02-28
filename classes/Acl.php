<?php
class Acl
{
   public static function check($permission, $action = 'view')
   {

      $res = Db::getInstance()->Execute("SELECT pr.`" . $action . "` FROM fs_permission_roles AS pr INNER JOIN fs_permissions AS p ON pr.id_permission = p.id_permission INNER JOIN fs_entities AS e ON pr.id_role = e.id_role WHERE p.`code` = '" . $permission . "' AND e.id_entity = '" . Session::get('_uid') . "'");
      if (!empty($res) && $res[$action] == true) {
         return true;
      }
      return false;
   }
}
