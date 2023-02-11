<?php
class Dev
{
   public static function getMenuItems()
   {
      $sql = "SELECT mi.id_menu_item,mi.name,mi.type,mi.icon,mi.permission_name,mi.num_order,mi.is_active,p.name AS parent FROM `fs_menu_items` AS mi LEFT JOIN fs_menu_items AS p ON mi.id_parent=p.id_menu_item;";
      $res = Db::getInstance()->ExecuteS($sql);
      if (!empty($res)) {
         return $res;
      }
      return false;
   }
   public static function getMenuItemById()
   {
      $sql = "SELECT mi.id_menu_item,mi.name,mi.type,mi.icon,mi.permission_name,mi.num_order,mi.is_active,p.name AS parent FROM `fs_menu_items` AS mi LEFT JOIN fs_menu_items AS p ON mi.id_parent=p.id_menu_item WHERE mi.id_menu_item='" . Tools::getValue('id') . "'";
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res)) {
         return $res;
      }
      return false;
   }
   public static function saveMenuItem()
   {
      $sql = "";
      if (!Tools::getValue('id')) {
         $sql = "INSERT INTO `fs_menu_items`(`type`, `name`, `link`, `icon`, `permission_name`, `is_parent`, `is_child`, `is_header`, `id_parent`, `is_active`, `is_deleted`, `num_order`) VALUES ('[value-2]','[value-3]','[value-4]','[value-5]','[value-6]','[value-7]','[value-8]','[value-9]','[value-10]','[value-11]','[value-12]','[value-13]')";
      } else {
         $sql = "UPDATE `fs_menu_items` SET `type`='[value-2]',`name`='[value-3]',`link`='[value-4]',`icon`='[value-5]',`permission_name`='[value-6]',`is_parent`='[value-7]',`is_child`='[value-8]',`is_header`='[value-9]',`id_parent`='[value-10]',`is_active`='[value-11]',`is_deleted`='[value-12]',`num_order`='[value-13]' WHERE `id_menu_item`='" . Tools::getValue('id') . "'";
      }
      Dev::setMenuPermissions();
   }
   public static function getPermissions()
   {
      $sql = "SELECT * FROM fs_permissions";
      $res = Db::getInstance()->ExecuteS($sql);
      if (!empty($res)) {
         return $res;
      }
      return false;
   }
   public static function setMenuPermissions()
   {
      $sql = "INSERT INTO fs_permissions (type,name,code) SELECT 'M',mi.name,mi.permission_name FROM fs_menu_items as mi LEFT JOIN fs_permissions as p ON p.code=mi.permission_name WHERE p.code IS NULL AND (mi.permission_name IS NOT NULL OR mi.permission_name!='')";
      if (Db::getInstance()->Execute($sql)) {
         return true;
      }
      return false;
   }
   public static function savePermission()
   {
      $sql = "";
      if (!Tools::getValue('id')) {
         $sql = "INSERT INTO `fs_permissions`(`type`, `name`, `code`) VALUES ('" . Tools::getValue('type') . "','" . Tools::getValue('name') . "','" . Tools::getValue('code') . "')";
      } else {
         $sql = "UPDATE `fs_permissions` SET `type`='" . Tools::getValue('type') . "',`name`='" . Tools::getValue('name') . "',`code`='" . Tools::getValue('code') . "' WHERE `id_permission`='" . Tools::getValue('id') . "'";
      }
      if (Db::getInstance()->Execute($sql)) {
         return true;
      }
      return false;
   }
}
