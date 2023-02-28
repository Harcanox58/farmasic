<?php
// require_once _LIBS_DIR_ . 'PHPMailer' . DS . 'PHPMailer.php';
// require_once _LIBS_DIR_ . 'PHPMailer' . DS . 'SMTP.php';
// require_once _LIBS_DIR_ . 'PHPMailer' . DS . 'Exception.php';
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

class Mailer
{
   public static function send(array $addresses, string $subject, string $body, array $sender = null, array $atthachments = null)
   {
      $mail = new PHPMailer(true);
      //Server settings
      $mail->SMTPDebug = SMTP::DEBUG_SERVER;                      //Enable verbose debug output
      $mail->isSMTP();                                            //Send using SMTP
      $mail->Host       = 'mail.drovazca.com';                     //Set the SMTP server to send through
      $mail->SMTPAuth   = true;                                   //Enable SMTP authentication
      $mail->Username   = 'no-reply@drovazca.com';                     //SMTP username
      $mail->Password   = 'HWqnxOL?Wn({';                               //SMTP password
      $mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;            //Enable implicit TLS encryption
      $mail->Port       = 465;
      $mail->CharSet = "UTF-8";
      for ($i = 0; $i < count($addresses); $i++) {
         $mail->addAddress($addresses[$i]);     //Add a sender
      }
      if (isset($sender)) {
         $mail->setFrom($sender[0], $sender[1]);
      } else {
         $host = $_SERVER['SERVER_NAME'];
         $com = $host == 'localhost' ? '.com' : '';
         $email = 'info@' . $host . $com;
         echo $email;
         $mail->setFrom($email, 'SISTEMA FARMASIC[DROVAZCA]');
      }
      $mail->isHTML(true);                                  //Set email format to HTML
      $mail->Subject = $subject;
      $mail->Body    = $body;
      // dev($mail);
      try {
         $mail->send();
         return true;
         // echo 'Message has been sent';
      } catch (\Throwable $th) {
         // throw $th;
         return false;
      }
   }
}
