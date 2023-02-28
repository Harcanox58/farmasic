<?php
class Parameters
{
   public static function getCompanies()
   {
      $sql = "SELECT * FROM `" . _DB_PREFIX_ . "companies`";
      $res = Db::getInstance()->ExecuteS($sql);
      if (!empty($res)) {
         return $res;
      } else {
         return false;
      }
   }
   public static function getCompanyById()
   {
      $sql = "SELECT * FROM `" . _DB_PREFIX_ . "companies` WHERE id_company = '" . Tools::getValue('id') . "'";
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res)) {
         return $res;
      } else {
         return false;
      }
   }
   public static function getCities()
   {
      $options = array();
      foreach (Options::get(2) as $opt) {
         $options['value'] = $opt['id_option'];
         $options['label'] = $opt['name'];
      }
      return $options;
   }
   public static function getPDFCompanyInfo()
   {
      $sql = "SELECT c.address, c.email_contact AS email, c.phone FROM fs_companies AS c WHERE c.id_company=1";
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res)) {
         return $res;
      } else {
         return false;
      }
   }
   public static function getRoles()
   {
      Db::getInstance()->Execute('SET @num_row=0;');
      $sql = "SELECT (@num_row:=@num_row+1) AS num_row, r.*,(CASE WHEN r.is_default = 1 THEN 'SI' ELSE 'NO' END) as _default FROM fs_roles as r where r.id_role > 0 AND r.is_deleted !=1 AND r.role_type != 'C' AND r.role_type != 'P'";
      $res = Db::getInstance()->ExecuteS($sql);
      if (!empty($res)) {
         return $res;
      }
      return false;
   }
   public static function setRole()
   {
      $res = Db::getInstance()->Execute("SELECT * FROM fs_roles WHERE id_role='" . Tools::getValue('id') . "'");
      $is_active = Tools::getValue('is_active') == 'on' ? '1' : '';
      if (empty($res)) {
         $sql = "INSERT INTO `fs_roles`(`name`, `is_active`,`role_type`,`is_default`,`is_deleted`) VALUES ('" . Tools::getValue('name') . "','" . $is_active . "','" . Tools::getValue('role') . "','0','0')";
      } else {
         $sql = "UPDATE `fs_roles` SET `name`='" . Tools::getValue('name') . "',`is_active`='" . $is_active . "',`role_type`='" . Tools::getValue('role') . "' WHERE `id_role`='" . Tools::getValue('id') . "'";
      }
      try {
         Db::getInstance()->Execute($sql);
         Tools::response('success', 'Datos Guardados.');
      } catch (PDOException $e) {
      }
   }
   public static function removeRole()
   {
      $sql = "UPDATE `fs_roles` SET `is_deleted`='1' WHERE `id_role`='" . Tools::getValue('id') . "'";
      try {
         Db::getInstance()->Execute($sql);
         Tools::response('success', 'Datos Guardados.');
      } catch (PDOException $e) {
      }
   }
   public static function changeRoleStatus()
   {
      $sql = "UPDATE `fs_roles` SET `is_active`='" . Tools::getValue('checked') . "' WHERE id_role='" . Tools::getValue('id') . "'";
      try {
         Db::getInstance()->Execute($sql);
         Tools::ajaxResponse(['response' => ['type' => 'success', 'message' => 'Estado Actualizado.']]);
      } catch (Exception $e) {

         Tools::ajaxResponse(['response' => ['type' => 'error', 'message' => 'Error al procesar la solicitud.']]);
      }
   }
   public static function generatePermissions()
   {
      $items = Db::getInstance()->ExecuteS('SELECT fs_menu_items.id_menu_item, fs_menu_items.`name`, fs_menu_items.permission_name, fs_menu_items.is_parent, fs_menu_items.is_child, fs_menu_items.id_parent,fs_menu_items.num_order FROM fs_menu_items');
      $putPermissions = [];
      foreach ($items as $i) {
         $res = Db::getInstance()->Execute("SELECT id_permission as id FROM fs_permissions WHERE fs_permissions.`code` = '" . $i['permission_name'] . "'");
         if (empty($res['id']) && !empty($i['permission_name'])) {
            $data = implode("','", [$i['id_menu_item'], $i['name'], $i['permission_name'], $i['is_child'], $i['is_parent'],  $i['id_parent'],  $i['num_order']]);
            $putPermissions[] = "('" . $data . "')";
         }
      }
      if (!empty($putPermissions)) {
         $putSql = 'INSERT INTO fs_permissions (`id_item`,`name`,`code`,`is_child`,`is_parent`,`parent_id`,`order_grid`) VALUES ' . implode(",", $putPermissions);
         Db::getInstance()->Execute($putSql);
      }
   }
   public static function generatePermissionsRoles()
   {
      foreach (Db::getInstance()->ExecuteS('SELECT * FROM fs_roles') as $role) {
         $permission_values = [];
         foreach (Db::getInstance()->ExecuteS('SELECT * FROM  fs_permissions') as $permission) {
            $checkPermission = Db::getInstance()->Execute('SELECT * FROM fs_permission_roles WHERE id_permission = ' . $permission['id_permission'] . ' AND id_role = ' . $role['id_role']);
            $permission_role = [];
            if (empty($checkPermission)) {
               $default_values = '';
               if ($role['id_role'] < 0) {
                  $default_values = ',1,1,1,1';
               } else {
                  $default_values = ',0,0,0,0';
               }
               $permission_role[] = "'" . $permission['id_permission'] . "','" . $role['id_role'] . "'" . $default_values;
            } else {
               continue;
            }
            $permission_values[] = '(' . implode(",", $permission_role) . ')';
         }
         if (!empty($permission_values)) {
            $sql = "INSERT INTO fs_permission_roles (`id_permission`,`id_role`,`view`,`add`,`edit`,`delete`) VALUES " . implode(",", $permission_values);
            Db::getInstance()->Execute($sql);
         }
      }
   }
   public static function SetPermissionRole()
   {
      $sql = "UPDATE `fs_permission_roles` SET `" . Tools::getValue('permission') . "`='" . Tools::getValue('value') . "' WHERE `id_permission`='" . Tools::getValue('permission_id') . "' AND `id_role`='" . Tools::getValue('role_id') . "'";
      echo $sql;
      try {
         Db::getInstance()->Execute($sql);
         return true;
      } catch (PDOException $e) {
         return false;
      }
   }
   public static function buildPermissionsGrid($role_id)
   {
      $html = '';
      $permissions = Db::getInstance()->ExecuteS('SELECT * FROM fs_permissions ORDER BY order_grid ASC');
      foreach ($permissions as $permission) {
         if ($permission['is_parent'] != 0) {
            $html .= '<tr style="background:#eeeeee">';
            $html .= '<td class="text-left text-bold">'  . $permission['name'] . '</td>';
            $childs = Db::getInstance()->ExecuteS("SELECT * FROM fs_permissions WHERE is_child='1' AND parent_id='" . $permission['id_item'] . "' ORDER BY order_grid ASC");
            $html .= self::checkGrid('view', $permission['id_permission'], $role_id);
            $html .= self::checkGrid('add', $permission['id_permission'], $role_id);
            $html .= self::checkGrid('edit', $permission['id_permission'], $role_id);
            $html .= self::checkGrid('delete', $permission['id_permission'], $role_id);
            foreach ($childs as $child) {
               $html .= '<tr>';
               $html .= '<td class="text-left">» '  . $child['name'] . '</td>';
               $html .= self::checkGrid('view', $child['id_permission'], $role_id);
               $html .= self::checkGrid('add', $child['id_permission'], $role_id);
               $html .= self::checkGrid('edit', $child['id_permission'], $role_id);
               $html .= self::checkGrid('delete', $child['id_permission'], $role_id);
               $html .= '</tr>';
            }
         }
         if ($permission['is_parent'] == 0 && $permission['is_child'] == 0) {
            $html .= '<tr style="background:#eeeeee">';
            $html .= '<td class="text-left text-bold">'  . $permission['name'] . '</td>';
            $html .= self::checkGrid('view', $permission['id_permission'], $role_id);
            $html .= self::checkGrid('add', $permission['id_permission'], $role_id);
            $html .= self::checkGrid('edit', $permission['id_permission'], $role_id);
            $html .= self::checkGrid('delete', $permission['id_permission'], $role_id);
         }

         $html .= '</tr>';
      }

      echo $html;
   }
   public static function validPermissionInRole()
   {
      $sql = "SELECT * FROM fs_permission_roles WHERE id_role='" . Tools::getValue('id') . "'";
      $result = Db::getInstance()->ExecuteS($sql);
      foreach ($result as $row) {
         if ($row['id_role'] > 0) {
            return true;
         }
      }
      return false;
   }
   public static function getRoleById()
   {
      $sql = "SELECT * FROM fs_roles WHERE id_role='" . Tools::getValue('id') . "'";
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res)) {
         return $res;
      }
      return false;
   }
   public static function checkGrid($action, $id, $role_id)
   {
      $event = "changePermissionWithAJAX(this,'" . $action . "','" . $id . "','" . $role_id . "')";
      $html = '<td class="text-center" style="width: 50px !important">
                     <div class="custom-control custom-checkbox">
                        <input class="custom-control-input" type="checkbox" onchange="' . $event . '" ' . self::getPermissionData($action, $id, $role_id) . ' id="' . $action . '-' . $id . '-' . $role_id . '" value="option1">
                        <label for="' . $action . '-' . $id . '-' . $role_id . '" class="custom-control-label"></label>
                     </div>
                  </td>';
      return $html;
   }
   public static function getPermissionData($action, $id, $role_id)
   {
      $req = Db::getInstance()->Execute("SELECT fs_permission_roles." . $action . " FROM fs_permission_roles WHERE id_permission='" . $id . "' AND id_role='" . $role_id . "'");
      if (!empty($req) && $req[$action] == true) {
         return 'checked';
      }
   }
}
