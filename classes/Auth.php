<?php
class Auth
{
   public static function isUserExists()
   {
      $sql = "SELECT e.id_entity FROM fs_entities AS e WHERE e.username='" . Tools::getValue('username') . "'";
      $response = Db::getInstance()->Execute($sql);
      if (!empty($response) && $response['id_entity'] != 0) {
         return true;
      } else {
         return false;
      }
   }
   public static function checkRole()
   {
      $sql = "SELECT r.role_type FROM fs_entities AS e INNER JOIN fs_roles AS r ON e.id_role = r.id_role";
   }

   public static function authenticate(bool $isAdmin = false)
   {
      if (Auth::isUserExists()) {
         if (Auth::userValidate($isAdmin)) {
            Session::set('_auth', true);
            Session::set('_uid', Auth::getUserId());
            Session::set('_uname', Auth::getUserName());
            Session::set('_token', Hash::lite(Session::get('_uid') . uniqid()));
            return true;
         } else {
            Tools::ajaxResponse(['response' => ['type' => 'error', 'message' => 'Usuario y/o Contraseña no son validos']]);
         }
      } else {
         Tools::ajaxResponse(['response' => ['type' => 'error', 'message' => 'El usuario proporcionado no existe']]);
      }
   }
   public static function getUserName()
   {
      $sql = "SELECT CASE WHEN r.role_type='A' THEN CONCAT(e.firstname,' ',e.lastname) ELSE e.company_name END AS name FROM fs_entities AS e  INNER JOIN fs_roles AS r ON e.id_role = r.id_role WHERE e.username='" . Tools::getValue('username') . "' AND e.password='" . Hash::make(Tools::getValue('password')) . "'";
      $response = Db::getInstance()->Execute($sql);
      if (!empty($response)) {
         return $response['name'];
      } else {
         return false;
      }
   }
   public static function getUserId()
   {
      $sql = "SELECT e.id_entity FROM fs_entities AS e WHERE e.username='" . Tools::getValue('username') . "' AND e.password='" . Hash::make(Tools::getValue('password')) . "'";
      $response = Db::getInstance()->Execute($sql);
      if (!empty($response) && $response['id_entity'] != 0) {
         return $response['id_entity'];
      } else {
         return false;
      }
   }
   public static function userValidate(bool $isAdmin = false)
   {
      $append = " AND (r.role_type='D' OR r.role_type='A' OR r.role_type='C')";
      if ($isAdmin == true)
         $append = " AND (r.role_type='A' OR r.role_type='D')";
      $sql = "SELECT e.id_entity FROM fs_entities AS e INNER JOIN fs_roles AS r ON r.id_role=e.id_role WHERE e.username='" . Tools::getValue('username') . "' AND e.password='" . Hash::make(Tools::getValue('password')) . "'" . $append;
      $response = Db::getInstance()->Execute($sql);
      if (!empty($response) && $response['id_entity'] != 0) {
         return true;
      } else {
         return false;
      }
   }
   // public static function authenticate($role = '3')
   // {
   //    $sql = "SELECT u.id_entity, u.username from " . _DB_PREFIX_ . "entities as u WHERE (u.username='" . Tools::getValue('username')  . "' or u.email='" . Tools::getValue('username') . "') and u.`password`='" . Hash::make(Tools::getValue('password')) . "'AND u.is_active='1' AND u.is_deleted='0' AND (id_role='" . $role . "' OR id_role='-1')";
   //    $res = Db::getInstance()->Execute($sql);
   //    if (!empty($res['id_entity'])) {
   //       Session::set('USERID', $res['id_entity']);
   //       Session::set('USERNAME', $res['username']);
   //       return true;
   //    } else {
   //       return false;
   //    }
   // }
   public static function logout()
   {
      Session::destroy();
   }
   public static function checkUser($role = '3')
   {
      $sql = "SELECT u.id_entity, u.username from " . _DB_PREFIX_ . "entities as u WHERE (u.username='" . Tools::getValue('username') . "' or u.email='" . Tools::getValue('username') . "') AND u.`is_active`='1' AND u.`is_deleted`='0' AND (id_role='" . $role . "' OR id_role='-1')";
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res['id_entity'])) {
         return true;
      } else {
         return false;
      }
   }
}
