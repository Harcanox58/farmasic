<?php
class CSVImport
{
  private static $csv;
  private static $filename;
  private static $line_separator;
  private static $value_separator;
  private static $table;
  private static $import_type;
  public static function loadCSV()
  {
    $rows   = array_map(
      function ($data) {
        return str_getcsv($data, self::$line_separator);
      },
      file(ROOT_DIR . '/uploads/' . self::$filename)
      // file(ROOT_DIR . '/uploads/' . 'products.csv')
    );
    $header = array_shift($rows);
    $csv    = [];
    foreach ($rows as $row) {
      $row = array_pad($row, count($header), "");
      $csv[] = array_combine($header, str_replace(self::$value_separator, ".", $row));
    }
    self::$csv = $csv;
    // echo '<pre>';
    // print_r($csv);
    // exit;
    return $csv;
  }
  public static function loadCSV_TEST()
  {
    $rows   = array_map(
      function ($data) {
        return str_getcsv($data, ',', '"');
      },
      file(ROOT_DIR . '/uploads/' . 'products_test.csv')
    );
    $header = array_shift($rows);
    $csv    = [];
    foreach ($rows as $row) {
      $row = array_pad($row, count($header), "");
      $csv[] = array_combine($header, str_replace(self::$value_separator, ".", $row));
    }
    // self::$csv = $csv;
    // return $csv;
  }
  public static function rowsInsert()
  {
    $data = self::$csv;
    $rows = [];
    foreach ($data as $key => $value) {
      $rows[] = "('" . implode("','", array_slice($value, 1)) . "')";
    }
    // echo '<pre>';
    // print_r($rows);
    // exit;
    return implode(",", $rows);
  }
  public static function rowUpdate()
  {
    $data = self::$csv;
    $rows = [];
    for ($i = 0; $i < count($data); $i++) {
      $row = [];
      foreach ($data[$i] as $key => $value) {
        $row[] = $key . "='" . $value . "'";
      }
      $clean = $row;
      $clean = array_slice($clean, 1);
      $rows[] = 'UPDATE ' . self::$table . ' SET ' . implode(",", $clean) . ' WHERE ' . array_values($row)[0];
    }
    return $rows;
  }
  public static function Execute($function, $line_separator = ';', $value_separator = ',', $forceID = false)
  {
    Tools::fileUpload('fileAttach', ROOT_DIR . '/uploads/');
    self::$filename = Tools::getValue('fileAttach')['name'];
    self::$line_separator = $line_separator;
    self::$value_separator = $value_separator;
    self::loadCSV();
    switch ($function) {
      case 'P':
        self::$import_type = 'Productos';
        self::$table = 'fs_products';
        break;
      case 'CAT':
        self::$import_type = 'Categorías';
        self::$table = 'fs_categories';
        break;
      case 'B':
        self::$import_type = 'Marcas';
        self::$table = 'fs_brands';
        break;
      case 'CL':
        self::$import_type = 'Clientes';
        self::$table = 'fs_entities';
        break;
      case 'S':
        self::$import_type = 'Proveedores';
        self::$table = 'fs_entities';
        break;
      case 'PC':
        self::$import_type = 'Productos a Comparar';
        self::$table = 'fs_comparator';
        break;
    }
    if (!$forceID) {
      $sql = "INSERT INTO " . self::$table . ' ' . self::insertFields() . ' VALUES ' . self::rowsInsert();
    } else {
      $sql = implode(';', SELF::rowUpdate());
    }
    // print_r($sql);
    try {
      Db::getInstance()->Execute($sql);
      Tools::ajaxResponse(['response' => ['type' => 'success', 'message' => 'Datos importados exitosamente.']]);
      if (Tools::getValue('emailNotify')) {
        Mailer::send([Configuration::get('EMAIL_MAIN'), 'soporte@drovazca.com'], 'Importación Finalizada', '[' . date('d-m-Y') . '][' . date('g:i a') . '] El proceso de importación de ' . self::$import_type . ' ha finalizado', ['no-reply@drovazca.com', 'Sistema FARMASIC[Drovazca]']);
      }
    } catch (Exception $e) {
      Tools::ajaxResponse(['response' => ['type' => 'error', 'message' => 'Error al importar los datos.']]);
    }
  }
  public static function insertFields()
  {
    $fields = '';
    switch (self::$table) {
      case 'fs_products':
        $fields = "(`id_brand`, `id_category`, `id_tax`, `id_active_compound`, `id_discount`, `id_supplier`, `ref`, `name`, `short_description`, `description`, `code`, `bar_code`, `price_cost`, `price`, `price_unit`, `price_unit_usd`, `price_usd`, `price_suggested`, `price_suggested_usd`, `net_price`, `net_price_usd`, `img_name`, `min_sell`, `max_sell`, `multiple_sell`, `units_per_pack`, `codisb`, `expire_at`, `created_at`, `profit_margin`, `is_active`, `is_regulated`, `is_featured`, `op_status`) VALUES ";
        break;
      case 'fs_categories':
        $fields = '(`name`, `img`, `is_active`, `is_deleted`, `num_order`)';
        break;
      case 'fs_brands':
        $fields = '(`name`, `img`, `op_status`)';
        break;
      case 'fs_entities':
        $fields = '(`id_role`, `dni`, `code`, `company_name`, `firstname`, `lastname`, `username`, `email`, `password`, `address`, `trade_discount`, `credit_limit`, `credit_time`, `contact_person`, `phone`, `op_city`, `op_state`, `op_country`, `last_connection`, `date_creation`, `is_active`, `is_deleted`, `op_status`)';
        break;
      case 'fs_comparator':
        $fields = '(`product_name`, `provider`, `price`, `price_usd`)';
        break;
    }
    return $fields;
  }
}
