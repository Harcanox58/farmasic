<?php
class Accounting
{

   public static function getAccounts()
   {
      $sql = "SELECT * FROM `" . _DB_PREFIX_ . "accounting_accounts`";
      $res = Db::getInstance()->ExecuteS($sql);
      if (!empty($res)) {
         return $res;
      } else {
         return false;
      }
   }
   public static function getAccountById()
   {
      $sql = "SELECT * FROM `" . _DB_PREFIX_ . "accounting_accounts` WHERE id_accounting_account = '" . Tools::getValue('id') . "'";
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res)) {
         return $res;
      } else {
         return false;
      }
   }
   public static function updateAccount()
   {
      $sql = "UPDATE `fs_accounting_accounts` SET `name`='" . Tools::getValue('name') . "',`code`='" . Tools::getValue('code') . "',`updated_at`=NOW(),`updated_by`='" . Session::get('_uid') . "' WHERE `id_accounting_account`='" . Tools::getValue('id') . "'";
      $res = Db::getInstance()->Execute($sql);
      if ($res) {
         Audit::trail('edit', 'Modificación de cuenta contable', 'fs_accounting_accounts');
         return true;
      } else {
         return false;
      }
   }
   public static function newAccount()
   {
      $sql = "INSERT INTO `fs_accounting_accounts`(`name`, `code`, `created_at`, `created_by`) VALUES ('" . Tools::getValue('name') . "','" . Tools::getValue('code') . "',NOW(),'" . Session::get('_uid') . "')";
      $res = Db::getInstance()->Execute($sql);
      if ($res) {
         Audit::trail('insert', 'Cuenta Contable Creada', 'fs_accounting_accounts');
         return true;
      } else {
         return false;
      }
   }
   public static function removeAccount()
   {
      $sql = "UPDATE `fs_accounting_accounts` SET `op_status`='E' WHERE id_accounting_account='" . Tools::getValue('id') . "'";
      if (Db::getInstance()->Execute($sql)) {
         Audit::trail('remove', 'Eliminación de Cuenta Contable', 'fs_accounting_accounts');
         return true;
      } else {
         return false;
      }
   }
   public static function getTypes()
   {
      $sql = "SELECT * FROM `" . _DB_PREFIX_ . "accounting_entry_types`";
      $res = Db::getInstance()->ExecuteS($sql);
      if (!empty($res)) {
         return $res;
      } else {
         return false;
      }
   }
   public static function getTypeById()
   {
      $sql = "SELECT * FROM `" . _DB_PREFIX_ . "accounting_entry_types` WHERE id_accounting_entry_type = '" . Tools::getValue('id') . "'";
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res)) {
         return $res;
      } else {
         return false;
      }
   }
   public static function updateType()
   {
      $sql = "UPDATE `fs_accounting_entry_types` SET `name`='" . Tools::getValue('name') . "',`code`='" . Tools::getValue('code') . "',`updated_at`=NOW(),`updated_by`='" . Session::get('_uid') . "' WHERE `id_accounting_entry_type`='" . Tools::getValue('id') . "'";
      $res = Db::getInstance()->Execute($sql);
      if ($res) {
         Audit::trail('edit', 'Modificación de Tipo de Asiento Contable', 'fs_accounting_accounts');
         return true;
      } else {
         return false;
      }
   }
   public static function newType()
   {
      $sql = "INSERT INTO `fs_accounting_entry_types`(`name`, `code`, `created_at`, `created_by`) VALUES ('" . Tools::getValue('name') . "','" . Tools::getValue('code') . "',NOW(),'" . Session::get('_uid') . "')";
      $res = Db::getInstance()->Execute($sql);
      if ($res) {
         Audit::trail('insert', 'Creación de Tipo de Asiento Contable', 'fs_accounting_accounts');
         return true;
      } else {
         return false;
      }
   }
   public static function removeType()
   {
      $sql = "UPDATE `fs_accounting_entry_types` SET `op_status`='E' WHERE id_accounting_account='" . Tools::getValue('id') . "'";
      if (Db::getInstance()->Execute($sql)) {
         Audit::trail('remove', 'Eliminación de Tipo de Asiento Contable', 'fs_accounting_accounts');
         return true;
      } else {
         return false;
      }
   }
   public static function getEntryTypes()
   {
      $sql = "SELECT * FROM `fs_accounting_entry_types`";
      $res = Db::getInstance()->ExecuteS($sql);
      if (!empty($res)) {
         return $res;
      } else {
         return [];
      }
   }
   public static function getEntities()
   {
      $sql = "SELECT e.id_entity, CASE WHEN r.role_type='A' THEN CONCAT(CASE WHEN e.dni<>'' THEN CONCAT(e.dni,' - ') ELSE '' END, e.firstname,' ',e.lastname) ELSE CONCAT(e.dni,'-',e.company_name) END AS name FROM	fs_entities AS e	INNER JOIN	fs_roles AS r	ON e.id_role = r.id_role WHERE id_entity>0";
      $res = Db::getInstance()->ExecuteS($sql);
      if (!empty($res)) {
         return $res;
      } else {
         return [];
      }
   }
   public static function getJournalEntries()
   {
      $sql = "SELECT je.id_accounting_journal_entry as id, je.created_at, CONCAT(et.`code`,'-', LPAD(je.corelative,6,'0')) AS corelative, et.`name` AS type, CASE WHEN r.role_type='A' THEN CONCAT(CASE WHEN e.dni<>'' THEN CONCAT(e.dni,' - ') ELSE '' END, e.firstname,' ',e.lastname) ELSE CONCAT(e.dni,'-',e.company_name) END AS entity, je.observations, je.op_status, CASE WHEN je.op_status='F' THEN 'FINALIZADO' WHEN je.op_status='A' THEN 'ABIERTO' ELSE 'PENDIENTE' END AS status FROM fs_accounting_journal_entries AS je LEFT JOIN fs_accounting_entry_types AS et ON je.id_accounting_entry_type = et.id_accounting_entry_type	LEFT JOIN fs_entities AS e	ON je.id_entity = e.id_entity LEFT JOIN fs_roles AS r ON r.id_role=e.id_role WHERE je.op_status!='E' ORDER BY je.created_at DESC";
      $res = Db::getInstance()->ExecuteS($sql);
      if (!empty($res)) {
         return $res;
      } else {
         return [];
      }
   }
   public static function getJournalEntryById()
   {
      $sql = "SELECT je.*, CONCAT(e.`code`,'-',LPAD(je.corelative,6,'0')) AS code FROM fs_accounting_journal_entries AS je INNER JOIN	fs_accounting_entry_types AS e	ON je.id_accounting_entry_type = e.id_accounting_entry_type WHERE je.id_accounting_journal_entry='" . Tools::getValue('id') . "'";
      $res = Db::getInstance()->Execute($sql);
      if ($res) {
         return $res;
      } else {
         return false;
      }
   }
   public static function removeAccountingEntry()
   {
      $sql = "UPDATE `fs_accounting_journal_entries` SET `op_status`='E' WHERE id_accounting_journal_entry='" . Tools::getValue('id') . "'";
      if (Db::getInstance()->Execute($sql)) {
         return true;
      } else {
         return false;
      }
   }
   public static function getJournalEntryDetails()
   {
      $sql = "SELECT jed.id_accounting_journal_entry_detail AS id, aa.`name`, jed.description as `desc`,aa.code, jed.debit, jed.credit FROM	fs_accounting_journal_entry_details AS jed INNER JOIN	fs_accounting_accounts AS aa ON jed.id_accounting_account = aa.id_accounting_account WHERE id_accounting_journal_entry='" . Tools::getValue('id') . "' AND jed.op_status='A'";
      $res = Db::getInstance()->ExecuteS($sql);
      if (!empty($res)) {
         return $res;
      } else {
         return [];
      }
   }
   public static function getTotals()
   {
      $res = Db::getInstance()->Execute("SELECT SUM(jed.debit) AS debit, SUM(jed.credit) as credit, (SUM(jed.debit) - SUM(jed.credit)) as diff FROM fs_accounting_journal_entry_details AS jed WHERE id_accounting_journal_entry='" . Tools::getValue('id') . "' AND jed.op_status='A'");
      $res = array(
         'debit' => "Bs. " . number_format($res['debit'], 2, ',', '.'),
         'credit' => "Bs. " . number_format($res['credit'], 2, ',', '.'),
         'diff' => "Bs. " . number_format($res['diff'], 2, ',', '.'),
         'total' => "Bs. " . number_format($res['debit'] + $res['credit'], 2, ',', '.'),
      );
      return $res;
   }
   public static function getJournalEntryDetailTotals()
   {
      $sql = "SELECT SUM(debit) AS debit,SUM(credit) AS credit, SUM(debit) - SUM(credit) as diff FROM fs_accounting_journal_entry_details WHERE id_accounting_journal_entry='" . Tools::getValue('id') . "'";
      $res = Db::getInstance()->ExecuteS($sql);
      if (!empty($res)) {
         return $res;
      } else {
         return [];
      }
   }
   public static function addNewEntryDetail()
   {
      $sql = "INSERT INTO `fs_accounting_journal_entry_details`(`id_accounting_journal_entry`, `id_accounting_account`, `description`, `debit`, `credit`, `op_status`) VALUES ('" . Tools::getValue('id') . "','" . Tools::getValue('account') . "','" . Tools::getValue('desc') . "','" . Tools::clearBS(Tools::getValue('debit')) . "','" . Tools::clearBS(Tools::getValue('credit')) . "','A')";
      $res = Db::getInstance()->Execute($sql);
      if ($res) {
         return true;
      } else {
         return false;
      }
   }
   public static function removeEntryLine()
   {
      $sql = "UPDATE `fs_accounting_journal_entry_details` SET `op_status`='E' WHERE `id_accounting_journal_entry_detail`='" . Tools::getValue('id') . "'";
      if (Db::getInstance()->Execute($sql)) {
         return true;
      } else {
         return false;
      }
   }
   public static function frozeType()
   {
      $sql = "UPDATE `fs_accounting_journal_entries` SET `id_accounting_entry_type`='" . Tools::getValue('type') . "' WHERE id_accounting_journal_entry='" . Tools::getValue('id') . "'";
      Db::getInstance()->Execute($sql);
      $sql = "SELECT CASE WHEN MAX(corelative) IS NULL THEN 1 ELSE MAX(corelative)+1 END as corelative FROM fs_accounting_journal_entries WHERE id_accounting_entry_type='" . Tools::getValue('type') . "'";
      $res = Db::getInstance()->Execute($sql);
      $corelative = $res['corelative'];
      $sql = "UPDATE `fs_accounting_journal_entries` SET `corelative`='" . $corelative . "' WHERE id_accounting_journal_entry='" . Tools::getValue('id') . "'";
      Db::getInstance()->Execute($sql);
      $sql = "SELECT CONCAT(e.`code`,'-',je.corelative) AS code FROM fs_accounting_journal_entries AS je INNER JOIN	fs_accounting_entry_types AS e	ON je.id_accounting_entry_type = e.id_accounting_entry_type WHERE je.id_accounting_journal_entry='" . Tools::getValue('id') . "'";
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res)) {
         return $res['code'];
      } else {
         return false;
      }
   }
   public static function frozeEntity()
   {
      $sql = "UPDATE `fs_accounting_journal_entries` SET `id_entity`='" . Tools::getValue('entity') . "',`op_status`='A' WHERE id_accounting_journal_entry='" . Tools::getValue('id') . "'";
      if (Db::getInstance()->Execute($sql)) {
         return true;
      } else {
         return false;
      }
   }
   public static function saveAccountingEntry()
   {
      $sql = "SELECT (SUM(jed.debit) - SUM(jed.credit)) as diff FROM fs_accounting_journal_entry_details AS jed WHERE id_accounting_journal_entry='" . Tools::getValue('id') . "' AND jed.op_status='A'";
      $res = Db::getInstance()->Execute($sql);
      if ($res['diff'] == 0) {
         $sql = "UPDATE `fs_accounting_journal_entries` SET `id_entity`='" . Tools::getValue('entity') . "',`observations`='" . Tools::getValue('observations') . "',`op_status`='A' WHERE id_accounting_journal_entry='" . Tools::getValue('id') . "'";
         if (Db::getInstance()->Execute($sql)) {
            return true;
         } else {
            return false;
         }
      }
   }
   public static function newAccountingEntry()
   {
      $sql = "INSERT INTO `fs_accounting_journal_entries`(`created_at`,`op_status`) VALUES (NOW(),'P')";
      Db::getInstance()->Execute($sql);
      $sql = "SELECT MAX(id_accounting_journal_entry) as id FROM fs_accounting_journal_entries WHERE op_status='P'";
      $res = Db::getInstance()->Execute($sql);
      if ($res) {
         Audit::trail('insert', 'Nuevo Asiento Contable Creado', 'fs_accounting_journal_entries');
         return $res['id'];
      } else {
         return false;
      }
   }
   public static function getCXCEntries()
   {
      $sql = "SELECT cxc.id_cxc, cxc.balance, cxc.balance_usd, cxc.created_at, LPAD(o.id_order,6,'0') AS `code`, o.exchange_rate,	CASE WHEN r.role_type='A' THEN CONCAT(CASE WHEN e.dni<>'' THEN CONCAT(e.dni,' - ') ELSE '' END, e.firstname,' ',e.lastname) ELSE CONCAT(e.dni,'-',e.company_name) END AS entity FROM fs_cxc AS cxc INNER JOIN fs_entities AS e ON cxc.id_entity = e.id_entity INNER JOIN fs_orders AS o ON cxc.id_order = o.id_order INNER JOIN fs_roles AS r ON e.id_role = r.id_role ORDER BY created_at DESC";
      $res = Db::getInstance()->ExecuteS($sql);
      if (!empty($res)) {
         return $res;
      } else {
         return false;
      }
   }
   public static function getCXCEntriesByCustomerId()
   {
      $sql = "SELECT cxc.id_cxc, cxc.balance, cxc.balance_usd, cxc.created_at, LPAD(o.id_order,6,'0') AS `code`, o.exchange_rate,	CASE WHEN r.role_type='A' THEN CONCAT(CASE WHEN e.dni<>'' THEN CONCAT(e.dni,' - ') ELSE '' END, e.firstname,' ',e.lastname) ELSE CONCAT(e.dni,'-',e.company_name) END AS entity FROM fs_cxc AS cxc INNER JOIN fs_entities AS e ON cxc.id_entity = e.id_entity INNER JOIN fs_orders AS o ON cxc.id_order = o.id_order INNER JOIN fs_roles AS r ON e.id_role = r.id_role WHERE cxc.id_entity='" . Session::get('_uid') . "' ORDER BY created_at DESC";
      $res = Db::getInstance()->ExecuteS($sql);
      if (!empty($res)) {
         return $res;
      } else {
         return false;
      }
   }
   public static function getCXPEntries()
   {
      Db::getInstance()->Execute('SET @num_row=0;');
      $sql = "SELECT  (@num_row:=@num_row+1) AS num_row, cxp.id_cxp, LPAD(so.id_shopping_order,6,'0') AS code, cxp.balance, cxp.balance_usd, cxp.created_at, cxp.op_status, so.exchange_rate,	CASE WHEN r.role_type='A' THEN CONCAT(CASE WHEN e.dni<>'' THEN CONCAT(e.dni,' - ') ELSE '' END, e.firstname,' ',e.lastname) ELSE CONCAT(e.dni,'-',e.company_name) END AS entity FROM fs_cxp AS cxp INNER JOIN fs_entities AS e ON cxp.id_entity = e.id_entity	INNER JOIN fs_shopping_orders AS so	ON cxp.id_shopping_order = so.id_shopping_order	INNER JOIN fs_roles AS r ON e.id_role = r.id_role";
      $res = Db::getInstance()->ExecuteS($sql);
      if (!empty($res)) {
         return $res;
      } else {
         return false;
      }
   }
   public static function newEntry($type, $entity)
   {
      $sql = "INSERT INTO `fs_accounting_journal_entries`(`id_accounting_entry_type`, `id_entity`,`created_at`,`op_status`) VALUES ('" . $type . "','" . $entity . "',NOW(),'F')";
      Db::getInstance()->Execute($sql);
      $sql = "SELECT MAX(id_accounting_journal_entry) as id, CASE WHEN MAX(corelative) IS NULL THEN 1 ELSE MAX(corelative)+1 END as corelative  FROM fs_accounting_journal_entries WHERE id_accounting_entry_type='" . $type . "'";
      $res = Db::getInstance()->Execute($sql);
      $corelative = $res['corelative'];
      $id = $res['id'];
      $sql = "UPDATE `fs_accounting_journal_entries` SET `corelative`='" . $corelative . "' WHERE id_accounting_journal_entry='" . $id . "'";
      Db::getInstance()->Execute($sql);
      Audit::trail('insert', 'Nuevo Asiento Contable Creado', 'fs_accounting_journal_entries');
      return $id;
   }
   public static function newEntryLine($entry, $account, $desc, $debit, $credit)
   {
      $sql = "INSERT INTO `fs_accounting_journal_entry_details`(`id_accounting_journal_entry`, `id_accounting_account`, `description`, `debit`, `credit`, `op_status`) VALUES ('" . $entry . "','" . $account . "','" . $desc . "','" . $debit . "','" . $credit . "','A')";
      if (Db::getInstance()->Execute($sql)) {
         return true;
      } else {
         return false;
      }
   }
   public static function newCXC($id_order, $entity, $balance, $balance_usd)
   {
      $sql = "INSERT INTO `fs_cxc`(`id_order`, `id_entity`, `balance`, `balance_usd`, `created_at`, `op_status`) VALUES ('" . $id_order . "','" . $entity . "','" . $balance . "','" . $balance_usd . "',NOW(),'A')";
      if (Db::getInstance()->Execute($sql)) {
         return true;
      } else {
         return false;
      }
   }
   public static function newCXP($id_shopping_order, $entity, $balance, $balance_usd)
   {
      $sql = "INSERT INTO `fs_cxp`(`id_shopping_order`, `id_entity`, `balance`, `balance_usd`, `created_at`, `op_status`) VALUES ('" . $id_shopping_order . "','" . $entity . "','" . $balance . "','" . $balance_usd . "',NOW(),'A')";
      if (Db::getInstance()->Execute($sql)) {
         return true;
      } else {
         return false;
      }
   }
   public static function generateCXC(int $id_order, int $id_entity, $amount, $amount_usd)
   {
      $id = self::newEntry(5, $id_entity);
      self::newCXC($id_order, $id_entity, $amount, $amount_usd);
      self::newEntryLine($id, 1, 'CXC', $amount, 0);
      self::newEntryLine($id, 3, 'FACTURA DE VENTA No. ' . str_pad($id_order, 6, "0", STR_PAD_LEFT), 0, $amount);
   }
   public static function generateCXP(int $id_shopping_order, int $id_entity, $amount, $amount_usd)
   {
      $id = self::newEntry(9, $id_entity);
      self::newCXP($id_shopping_order, $id_entity, $amount, $amount_usd);
      self::newEntryLine($id, 2, 'CXP', $amount, 0);
      self::newEntryLine($id, 3, 'ORDEN DE COMPRA No. ' . str_pad($id_shopping_order, 6, "0", STR_PAD_LEFT), 0, $amount);
   }
}
