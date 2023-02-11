<?php
class Widgets
{
   public static function navTabs($items, $active = null, $controller = null)
   {
      if (isset($items)) {
         $html = '';
         $html .= '<ul class="nav navTabs">';
         for ($i = 0; $i < count($items); $i++) {
            $a = $active === $items[$i]['name'] ? 'active' : '';
            $html .= '<li class="nav-item"><a class="nav-link ' . $a . '" href="' . Tools::baseUrl() . $controller . '/' . $items[$i]['url'] . '">' . $items[$i]['name'] . '</a></li>';
         }
         $html .= '</ul>';
         return $html;
      }
   }
   public static function btnActions($btnActions)
   {
      $p = new Request();
      $html = '';
      $html .= '<ul class="nav">';
      if (isset($btnActions)) {
         foreach ($btnActions as $btn) {
            $color = isset($btn['color']) ? $btn['color'] : 'secondary';
            $icon = isset($btn['icon']) ? $btn['icon'] : '';
            $target = isset($btn['target']) ?  Tools::baseUrl() . $p->getControlador() . '/' . $btn['target'] : '"';
            $modalTarget = isset($btn['modalTarget']) ? $btn['modalTarget'] : '';
            $title = isset($btn['title']) ? $btn['title'] : '';
            $html .= '<li>';
            $html .= '<a href="' . $target . '"';
            if (isset($btn['modalTarget'])) {
               $html .= 'data-toggle="modal" data-target="#' . $modalTarget . '"';
            }
            $html .= 'class="btn btn-flat btn-' . $color . '"';
            // $html .= 'data-target="#' . isset($btn['modalTarget']) ? $btn['modalTarget'] . '"' : '"';
            // $html .= 'class="btn btn-' . isset($btn['color']) ? $btn['color'] : 'secondary' . ' btn-flat">';

            $html .= '><i class="' . $icon . '"></i> ' . $title;
            $html .= '</a>';
            $html .= '</li>';
         }
      }
      $html .= '</ul>';
      return $html;
   }
}
