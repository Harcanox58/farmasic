<?php
class Vouchers
{
   public static function new()
   {
      Db::getInstance()->Execute("INSERT INTO " . _DB_PREFIX_ . "vouchers (op_status,id_created_by,created_at) VALUES ('1'," . Session::get('_uid') . ",NOW())");
      $res = Db::getInstance()->Execute('SELECT MAX(id_voucher) as id FROM `' . _DB_PREFIX_ . 'vouchers`');
      return $res[0];
   }
   public static function getById($id)
   {
      $res = Db::getInstance()->Execute('SELECT * FROM `' . _DB_PREFIX_ . 'vouchers` WHERE id_voucher = ' . $id);
      return $res;
   }
   public static function getAccounts()
   {
      $res = Db::getInstance()->ExecuteS('SELECT * FROM `' . _DB_PREFIX_ . 'accounts`');
      return $res;
   }
   public static function getVoucherTypes()
   {
      $res = Db::getInstance()->ExecuteS('SELECT * FROM `' . _DB_PREFIX_ . 'voucher_types`');
      return $res;
   }
   public static function newLine($id_voucher, $id_account, $debit, $credit, $desc)
   {
      $debit = str_replace(',', '.', str_replace('Bs. ', '', $debit));
      $credit = str_replace(',', '.', str_replace('Bs. ', '', $credit));
      $res = Db::getInstance()->Execute("INSERT INTO " . _DB_PREFIX_ . "voucher_lines (id_voucher,id_account,left_index,right_index,line_text) VALUES ('" . $id_voucher . "','" . $id_account . "','" . $debit . "','" . $credit . "','" . $desc . "')");
      // $res = Db::getInstance()->Execute("INSERT INTO" . _DB_PREFIX_ . "voucher_lines (id_voucher,id_account,left_index,right_index,line_text,op_status,created_at,id_created_by) VALUES (?,?,?,?,?,?,NOW(),?)", [$id_voucher, $id_account, $debit, $credit, $desc, 'A', Session::get('_uid')]);
      if ($res) {
         return true;
      } else {
         return false;
      }
   }
   public static function getLines($id)
   {
      $data = Db::getInstance()->ExecuteS("SELECT id_voucher_line,name,line_text,left_index,right_index  FROM fs_voucher_lines as v, fs_accounts as a WHERE a.id_account=v.id_account and id_voucher='" . $id . "' ORDER BY 1 ASC");
      $res = array();
      $total_left = 0;
      $total_right = 0;
      $descuadre = 0;
      foreach ($data as $d) {
         $total_left += $d['left_index'];
         $total_right += $d['right_index'];
         if ($total_left != $total_right) {
            $descuadre = $total_left - $total_right;
         }
         $res[] = array(
            'id' => $d['id_voucher_line'],
            'name' => $d['name'],
            'line_text' => $d['line_text'],
            'left_index' => "Bs. " . number_format($d['left_index'], 2, ',', '.'),
            'right_index' => "Bs. " . number_format($d['right_index'], 2, ',', '.'),
         );
      }
      return $res;
   }
   public static function getVouchers()
   {
      $res = Db::getInstance()->ExecuteS('SELECT id_voucher,date,vt.`name`,code,number,observations,o.`name` as state FROM `fs_vouchers` as v,fs_voucher_types as vt,fs_options as o WHERE v.id_voucher_type=vt.id_voucher_type AND o.id_option=v.op_status');
      return $res;
   }
   public static function getTotals($id)
   {
      $res = Db::getInstance()->Execute("SELECT SUM(v.left_index) AS t_debito, SUM(v.right_index) as t_credito, (SUM(v.left_index) - SUM(v.right_index)) as diferencia FROM fs_voucher_lines AS v WHERE v.id_voucher='" . $id . "'");
      $res = array(
         't_debito' => "Bs. " . number_format($res['t_debito'], 2, ',', '.'),
         't_credito' => "Bs. " . number_format($res['t_credito'], 2, ',', '.'),
         'diferencia' => "Bs. " . number_format($res['diferencia'], 2, ',', '.'),
         'total' => "Bs. " . number_format($res['t_debito'] + $res['t_credito'], 2, ',', '.'),
      );
      return $res;
   }
   public static function saveVoucher($id, $serie, $date, $observations, $amount)
   {
      $res = Db::getInstance()->Execute("UPDATE `" . _DB_PREFIX_ . "vouchers` SET `id_voucher_type`='$serie',`code`=(SELECT serie FROM " . _DB_PREFIX_ . "voucher_types WHERE id_voucher_type='$serie'),`number`=(SELECT MAX(number)+1 FROM " . _DB_PREFIX_ . "vouchers WHERE id_voucher_type='$serie'),`date`='$date',`amount`='$amount',`observations`='$observations',`op_status`='2',`created_at`=NOW(),`id_created_by`='" . Session::get('_uid') . "' WHERE id_voucher='" . $id . "'");
      return $res;
   }
}
