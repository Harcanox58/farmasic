<?php
class ClassSmarty extends Smarty
{
   private static $instance;

   private function __construct()
   {
      parent::__construct();
      $this->setTemplateDir(VAR_DIR . 'cache/');
      $this->setCompileDir(VAR_DIR . 'cache/');
      $this->setConfigDir(VAR_DIR . 'cache/');
      $this->setCacheDir(VAR_DIR . 'cache/');
   }
   public static function getInstance()
   {
      if (!self::$instance instanceof self) {
         try {
            self::$instance = new self;
            self::$instance->clearAllCache();
         } catch (\Exception $ex) {
            throw new Exception("Error Processing Instance Smarty", 1);
         }
      }
      return self::$instance;
   }
   public function setVal($k, $v)
   {
      $asn = self::$instance->assign($k, $v);
      return $asn;
   }
   public function Deploy($v)
   {
      $ft = self::$instance->display($v);
      return $ft;
   }
   public function setFunction($n, $f)
   {
      $function = self::$instance->register_function($n, $f);
      return $function;
   }
}
