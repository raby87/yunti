<?php

namespace App\Http\Controllers;


/**
 * @OA\Info(
 *     title="Auth api",
 *      description="包含功能：API：登录，注册，验证码   后台：带权限，客户管理。  header：版本号v,来源origin 认证auth, time ",
 *     version="0.0.1"
 * )
 * @OA\Server(
 *     url="http://127.0.0.1/api"
 * ),
 */
class TestController extends Controller
{
    public function __construct()
    {

    }
    /**
     * @OA\Get(
     *     path="/projects",
     *     @OA\Response(response="200", description="Display a listing of projects.")
     * )
     */
    public function info(){
        return $this->success();
    }
}
