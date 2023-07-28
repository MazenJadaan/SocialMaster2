<?php
namespace App\Traits;

trait Save_MediaTrait {
    public  function save_media($data,$save_path){
        $media=time().'.'.$data->getClientOriginalExtension();
        $path=public_path($save_path);
        $data->move($path,$media);
        $media_name = $save_path.$media;
        return $media_name ;
    }
}
