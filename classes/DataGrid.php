<?php
class DataGrid
{
   public function generateGrid($header_grid, $row_headers, $source)
   {
      $html = '<div class="row">';
      $html .= '<div class="col-sm-12">';
      $html .= '<div class="card card-navy card-outline">';
      $html .= '<div class="card-body p-1">';
      $html .= '<table class="table table-sm table-striped dataTable dtr-inline">';
      $html .= '<thead class="bg-navy">';
      $html .= '<tr>';
      foreach ($header_grid as $header) {
         $html .= '<th class="' . (isset($header['class']) ? $header['class'] : '') . '">' . $header['label'] . '</th>';
      }
      $html .= '</tr>';
      $html .= '<tbody>';
      if (!empty($source)) {
         foreach ($this->fetchGrid($row_headers, $source) as $row) {
            $html .= '<tr>';
            $html .= $row;
            $html .= '</tr>';
         }
      }
      $html .= '</tbody>';
      $html .= '</table>';
      $html .= '</div>';
      $html .= '</div>';
      $html .= '</div> ';
      $html .= '</div>';
      return $html;
   }
   public function fetchGrid($headers, $source)
   {
      $rows = array();
      foreach ($source as $d) {
         $line = '';
         foreach ($headers as $head) {
            if (isset($head['type'])) {
               switch ($head['type']) {
                  case 'img':
                     if (!empty($d[$head['field']])) {

                        $line .=  '<td class="' . (isset($head['class']) ? $head['class'] : '') . '"><img src="' . $head['source'] . $d[$head['field']] . '" style="width: 70px;height: 70px;object-fit: contain;" /></td>';
                     } else {
                        $line .=  '<td class="' . (isset($head['class']) ? $head['class'] : '') . '"><img src="' . IMG_URI . 'empty.png" style="width: 70px;height: 70px;object-fit: contain;" /></td>';
                     }
                     break;
                  case 'link':
                     $line .=  '<td class="' . (isset($head['class']) ? $head['class'] : '') . '">';
                     for ($l = 0; $l < count($head['links']); $l++) {
                        $margin = '';
                        if ($l != 0) {
                           $margin = 'ml-1';
                        }
                        $action = '';
                        if (isset($head['links'][$l]['conditional'])) {
                           // print_r($head['links'][$l]['conditional']['operator']);
                           switch ($head['links'][$l]['conditional']['operator']) {
                              case '=':
                                 if ($d[$head['links'][$l]['conditional']['one']] == $head['links'][$l]['conditional']['two']) {
                                    $action = 'disabled';
                                 }
                                 break;
                              default:
                                 break;
                           }
                        }
                        if (defined("ADMIN_PATH")) {
                           $line .= (isset($head['links'][$l]['actionJS']) ? '<button tpye="button"  onclick="' . $head['links'][$l]['actionJS'] . '(' . (isset($head['links'][$l]['id']) ? $d[$head['links'][$l]['id']] : '') . ')" ' : '<a ') . (isset($head['links'][$l]['href']) ? ' href="' . Tools::baseUrl() . '?controller=' . $head['links'][$l]['href'] . '&id=' . $d[$head['links'][$l]['id']] . '&token=' . Tools::getValue('token')   : '') . '" class="' . $margin . ' ' . $action . ' btn btn-xs btn-default"><i class="' . (isset($head['links'][$l]['icon']) ? $head['links'][$l]['icon'] : '') . '"></i>' . (isset($head['links'][$l]['label']) ? $head['links'][$l]['label'] : '') . (isset($head['links'][$l]['actionJS']) ? '</button>' : '</a>');
                        } else {
                           $line .= '<a ' . (isset($head['links'][$l]['href']) ? 'href="' . Tools::baseUrl() . $head['links'][$l]['href'] . '&id=' . $d[$head['links'][$l]['id']] : '') . '" class="' . $margin . ' btn btn-xs btn-default"><i class="' . (isset($head['links'][$l]['icon']) ? $head['links'][$l]['icon'] : '') . '"></i>' . (isset($head['links'][$l]['label']) ? $head['links'][$l]['label'] : '') . '</a>';
                        }
                        // if (defined("ADMIN_PATH")) {
                        //    $line .= '<a href="' . (isset($head['links'][$l]['href']) ? Tools::baseUrl() . '?controller=' . $head['links'][$l]['href'] . '&id=' . $d[$head['links'][$l]['id']] . '&token=' . Tools::getValue('token')   : '') . '" class="' . (isset($head['links'][$l]['class']) ? $head['links'][$l]['class'] : '') . ' ' . $margin . ' btn btn-xs btn-default"><i class="' . (isset($head['links'][$l]['icon']) ? $head['links'][$l]['icon'] : '') . '"></i>' . (isset($head['links'][$l]['label']) ? $head['links'][$l]['label'] : '') . '</a>';
                        // } else {
                        //    $line .= '<a href="' . (isset($head['links'][$l]['href']) ? Tools::baseUrl() . $head['links'][$l]['href'] . '&id=' . $d[$head['links'][$l]['id']] : '') . '" class="' . (isset($head['links'][$l]['class']) ? $head['links'][$l]['class'] : '') . ' ' . $margin . ' btn btn-xs btn-default"><i class="' . (isset($head['links'][$l]['icon']) ? $head['links'][$l]['icon'] : '') . '"></i>' . (isset($head['links'][$l]['label']) ? $head['links'][$l]['label'] : '') . '</a>';
                        // }
                     }
                     // foreach ($head['links'] as $link) {
                     //    if (defined("ADMIN_PATH")) {
                     //       $line .= '<a href="' . (isset($link['href']) ? Tools::baseUrl() . '?controller=' . $link['href'] . '&id=' . $d[$link['id']] . '&token=' . Tools::getValue('token')   : '') . '" class="' . (isset($link['class']) ? $link['class'] : '') . '"><i class="' . (isset($link['icon']) ? $link['icon'] : '') . '"></i>' . (isset($link['label']) ? $link['label'] : '') . '</a>';
                     //    } else {
                     //       $line .= '<a href="' . (isset($link['href']) ? Tools::baseUrl() . $link['href'] . '&id=' . $d[$link['id']] : '') . '" class="' . (isset($link['class']) ? $link['class'] : '') . '"><i class="' . (isset($link['icon']) ? $link['icon'] : '') . '"></i>' . (isset($link['label']) ? $link['label'] : '') . '</a>';
                     //    }
                     // }
                     $line .= '</td>';
                     break;
                  case 'custom':
                     $vals = [];
                     foreach ($head['keys'] as $key => $value) {
                        $vals[$value] = $d[$value];
                     }
                     $out =  '<td class="' . (isset($head['class']) ? $head['class'] : '') . '">' . (isset($head['field']) ? $head['field'] : '') . '</td>';
                     foreach ($vals as $key => $value) {
                        $toSearch = '[@' . $key . ']';
                        $out = str_replace($toSearch, $value, $out);
                     }
                     $line .= $out;
                     break;
                  case 'switchJS':
                     $line .=  '<td class="' . (isset($head['class']) ? $head['class'] : '') . '">';
                     $line .= '<div class="custom-control custom-switch">';
                     $line .= '<input name="customSwitch" onchange="' . $head['actionJS'] . '(this,' . $d[$head['id']] . ')" value="' . $d[$head['field']] . '" type="checkbox" class="custom-control-input" ' . ($d[$head['field']] == 1 ? 'checked' : '') .  ' id="customSwitch' . $d[$head['id']] . '">';
                     $line .= '<label class="custom-control-label" for="customSwitch' . $d[$head['id']] . '"></label>';
                     $line .= '</div>';
                     $line .= '</td>';
                     break;
                  case 'two-lines':
                     $line .=  '<td class="' . (isset($head['class']) ? $head['class'] : '') . '"><span class="' . (isset($head['one']['class']) ? $head['one']['class'] : '') . '">' . $d[$head['one']['field']] . '</span><br><span class="' . (isset($head['two']['class']) ? $head['two']['class'] : '') . '">' . $d[$head['two']['field']] . '</span></td>';
                     break;
               }
            } else {
               $line .=  '<td class="' . (isset($head['class']) ? $head['class'] : '') . '">' . (isset($head['bg']) ? '<span class="badge bg-' . $d[$head['bg']] . '" style="font-size:90%">' : '') . $d[$head['field']] . '</span></td>';
            }
         }
         $rows[] = $line;
      }
      return $rows;
   }
}
