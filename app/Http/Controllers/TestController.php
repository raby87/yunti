<?php

namespace App\Http\Controllers;


/**
 * @OA\Info(
 *     title="Auth api",
 *      description="包含功能：API：登录，注册，验证码   后台：带权限，客户管理。
 *          header：版本号v,来源origin, deviceId设备号 认证auth, time
 *          返回状态码：200成功， 100参数错误， 501外部错误  503内部错误  504系统异常  300联系管理员-配置错误 401认证失败",
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
     *
     *     @OA\Response(
     *         response=200,
     *         description="successful operation",
     *          @OA\MediaType(
     *              mediaType="application/json",
     *             @OA\Schema(
     *                 type="object",
     *                 required={"code"},
     *                  @OA\Property(property="data", type="object",
     *                      @OA\Property(property="types", type="array",
     *                          @OA\Items(type="string")
     *                      ),
     *                  ),
     *                  @OA\Property(property="msg", type="string", default=""),
     *                  @OA\Property(property="code", type="integer", default=200)
     *             )
     *         )
     *      ),
     *     @OA\Response(response="201", description="Display a listing of projects.")
     * )
     */
    public function info(){
        return $this->success();
    }
}
