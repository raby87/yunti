<?php


namespace App\Traits;


trait ResponseFormat
{
    public function success($data="",$msg=""){
        return response()->json(["code"=>200,'data' => $data,'msg'=>$msg],200);
    }
    public function fail($code=1,$msg=""){
        return response()->json(["code"=>$code,'data' => "",'msg'=>$msg],200);
    }
}
