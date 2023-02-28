<?php
class HelperFormbk2
{
   public $submit_action, $form_type = 'form-ajax', $method = 'POST', $field_vals, $size = 12, $label_size = 4;
   public $formTabs;
   public function addTab($title, $content, $active = false)
   {
      $this->formTabs[] = array('title' => $title, 'content' => $content, 'active' => $active, 'form_type' => $this->form_type);
   }
   public function generateTabForm()
   {

      $tabs = '<ul class="nav nav-tabs" id="custom-tabs-four-tab" role="tablist">';
      foreach ($this->formTabs as $tab) {
         $id = strtolower(str_replace(' ', '-', $tab['title'])) . '-tab';
         $tabs .= '<li class="nav-item">
            <a class="nav-link ' . (isset($tab['active']) && $tab['active'] == true ? 'active' : '') . '" data-toggle="pill" href="#' . $id . '">' . strtoupper($tab['title']) . '</a>
         </li>';
      }
      $tabs .= '</ul>';
      return $tabs;
   }
   public function generateContentForm()
   {
      $content = '<form class="mb-2 mt-2" action="' . $this->submit_action . '" method="' . $this->method . '">';
      $content = '<div class="tab-content">';

      foreach ($this->formTabs as $tab) {
         $id = strtolower(str_replace(' ', '-', $tab['title'])) . '-tab';
         $content .= '<div class="tab-pane fade ' . (isset($tab['active']) && $tab['active'] == true ? 'active show' : '') . '" id="' . $id . '" role="tabpanel">';
         $content .= '<div class="row">';
         foreach ($tab['content'] as $input) {
            if ($this->form_type == 'grid') {
               $content .= '<div class="' . (isset($input['col']) ? 'col-' . $input['col'] : '') . '" >';
            } else {
               $content .= '<div class="form-group container">';
            }
            $content .= $this->generateInput($input);

            $content .= '</div>';
         }
         $content .= '</div>';
         $content .= '</div>';
      }
      $content .= '</from>';
      $content .= '</div>';
      return $content;
   }
   public function generateFormTab()
   {
      $form = '<div class="card card-primary card-outline card-outline-tabs">';
      $form .= '<div class="card-header p-0 border-bottom-0">';
      $form .= $this->generateTabForm();
      $form .= '</div>';
      $form .= '<div class="card-body">';
      $form .= $this->generateContentForm();
      $form .= '</div>';
      $form .= '</div>';
      return $form;
   }
   public static function fileUpload(string $inputName, string $target_dir = null, $extenxions = null, int $maxSize = null)
   {
      $target_dir = "uploads/";
      $target_file = $target_dir . basename($_FILES[$inputName]["name"]);
      $imageFileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));
      if (file_exists($target_file)) {
         unlink($target_file);
      }
      if ($_FILES[$inputName]["size"] < 500000) {
         if (isset($extenxions)) {
            $uploadOk = '';
            if (is_array($extenxions)) {
               foreach ($extenxions as $ext) {
                  if ($imageFileType == $ext) {
                     $uploadOk = 1;
                     break;
                  } else {
                     $uploadOk = 0;
                     echo 'extencion no valida';
                  }
               }
            } else {
               if ($imageFileType != $extenxions) {
                  $uploadOk = 0;
               } else {
                  $uploadOk = 1;
               }
            }
            if ($uploadOk == 1) {
               if (move_uploaded_file($_FILES[$inputName]["tmp_name"], $target_file)) {
                  return true;
               }
               echo 'no subida';
               return false;
            }
         }
         return false;
      }
   }
   public function vals($field)
   {
      if (!empty($this->field_vals)) {
         if (array_key_exists($field, $this->field_vals)) {
            return $this->field_vals[$field];
         } else {
            return '';
         }
      }
   }
   public function generateInput($input)
   {
      $html = '';
      $i = $input;
      switch ($i['type']) {
         case 'switch':
            $html .= '<div class="row form-group">';
            $html .= $this->generateLabel($i);
            $html .= '<div class="' . (isset($i['col']) && $i['col'] == true ? 'col-' . $i['col'] : 'col-4') . '">';
            $html .= '<div class="custom-control custom-switch">';
            $html .= '<input ' . (isset($i['disabled']) && $i['disabled'] == true ? 'disabled' : '') . ' type="checkbox" class="custom-control-input" id="customSwitch1" name="' . $i['name'] . '" ' . (isset($i['required']) && $i['required'] == true ? 'required' : '') . '>';
            $html .= '<label class="custom-control-label" for="customSwitch1"></label>';
            $html .= '</div>';
            $html .= '</div>';
            $html .= '</div>';
            break;
         case 'select':
            $html .= '<div class="row form-group">';
            $html .= $this->generateLabel($i);
            $html .= '<div class="' . (isset($i['col']) && $i['col'] == true ? 'col-' . $i['col'] : 'col-4') . '">';
            $html .= '<select ' . (isset($i['disabled']) && $i['disabled'] == true ? 'disabled' : '') . ' class="select2 form-control form-control-sm ' . (isset($i['class']) ? $i['class'] : '') . '" id="' . $i['name'] . '" value="' . $this->vals($i['name']) . '" name="' . $i['name'] . '" ' . (isset($i['required']) && $i['required'] == true ? 'required' : '') . '>';
            if (isset($i['options']) && !empty($i['options'])) {
               foreach ($i['options'] as $option) {
                  $html .= '<option value="-1"></option>';
                  if ($this->vals($i['name']) == $option['value']) {
                     $html .= '<option value="' . $option['value'] . '" selected="selected">' . $option['label'] . '</option>';
                  } elseif ($this->vals($i['name']) != $option['value']) {
                     $html .= '<option value="' . $option['value'] . '">' . $option['label'] . '</option>';
                  }
               }
            }
            $html .= '</select>';
            $html .= '</div>';
            $html .= '</div>';
            break;
         case 'textarea':
            $html .= '<div class="row form-group">';
            $html .= $this->generateLabel($i);
            $html .= '<div class="' . (isset($i['col']) && $i['col'] == true ? 'col-' . $i['col'] : 'col-4') . '">';
            $html .= '<textarea ' . (isset($i['disabled']) && $i['disabled'] == true ? 'disabled' : '') . ' class="form-control form-control-sm ' . (isset($i['class']) ? $i['class'] : '') . '" id="' . $i['name'] . '" name="' . $i['name'] . '" ' . (isset($i['required']) && $i['required'] == true ? 'required' : '') . ' style="resize:none">' . $this->vals($i['name']) . '</textarea>';
            $html .= '</div>';
            $html .= '</div>';
            break;
         case 'file':
            $html .= '<div class="row form-group">';
            $html .= $this->generateLabel($i);
            if ($this->vals($i['name'])) {
               $html .= '<div class="' . (isset($i['col']) && $i['col'] == true ? 'col-' . $i['col'] : 'col-4') . '">';
               $html .= '<img id="reloadIMG" class="figure-img img-thumbnail" src=' . (isset($i['save_path']) ? $i['save_path'] . $this->vals($i['name']) : '') . ' style="max-width:300px" /> <br>';
               $html .= '<p class="text-gray mb-1">Tamaño del Archivo </p>';
               $html .= '<a class="btn btn-danger btn-sm"><i class="fas fa-trash mr-1"></i>Eliminar</a>';
               $html .= '</div>';
               $html .= '<div class="col-4"></div>';
            }
            $html .= '<div class="' . (isset($i['col']) && $i['col'] == true ? 'col-' . $i['col'] : 'col-4') . '">';
            $html .= '<input ' . (isset($i['disabled']) && $i['disabled'] == true ? 'disabled' : '') . ' type="' . $i['type'] . '" class="form-control-file form-control-sm ' . (!empty($this->vals($i['name'])) ? 'p-0 mt-3' : '') . (isset($i['class']) ? $i['class'] : '') . '" id="' . $i['name'] . '" name="' . $i['name'] . '" value="' . ($i['type'] == 'date' && !empty($this->vals($i['name']))  ?  date("Y-m-d", strtotime($this->vals($i['name']))) : $this->vals($i['name'])) . '" placeholder="" ' . (isset($i['required']) && $i['required'] == true ? 'required' : '') . ' accept="';
            foreach ($i['ext'] as $e) {
               $html .= $e . ',';
            }
            $html .= '">';
            $html .= '</div>';
            $html .= '</div>';
            break;
         case 'money':
            $html .= '<div class="row form-group">';
            $html .= $this->generateLabel($i);
            $html .= '<div class="' . (isset($i['col']) && $i['col'] == true ? 'col-' . $i['col'] : 'col-4') . '">';
            $html .= '<input ' . (isset($i['disabled']) && $i['disabled'] == true ? 'disabled' : '') . ' type="' . $i['type'] . '" class="form-control form-control-sm ' . (isset($i['class']) ? $i['class'] : '') . ' ' . (isset($i['currency']) && $i['currency'] == 'USD' ? 'money-usd' : 'money-format') . '" id="' . $i['name'] . '" name="' . $i['name'] . '" value="' . str_replace('.', ',', $this->vals($i['name'])) . '" placeholder="" ' . (isset($i['required']) && $i['required'] == true ? 'required' : '') . '>';
            $html .= '</div>';
            $html .= '</div>';
            break;
         default:
            $html .= '<div class="row form-group">';
            $html .= $this->generateLabel($i);
            $html .= '<div class="' . (isset($i['col']) && $i['col'] == true ? 'col-' . $i['col'] : 'col-4') . '">';
            $html .= '<input ' . (isset($i['disabled']) && $i['disabled'] == true ? 'disabled' : '') . ' type="' . $i['type'] . '" class="form-control form-control-sm ' . (isset($i['class']) ? $i['class'] : '') . '" id="' . $i['name'] . '" name="' . $i['name'] . '" value="' . ($i['type'] == 'date' && !empty($this->vals($i['name']))  ?  date("Y-m-d", strtotime($this->vals($i['name']))) : $this->vals($i['name'])) . (isset($i['value']) ? $i['value'] : '') . '" placeholder="" ' . (isset($i['required']) && $i['required'] == true ? 'required' : '') . '>';
            $html .= '</div>';
            $html .= '</div>';
            break;
      }
      return $html;
   }
   public function generateLabel($i)
   {
      $html = '<label class="col-' . $this->label_size . ' col-form-label float-end text-right" for="' . $i['name'] . '">' . (isset($i['required']) && $i['required'] == true ? '<span class="text-danger">*</span> ' : '') .  $i['label'] . '</label>';
      return $html;
   }
   public function generateForm(array $form)
   {

      $formHtml = '';
      if (defined('ADMIN_PATH')) {
         $formHtml .= '<form class="' . $this->form_type . '" target="' . Tools::baseUrl() . '?controller=' . $this->submit_action . (!empty(Tools::getValue('id')) ? '&id=' . Tools::getValue('id') : '') . '&token=' . Tools::getValue('token') . '" method="' . $this->method . '" enctype="multipart/form-data">';
      } else {
         $formHtml .= '<form class="' . $this->form_type . '" target="' . Tools::baseUrl() . $this->submit_action . (!empty(Tools::getValue('id')) ? '&id=' . Tools::getValue('id') : '') . '" method="' . $this->method . '" enctype="multipart/form-data">';
      }
      $formHtml .= '<div class="card col-12 card-navy card-outline">';
      if (isset($form['legend'])) {
         $formHtml .= $this->formHeader($form['legend']);
      }
      if (isset($form['input'])) {
         $formHtml .= '<div class="card-body">';
         foreach ($form['input'] as $input) {
            $formHtml .= $this->generateInput($input);
         }
         $formHtml .= '</div>';
      }
      if (isset($form['submit'])) {
         $formHtml .= $this->formSubmit($form['submit']);
      }
      $formHtml .= '</div>';
      $formHtml .= '</form>';
      return $formHtml;
   }
   public function formSubmit($submit)
   {
      $html = '<div class="card-footer">';
      $html .= '<div class="row">';
      $html .= '<div class="col-12 d-flex justify-content-between">';
      $html .= '<button type="button" onclick="history.back()" class="btn btn-default"><i class="fas fa-times"></i><br>Cancelar</button>';
      $html .= '<button type="submit" onclick="sendFormAJAX()" class="btn float-end btn-primary"><i class="fas fa-save mb-1"></i><br>' . (isset($submit['title']) ? $submit['title'] : '') . '</button>';
      $html .= '</div>';
      $html .= '</div>';
      $html .= '</div>';
      return $html;
   }
   public function formHeader($legend)
   {
      if (isset($legend['title'])) {
         $header = '<div class="card-header">';
         $header .= '<h3 class="card-title"><i class="mr-1 ' . (isset($legend['icon']) ? $legend['icon'] : '') . '"></i> ' . $legend['title'] . '</h3>';
         $header .= '</div>';
         return $header;
      } else {
         return '';
      }
   }
}
