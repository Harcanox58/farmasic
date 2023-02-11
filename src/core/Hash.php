<?php

class Hash
{

    public static function make($data)
    {
        $hash = hash_init('sha256', HASH_HMAC, 'f23f13e5f649ce103f5f2902e5a2dc6adbd8946a6d96f6fefb6a2c05ce84260e91a54f46bd658223773dc8a0ff684f1ca68ab05da70d66e2542115f3f1dc7e1b');
        hash_update($hash, $data);
        return hash_final($hash);
    }
    public static function lite($data)
    {
        $hash = hash_init('md2', HASH_HMAC, 'f23f13e5f649ce103f5f2902e5a2dc6adbd8946a6d96f6fefb6a2c05ce84260e91a54f46bd658223773dc8a0ff684f1ca68ab05da70d66e2542115f3f1dc7e1b');
        hash_update($hash, $data);
        return hash_final($hash);
    }
}
