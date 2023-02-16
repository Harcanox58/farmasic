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
      $sql = "SELECT (@num_row:=@num_row+1) AS num_row, r.*,(CASE WHEN r.is_default = 1 THEN 'SI' ELSE 'NO' END) as _default FROM fs_roles as r";
      $res = Db::getInstance()->ExecuteS($sql);
      if (!empty($res)) {
         return $res;
      }
      return false;
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
   public static function buildPermissionsGrid()
   {
      $html = '';
      $permissions = Db::getInstance()->ExecuteS('SELECT * FROM fs_permissions ORDER BY order_grid ASC');
      foreach ($permissions as $permission) {
         if ($permission['is_parent'] != 0) {
            $html .= '<tr style="background:#eeeeee">';
            $html .= '<td class="text-left text-bold">'  . $permission['name'] . '</td>';
            $childs = Db::getInstance()->ExecuteS("SELECT * FROM fs_permissions WHERE is_child='1' AND parent_id='" . $permission['id_item'] . "' ORDER BY order_grid ASC");
            $html .= self::checkGrid('view', $permission['id_item']);
            $html .= self::checkGrid('add', $permission['id_item']);
            $html .= self::checkGrid('edit', $permission['id_item']);
            $html .= self::checkGrid('delete', $permission['id_item']);
            foreach ($childs as $child) {
               $html .= '<tr>';
               $html .= '<td class="text-left">» '  . $child['name'] . '</td>';
               $html .= self::checkGrid('view', $child['id_item']);
               $html .= self::checkGrid('add', $child['id_item']);
               $html .= self::checkGrid('edit', $child['id_item']);
               $html .= self::checkGrid('delete', $child['id_item']);
               $html .= '</tr>';
            }
         }
         if ($permission['is_parent'] == 0 && $permission['is_child'] == 0) {
            $html .= '<tr style="background:#eeeeee">';
            $html .= '<td class="text-left text-bold">'  . $permission['name'] . '</td>';
            $html .= self::checkGrid('view', $permission['id_item']);
            $html .= self::checkGrid('add', $permission['id_item']);
            $html .= self::checkGrid('edit', $permission['id_item']);
            $html .= self::checkGrid('delete', $permission['id_item']);
         }

         $html .= '</tr>';
      }
      echo $html;
   }
   public static function checkGrid($action, $id)
   {
      $html = '<td class="text-center" style="width: 50px !important">
                     <div class="custom-control custom-checkbox">
                        <input class="custom-control-input" type="checkbox" ' . self::getPermissionData($action, $id) . ' id="' . $action . '-' . $id . '" value="option1">
                        <label for="' . $action . '-' . $id . '" class="custom-control-label"></label>
                     </div>
                  </td>';
      return $html;
   }
   public static function getPermissionData($action, $id)
   {
      $req = Db::getInstance()->Execute("SELECT fs_permission_roles." . $action . " FROM fs_permission_roles WHERE id_permission='" . $id . "' AND id_role='" . Tools::getValue('id') . "'");
      if (!empty($req) && $req[$action] == true) {
         return 'checked';
      }
   }
}
