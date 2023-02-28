<?php

class Controller
{
   private $_peticion;
   protected $layout, $calls, $title, $assets, $tamplate, $theme_dir, $controller_type, $responseType, $responseMessage;

   public function __construct()
   {
      $this->_peticion = new Request();
      if (defined('ADMIN_DIR')) {
         $this->theme_dir = THEME_ADMIN_DIR;
         $this->assets = Tools::baseUrl()  . 'themes/classic/assets/';
         ClassSmarty::getInstance()->setVal('baseUrl', Tools::baseUrl());
      } else {
         $this->theme_dir = THEME_DIR;
         $this->assets = Tools::baseUrl() . 'themes/classic/assets/';
         ClassSmarty::getInstance()->setVal('baseUrl', Tools::baseUrl());
      }
      if (!$this->layout) {
         $this->layout = _DEFAULT_LAYOUT_;
      }
   }

   protected function render($template, $dataTransfer = null)
   {


      if (is_array($dataTransfer)) {
         foreach ($dataTransfer as $k => $v) {
            ClassSmarty::getInstance()->setVal($k, $v);
         }
      }
      ClassSmarty::getInstance()->setVal(
         'urls',
         array(
            'base' => Tools::baseUrl(),
            'products' => PROD_URI,
            'categories' => CAT_URI,
            'assets' => $this->assets,
         )
      );
      ClassSmarty::getInstance()->setVal(
         'template',
         array(
            'title' => $this->title,
            'active' => true,
            'callActions' => $this->calls,
         )
      );
      // ClassSmarty::getInstance()->setVal('callActions', $this->calls);
      // ClassSmarty::getInstance()->setVal('navTabs', Widgets::navTabs($this->navTabs, $this->tabActive, $this->_peticion->getControlador()));
      if (defined('ADMIN_DIR')) {
         ClassSmarty::getInstance()->setVal('menuBack', $this->getSideBarMenu('A'));
      } else {
         ClassSmarty::getInstance()->setVal('menuFront', $this->getSideBarMenu());
      }
      ClassSmarty::getInstance()->setVal('url', Tools::baseUrl());
      // $rutaLayout = APP_DIR . 'views' . DS . 'layouts' . DS . $this->layout . '.tpl';
      // echo $rutaLayout;
      ClassSmarty::getInstance()->setVal('content', $this->theme_dir . 'templates/' . $template . '.tpl');
      // $this->_Smarty->assign('templateParams', $templateParams);
      ClassSmarty::getInstance()->setVal('javascripts', Tools::findFilesToUrl($this->theme_dir  . 'assets/js', array('js')));
      ClassSmarty::getInstance()->setVal('stylesheets', Tools::findFilesToUrl($this->theme_dir  . 'assets/css', array('css')));

      ClassSmarty::getInstance()->setVal(
         'js',
         Tools::findFilesToUrl(CURRENT_DIR  . '/js', array('js'))
      );
      $rutaLayout = $this->theme_dir . 'templates/' . $this->layout . '.tpl';
      if (is_readable($rutaLayout)) {
         ClassSmarty::getInstance()->Deploy($rutaLayout);
      } else {
         CodeException('Vista no Encontrada <br>' . $rutaLayout);
      }
   }

