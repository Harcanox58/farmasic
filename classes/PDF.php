<?php
// require '../config/config.inc.php';

use Fpdf\Fpdf;

class PDF extends Fpdf
{
  // private variables
  var $colonnes;
  var $format;
  var $angle = 0;

  // private functions
  function RoundedRect($x, $y, $w, $h, $r, $style = '')
  {
    $k = $this->k;
    $hp = $this->h;
    if ($style == 'F')
      $op = 'f';
    elseif ($style == 'FD' || $style == 'DF')
      $op = 'B';
    else
      $op = 'S';
    $MyArc = 4 / 3 * (sqrt(2) - 1);
    $this->_out(sprintf('%.2F %.2F m', ($x + $r) * $k, ($hp - $y) * $k));
    $xc = $x + $w - $r;
    $yc = $y + $r;
    $this->_out(sprintf('%.2F %.2F l', $xc * $k, ($hp - $y) * $k));

    $this->_Arc($xc + $r * $MyArc, $yc - $r, $xc + $r, $yc - $r * $MyArc, $xc + $r, $yc);
    $xc = $x + $w - $r;
    $yc = $y + $h - $r;
    $this->_out(sprintf('%.2F %.2F l', ($x + $w) * $k, ($hp - $yc) * $k));
    $this->_Arc($xc + $r, $yc + $r * $MyArc, $xc + $r * $MyArc, $yc + $r, $xc, $yc + $r);
    $xc = $x + $r;
    $yc = $y + $h - $r;
    $this->_out(sprintf('%.2F %.2F l', $xc * $k, ($hp - ($y + $h)) * $k));
    $this->_Arc($xc - $r * $MyArc, $yc + $r, $xc - $r, $yc + $r * $MyArc, $xc - $r, $yc);
    $xc = $x + $r;
    $yc = $y + $r;
    $this->_out(sprintf('%.2F %.2F l', ($x) * $k, ($hp - $yc) * $k));
    $this->_Arc($xc - $r, $yc - $r * $MyArc, $xc - $r * $MyArc, $yc - $r, $xc, $yc - $r);
    $this->_out($op);
  }

  function _Arc($x1, $y1, $x2, $y2, $x3, $y3)
  {
    $h = $this->h;
    $this->_out(sprintf(
      '%.2F %.2F %.2F %.2F %.2F %.2F c ',
      $x1 * $this->k,
      ($h - $y1) * $this->k,
      $x2 * $this->k,
      ($h - $y2) * $this->k,
      $x3 * $this->k,
      ($h - $y3) * $this->k
    ));
  }

  function Rotate($angle, $x = -1, $y = -1)
  {
    if ($x == -1)
      $x = $this->x;
    if ($y == -1)
      $y = $this->y;
    if ($this->angle != 0)
      $this->_out('Q');
    $this->angle = $angle;
    if ($angle != 0) {
      $angle *= M_PI / 180;
      $c = cos($angle);
      $s = sin($angle);
      $cx = $x * $this->k;
      $cy = ($this->h - $y) * $this->k;
      $this->_out(sprintf('q %.5F %.5F %.5F %.5F %.2F %.2F cm 1 0 0 1 %.2F %.2F cm', $c, $s, -$s, $c, $cx, $cy, -$cx, -$cy));
    }
  }

  function _endpage()
  {
    if ($this->angle != 0) {
      $this->angle = 0;
      $this->_out('Q');
    }
    parent::_endpage();
  }
}
