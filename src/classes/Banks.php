<?php
class Banks
{
  public static function getBanks()
  {
    Db::getInstance()->Execute('SET @num_row=0;');
    $sql = "SELECT ( @num_row:=@num_row + 1) AS num_row, ext.* FROM (SELECT b.id_bank,b.`name`, b.num_account, CASE WHEN b.op_currency ='B' THEN 'BOLIVARES' ELSE 'DOLARES' END AS currency, CASE WHEN b.op_status ='A' THEN 'ACTIVO' ELSE 'INACTIVO' END AS status, b.op_status FROM fs_banks AS b WHERE b.op_status <> 'E' ORDER BY b.`name` ASC) ext;";
    $res = Db::getInstance()->ExecuteS($sql);
    if (!empty($res)) {
      return $res;
    } else {
      return false;
    }
  }
  public static function getBankById()
  {
    $sql = "SELECT * FROM fs_banks WHERE id_bank ='" . Tools::getValue('id') . "'";
    $res = Db::getInstance()->Execute($sql);
    if (!empty($res)) {
      return $res;
    } else {
      return false;
    }
  }
  public static function saveBank()
  {
    $sql = "";
    if (!Tools::getValue('id')) {
      $sql = "INSERT INTO `fs_banks`( `name`, `num_account`, `op_currency`, `op_status`) VALUES ('" . Tools::getValue('name') . "','" . Tools::getValue('num_account') . "','" . Tools::getValue('op_currency') . "','" . Tools::getValue('op_status') . "')";
    } else {
      $sql = "UPDATE `fs_banks` SET `name`='" . Tools::getValue('name') . "',`num_account`='" . Tools::getValue('num_account') . "',`op_currency`='" . Tools::getValue('op_currency') . "',`op_status`='" . Tools::getValue('op_status') . "' WHERE id_bank='" . Tools::getValue('id') . "'";
    }
    if (Db::getInstance()->Execute($sql)) {
      return true;
    } else {
      return false;
    }
  }
  public static function removeBank()
  {
    $sql = "UPDATE `fs_banks` SET `op_status`='E' WHERE id_bank='" . Tools::getValue('id') . "'";
    if (Db::getInstance()->Execute($sql)) {
      return true;
    } else {
      return false;
    }
  }
  public static function getAccounts()
  {
    $sql = "";
  }
  public static function getAccountById()
  {
    $sql = "";
  }
  public static function saveAccount()
  {
    $sql = "";
  }
  public static function removeAccount()
  {
    $sql = "";
  }
}
