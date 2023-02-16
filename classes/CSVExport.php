<?php
class CSVExport
{
   private static function  array2csv(array &$array)
   {
      if (count($array) == 0) {
         return null;
      }
      ob_start();
      $df = fopen("php://output", 'w');
      fputcsv($df, array_keys(reset($array)));
      foreach ($array as $row) {
         fputcsv($df, $row);
      }
      fclose($df);
      return ob_get_clean();
   }
   private static function download_send_headers($filename)
   {
      // disable caching
      $now = gmdate("D, d M Y H:i:s");
      header("Expires: Tue, 03 Jul 2001 06:00:00 GMT");
      header("Cache-Control: max-age=0, no-cache, must-revalidate, proxy-revalidate");
      header("Last-Modified: {$now} GMT");

      // force download  
      header("Content-Type: application/force-download");
      header("Content-Type: application/octet-stream");
      header("Content-Type: application/download");

      // disposition / encoding on response body
      header("Content-Disposition: attachment;filename={$filename}");
      header("Content-Transfer-Encoding: binary");
   }
   public static function generate($array, $filename = "data_export_")
   {
      self::download_send_headers($filename . date("Y-m-d") . ".csv");
      echo self::array2csv($array);
      die();
   }
}
