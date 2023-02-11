<?php
class Session
{

   public static function init()
   {
      session_start();
      // if (is_null(self::get('SESSION_TOKEN'))) {
      //    self::set('SESSION_TOKEN', Token::generate());
      //    EventHandler::generateConnection();
      // }
      // if (is_null(self::get('CURRENT_CONNECTION'))) {
      //    self::set('CURRENT_CONNECTION', EventHandler::getCurrentConnection());
      // }
   }
   public static function destroy($clave = false)
   {
      if ($clave) {
         if (is_array($clave)) {
            for ($i = 0; $i < count($clave); $i++) {
               if (isset($_SESSION[$clave][$i])) {
                  unset($_SESSION[$clave][$i]);
               }
            }
         } else {
            if (isset($_SESSION[$clave])) {
               unset($_SESSION[$clave]);
            }
         }
      } else {
         session_destroy();
      }
   }
   public static function set($clave, $valor)
   {
      $_SESSION[$clave] = $valor;
   }
   public static function get($clave)
   {
      if (isset($_SESSION[$clave])) {
         return $_SESSION[$clave];
      }
   }
   public static function isEmployee()
   {
      if (!is_null(self::get('IS_EMPLOYEE'))) {
         return self::get('IS_EMPLOYEE');
      }
      return false;
   }
}
