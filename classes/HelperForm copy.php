<?php
class HelperFormold
{
   public $submit_action, $form_type, $method = 'POST';
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
   public function generateInput($input)
   {
      $html = '';
      $i = $input;
      switch ($i['type']) {
         case 'switch':
            $html .= '<label for="' . $i['name'] . '">' . $i['label'] . '</label>';
            $html .= '<div class="custom-control custom-switch">';
            $html .= '<input ' . (isset($i['disabled']) && $i['disabled'] == true ? 'disabled' : '') . ' type="checkbox" class="custom-control-i" id="customSwitch1" name="' . $i['name'] . '" ' . (isset($i['required']) && $i['required'] == true ? 'required' : '') . '>';
            $html .= '<label class="custom-control-label" for="customSwitch1"></label>';
            $html .= '</div>';
            break;
         case 'select':
            $html .= '<label for="' . $i['name'] . '">' . $i['label'] . '</label>';
            $html .= '<select ' . (isset($i['disabled']) && $i['disabled'] == true ? 'disabled' : '') . ' class="select2 form-control form-control-sm" id="' . $i['name'] . '" name="' . $i['name'] . '" ' . (isset($i['required']) && $i['required'] == true ? 'required' : '') . '>';
            foreach ($i['values'] as $option) {
               $html .= '<option value="' . $option['value'] . '">' . $option['label'] . '</option>';
            }
            $html .= '</select>';
            break;
         case 'textarea':
            $html .= '<label for="' . $i['name'] . '">' . $i['label'] . '</label>';
            $html .= '<textarea ' . (isset($i['disabled']) && $i['disabled'] == true ? 'disabled' : '') . ' class="form-control form-control-sm" id="' . $i['name'] . '" name="' . $i['name'] . '" ' . (isset($i['required']) && $i['required'] == true ? 'required' : '') . ' style="resize:none">' . (isset($i['value']) ? $i['value'] : '') . '</textarea>';
            break;
         default:
            $html .= '<label for="' . $i['name'] . '">' . $i['label'] . '</label>';
            $html .= '<input ' . (isset($i['disabled']) && $i['disabled'] == true ? 'disabled' : '') . ' type="' . $i['type'] . '" class="form-control form-control-sm" id="' . $i['name'] . '" name="' . $i['name'] . '" value="' . $i['values'] . '" placeholder="" ' . (isset($i['required']) && $i['required'] == true ? 'required' : '') . '>';
            break;
      }
      return $html;
   }
   public function generateForm(array $form)
   {
      // echo '<pre>';
      // print_r($form);
      $formHtml = '<div class="card">';
      $formHtml .= '<div class="card-header">';
      $formHtml .= '<h3 class="card-title"><span class="' . $form['legend']['icon'] . '"></span> ' . $form['legend']['title'] . '</h3>';
      $formHtml .= '<div class="card-body">';
      $formHtml .= '<form class="mb-2 mt-2" action="' . $this->submit_action . '" method="' . $this->method . '">';
      // print_r($$form['input']);
      if ($this->form_type == 'grid') {
         $formHtml .= '<div class="row">';
      }
      // $formHtml .= '<div class="row">';
      foreach ($form['input'] as $input) {
         if ($this->form_type == 'grid') {
            $formHtml .= '<div class="' . (isset($input['col']) ? 'col-' . $input['col'] : '') . '" >';
         } else {
            $formHtml .= '<div class="form-group container">';
         }

         switch ($input['type']) {
            case 'switch':
               $formHtml .= '<label for="' . $input['name'] . '">' . $input['label'] . '</label>';
               $formHtml .= '<div class="custom-control custom-switch">';
               $formHtml .= '<input ' . (isset($input['disabled']) && $input['disabled'] == true ? 'disabled' : '') . ' type="checkbox" class="custom-control-input" id="customSwitch1" name="' . $input['name'] . '" ' . (isset($input['required']) && $input['required'] == true ? 'required' : '') . '>';
               $formHtml .= '<label class="custom-control-label" for="customSwitch1"></label>';

               // $formHtml .= '<input type="checkbox" class="custom-control-input" id="' . $input['name'] . '" name="' . $input['name'] . '" ' . ($input['is_bool'] ? 'checked' : '') . '>';
               // $formHtml .= '<label for="' . $input['name'] . '">' . $input['label'] . '</label>';
               $formHtml .= '</div>';
               break;
            case 'select':
               $formHtml .= '<label for="' . $input['name'] . '">' . $input['label'] . '</label>';
               $formHtml .= '<select ' . (isset($input['disabled']) && $input['disabled'] == true ? 'disabled' : '') . ' class="select2 form-control form-control-sm" id="' . $input['name'] . '" name="' . $input['name'] . '" ' . (isset($input['required']) && $input['required'] == true ? 'required' : '') . '>';
               foreach ($input['values'] as $option) {
                  $formHtml .= '<option value="' . $option['value'] . '">' . $option['label'] . '</option>';
               }
               $formHtml .= '</select>';
               break;
            case 'textarea':
               $formHtml .= '<label for="' . $input['name'] . '">' . $input['label'] . '</label>';
               $formHtml .= '<textarea ' . (isset($input['disabled']) && $input['disabled'] == true ? 'disabled' : '') . ' class="form-control form-control-sm" id="' . $input['name'] . '" name="' . $input['name'] . '" ' . (isset($input['required']) && $input['required'] == true ? 'required' : '') . '>' . (isset($input['value']) ? $input['value'] : '') . '</textarea>';
               break;
            default:
               $formHtml .= '<label for="' . $input['name'] . '">' . $input['label'] . '</label>';
               $formHtml .= '<input ' . (isset($input['disabled']) && $input['disabled'] == true ? 'disabled' : '') . ' type="' . $input['type'] . '" class="form-control form-control-sm" id="' . $input['name'] . '" name="' . $input['name'] . '" value="' . $input['values'] . '" placeholder="" ' . (isset($input['required']) && $input['required'] == true ? 'required' : '') . '>';
               break;
         }

         $formHtml .= '</div>';
      }
      if ($this->form_type == 'grid') {
         $formHtml .= '</div>';
      }
      $formHtml .= '<div class="row mt-2 d-flex justify-content-end">';
      $formHtml .= '<button type="submit" class="btn ' . $form['submit']['class'] . ' btn-sm "><span class="' . $form['submit']['icon'] . '"></span> ' . $form['submit']['title'] . '</button>';
      $formHtml .= '</div>';
      $formHtml .= '</form>';
      $formHtml .= '</div>';
      $formHtml .= '</div>';
      $formHtml .= '</div>';
      // exit;
      // $formHtml = '<form action="' . $this->submit_action . '" method="' . $form['method'] . '">';
      // foreach ($form['input'] as $field) {
      //    $formHtml .= '<div class="form-group">';
      //    $formHtml .= '<label for="' . $field['name'] . '">' . $field['label'] . '</label>';
      //    $formHtml .= '<input type="' . $field['type'] . '" class="form-control" id="' . $field['name'] . '" name="' . $field['name'] . '" placeholder="' . $field['placeholder'] . '">';
      //    $formHtml .= '</div>';
      // }
      // $formHtml .= '<button type="submit" class="btn btn-primary">Submit</button>';
      // $formHtml .= '</form>';
      return $formHtml;
   }
}
