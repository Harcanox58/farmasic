<?php
class Support
{
   public static function countSupportTickets()
   {
      $sql = "SELECT COUNT(id_support_ticket) AS count FROM fs_support_tickets WHERE op_status <> 'C'";
      $res = Db::getInstance()->Execute($sql);
      if (!empty($res)) {
         return $res['count'];
      } else {
         return false;
      }
   }
   public static function sendTicket()
   {
      $sql = "INSERT INTO `fs_support_tickets`(`id_entity`, `sender`, `subject`, `message`, `op_status`) VALUES ('" . Session::get('_uid') . "','" . Tools::getValue('sender') . "','" . Tools::getValue('subject') . "','" . Tools::getValue('message') . "','A')";
      if (Db::getInstance()->Execute($sql)) {
         $body = 'Remitente: ' . Tools::getValue('sender') . ' Asunto: ' . Tools::getValue('subject') . ' Mensaje: ' . Tools::getValue('message');
         $num = Db::getInstance()->Execute("SELECT MAX(LPAD(id_support_ticket,6,'0')) as code FROM `fs_support_tickets`");
         Mailer::send(['cjoseare1995@gmail.com'], 'Ticket De Soporte #' . $num['code'], $body, ['no-reply@drovazca.com', 'Sistema Drovazca']);
         Mailer::send(['support@drovazca.com'], 'Ticket De Soporte #' . $num['code'], $body, ['no-reply@drovazca.com', 'Sistema Drovazca']);
         Tools::ajaxResponse(['response' => ['type' => 'success', 'message' => 'Mensaje Enviado.']]);
      } else {
         return false;
      }
   }
}
