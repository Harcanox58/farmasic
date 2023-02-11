<?php
class Audit
{
   public static function trail(string $type, string $description, string $table = null, int $record = null)
   {
      $table = _DB_PREFIX_ . $table;
      Db::getInstance()->Execute("INSERT INTO " . _DB_PREFIX_ . "audit_trails (id_user,date,action_type,description,table_name,recordid) VALUES (?,NOW(),?,?,?,?)", [Session::get('_uid'), $type, $description, $table, $record]);
      $report = "[" . date("Y-m-d h:m:s") . "][" . strtoupper($type) . ": IN TABLE_NAME $table][RECORD_ID $record][BY " . Session::get('USERNAME') . "] $description\n";
      if (!is_dir(VAR_DIR . '/log')) {
         mkdir(VAR_DIR . '/log');
      }
      error_log($report, 3, VAR_DIR . '/log/'  . 'audit.log');
   }
}
