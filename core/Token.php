<?php
class Token
{
    public static function generate()
    {
        return Hash::make(uniqid(Hash::make(uniqid())));
    }
    public function check()
    {
    }
}
