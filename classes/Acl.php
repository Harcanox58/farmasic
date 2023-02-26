<?php
class Acl
{
   public static function check($permission, $action)
   {

      Db::getInstance()->Execute("SELECT fpr.`" . $action . "` FROM fs_permission_roles AS fpr INNER JOIN fs_roles AS fr ON fpr.id_role = fr.id_role INNER JOIN fs_entities AS fe ON fr.id_role = fe.id_role WHERE fe.id_entity ='" . Session::get('_uid') . "'");
   }
   public static function group_permission($permission)
   {
   }
   public static function user_permissions($permission)
   {
   }
}