   protected function methodPost($clave)
   {
      if (isset($_POST[$clave]) && !empty($_POST[$clave])) {
         // $_POST[$clave]=htmlspecialchars($_POST[$clave],END_QUOTES);
         return trim($_POST[$clave]);
      }
      return '';
   }
   // public function getSideBarMenu()
   // {
   //    $items = Db::getInstance()->ExecuteS("SELECT * FROM fs_menu_items as i WHERE i.menu_type='F'");
   //    $html = '';
   //    foreach ($items as $item) {
   //       $html .= '<li class="nav-item">';
   //       $html .= ' <a href="' . Tools::baseUrl() . $item['item_link'] . '" class="nav-link">';
   //       $html .= ' <i class="nav-icon ' . $item['item_icon'] . '"></i>';
   //       $html .= ' <p>';
   //       $html .= $item['item_name'];
   //       $html .= ' </p>';
   //       $html .= '</a>';
   //       $html .= ' </li>';
   //    }
   //    return $html;
   //    // echo "<pre>";
   //    // print_r($items);
   // }
   public function getSideBarMenu(string $type = 'F')
   {
      $items = Db::getInstance()->ExecuteS("SELECT * FROM `fs_menu_items` as m WHERE type='" . $type . "' AND m.is_child=0 AND m.is_active=1 ORDER BY num_order ASC;");
      $html = '';
      foreach ($items as $item) {
         if ($item['is_parent'] <> 0) {
            $subitems = Db::getInstance()->ExecuteS("SELECT * FROM `fs_menu_items` as m WHERE type='" . $type . "' AND m.is_child='1' AND id_parent='" . $item['id_menu_item'] . "' AND m.is_active='1' ORDER BY	num_order ASC;");
            if (Acl::check($item['permission_name'])) {
               $html .= '<li class="nav-item">';
               $html .= '<a href="#" class="nav-link">';
               $html .= ' <i class="text-md nav-icon ' . $item['icon'] . '"></i>';
               $html .= '      <p class="text-xs">';
               $html .= $item['name'];
               $html .= '         <i class="right fas fa-angle-left"></i>';
               $html .= '      </p>';
               $html .= '   </a>';
               $html .= '   <ul class="nav nav-treeview">';
               foreach ($subitems as $item) {
                  if (Acl::check($item['permission_name'])) {
                     $html .= '      <li class="nav-item">';
                     if ($type == 'F') {
                        $html .= '         <a href="' . Tools::baseUrl() . $item['link'] . '" class="nav-link">';
                     } else {
                        $html .= '         <a href="' . Tools::baseUrl()  . '?controller=' . $item['link'] . '&token=' . Tools::getValue('token') . '" class="nav-link {if isset($template.active)}{$template.active}{/if}">';
                     }
                     // $html .= ' <i class="text-sm nav-icon ' . $item['icon'] . '"></i>';
                     $html .= ' <p class="text-xs">';
                     $html .= $item['name'];
                     $html .= ' </p>';
                     $html .= '         </a>';
                     $html .= '      </li>';
                  }
               }
               $html .= '   </ul>';
               $html .= '</li>';
            }
         } elseif ($item['is_header'] <> 0) {
            $html .= '<li class="nav-header text-xs"><b style="text-transform: uppercase;">' . $item['name'] . '</b></li>';
         } else {
            if (Acl::check($item['permission_name'])) {
               $html .= '<li class="nav-item">';
               if ($type == 'F') {
                  $html .= '<a href="' . Tools::baseUrl() . $item['link'] . '" class="nav-link text-sm">';
               } else {
                  $html .= ' <a href="' . Tools::baseUrl()  . '?controller=' . $item['link'] . '&token=' . Tools::getValue('token') . '" class="nav-link">';
               }
               $html .= ' <i class="text-md nav-icon ' . $item['icon'] . '"></i>';
               $html .= ' <p class="text-xs">';
               $html .= $item['name'];
               $html .= ' </p>';
               $html .= '</a>';
               $html .= ' </li>';
            }
         }
      }
      if ($type == 'F') {
         $html .= '<li class="nav-item"><a href="#" class="nav-link text-xs" data-toggle="modal" data-target="#modal-lg"><span class="nav-icon fas fa-life-ring"></span> Soporte Técnico</a></li>';
      }
      return $html;
      // echo "<pre>";
      // print_r($items);
   }
   protected function methodGet($int)
   {
      $int = (int) $int;
      if (is_int($int)) {
         return $int;
      } else {
         return 0;
      }
   }
   protected function isAjaxRequest()
   {
      return !empty($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest';
   }
   protected function ajaxResponse($arr)
   {
      header('Content-Type: application/json');
      echo json_encode($arr);
   }
   protected function ajaxRedirect(string $target)
   {
      if (defined('ADMIN_DIR')) {
         $arr = array('redirect' => Tools::baseUrl()  . '?controller=' . $target . '&token=' . Tools::getValue('token'));
      } else {
         $arr = array('redirect' => Tools::baseUrl() . $target);
      }
      header('Content-Type: application/json');
      echo json_encode($arr);
   }
   protected function ajaxRedirectTo(string $target)
   {
      if (defined('ADMIN_DIR')) {
         $rute = Tools::baseUrl()  . '?controller=' . $target . '&token=' . Tools::getValue('token');
      } else {
         $rute =  Tools::baseUrl() . $target;
      }
      return $rute;
   }
   public function loadModel($model)
   {
      $model = strtolower($model) . 'Model';
      $rutaModel = ROOT_DIR . '/src/models/'  . $model . '.php';
      if (is_readable($rutaModel)) {
         require_once $rutaModel;
         $model = new $model;
         return $model;
      } else {
         CodeException('No se puede cargar el modelo "' . $model . '"');
      }
   }
   protected function isSubmit()
   {
      if (isset($_POST) && !empty($_POST))
         return true;
      return false;
   }
   protected function returnVars()
   {
      return $_POST;
   }
   public static function redirect($route = false)
   {
      if ($route) {
         header("location:" . Tools::baseUrl() . $route);
         exit();
      } else {
         header("location:" . Tools::baseUrl());
         exit();
      }
   }
}
