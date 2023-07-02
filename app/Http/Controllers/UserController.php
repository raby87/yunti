<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Mews\Captcha\Facades\Captcha;
use Tymon\JWTAuth\Facades\JWTAuth;
use Tymon\JWTAuth\Facades\JWTFactory;

class UserController extends Controller
{
    public function __construct()
    {

    }
    //生成验证码，返回messageId
    /**
     *
     * @OA\Get(
     *     path="/getCaptcha",
     *     tags={"api"},
     *     operationId="getCaptcha",
     *     summary="获得验证码",
     *     description="获得验证码",
     *     @OA\Response(
     *         response=200,
     *         description="successful operation",
     *          @OA\MediaType(
     *              mediaType="application/json",
     *             @OA\Schema(
     *                 type="object",
     *                 required={"code"},
     *                  @OA\Property(property="data", type="object",
     *                      @OA\Property(property="key", type="string"),
     *                      @OA\Property(property="img", type="string"),
     *                  ),
     *                  @OA\Property(property="msg", type="string", default=""),
     *                  @OA\Property(property="code", type="integer", default=200)
     *             )
     *         )
     *      ),
     * )
     * @return \Illuminate\Http\JsonResponse
     */
    public function getCaptcha(){
        $captcha = Captcha::create('flat', true);
        //key=messageId
        $captcha_key = $captcha['key'];
        $captcha_expire = 36000;
        // 缓存起来
        Cache::put("captcha_" . md5($captcha_key), 1, $captcha_expire);
        return $this->success($captcha);
    }

    public function verfyCaptcha(Request $request){
        if(!captcha_api_check($request->get('code'),$request->get('key'),'flat')){
            return $this->fail(1,"验证码失败");
        }
        return $this->success("","验证成功");
    }


    /**
     * @OA\Post(
     *     path="/register",
     *     tags={"api"},
     *     operationId="register",
     *     summary="注册",
     *     description="注册",
     *     @OA\Parameter(
     *         description="昵称",
     *         in="query",
     *         name="nickname",
     *         required=true,
     *         @OA\Schema(
     *          type="string"
     *         )
     *     ),
     *     @OA\Parameter(
     *         description="邮箱",
     *         in="query",
     *         name="email",
     *         required=true,
     *         @OA\Schema(
     *          type="string"
     *         )
     *
     *     ),
     *     @OA\Parameter(
     *         description="密码",
     *         in="query",
     *         name="password",
     *         required=true,
     *         @OA\Schema(
     *          type="string"
     *         )
     *
     *     ),
     *     @OA\Parameter(
     *         description="二维码",
     *         in="query",
     *         name="code",
     *         required=true,
     *         @OA\Schema(
     *          type="string"
     *         )
     *
     *     ),
     *     @OA\Parameter(
     *         description="获取验证吗返回的messageId",
     *         in="query",
     *         name="messageId",
     *         required=true,
     *         @OA\Schema(
     *          type="string"
     *         )
     *
     *     ),
     *     @OA\Response(
     *         response=200,
     *         description="successful operation",
     *          @OA\MediaType(
     *              mediaType="application/json",
     *             @OA\Schema(
     *                 type="object",
     *                 required={"code"},
     *                  @OA\Property(property="data", type="object",
     *                      @OA\Property(property="access_token", type="string"),
     *                      @OA\Property(property="token_type", type="string"),
     *                      @OA\Property(property="expires_in", type="string"),
     *                  ),
     *                  @OA\Property(property="msg", type="string", default=""),
     *                  @OA\Property(property="code", type="integer", default=200)
     *             )
     *         )
     *      ),
     * )
     */
    public function register(Request $request)
    {
        $validate = Validator::make($request->all(), [
            'nickname' => ['required','string','alpha_num','min:2','max:10'],
            'email' => ['required','string','max:100','email'],
            'password' => ['required','string','regex:/^[a-zA-Z0-9_]{6,16}$/'],
            'code' => ['required','integer','regex:/^([0-9]{6})$/'],
            'messageId' => ['required','string'],   //用于校验验证码
        ]);
        if($validate->fails())
        {
            return $this->fail(100,$validate->errors()->first());
        }
        if(!captcha_api_check($request->get('code'),$request->get('messageId'),'flat')){
            return $this->fail(1,"验证码失败");
        }
        $email = $request->email;
        //检查邮箱
        if(User::query()->where('email',$email)->exists()){
            return $this->fail(1,"邮箱已注册");
        }
        //检查邮箱
        if(User::query()->where('nickname',$request->nickname)->exists()){
            return $this->fail(2,"昵称已存在");
        }
        // jwt token
        $user = User::create([
            'nickname' => $request->nickname,
            'email' => $email,
            'password' => Hash::make($request->password)
        ]);
        if($user){
            $token = JWTAuth::fromUser($user);
            // JWTFactory::setTTL(80);// 设置TOKEN缓存时间
            //更新token,到数据库, 在需要token认证的接口实现，踢出其他账号
            User::query()->where('email',$email)->update(['jwt_token'=>$token]);
            return $this->responseWithToken($token);
        }
    }

    /**
     * @OA\Post(
     *     path="/login",
     *     tags={"api"},
     *     operationId="login",
     *     summary="登录",
     *     description="登录",
     *     @OA\Parameter(
     *         description="邮箱",
     *         in="query",
     *         name="email",
     *         required=true,
     *         @OA\Schema(
     *          type="string"
     *         )
     *
     *     ),
     *     @OA\Parameter(
     *         description="密码",
     *         in="query",
     *         name="password",
     *         required=true,
     *         @OA\Schema(
     *          type="string"
     *         )
     *
     *     ),
     *     @OA\Parameter(
     *         description="二维码",
     *         in="query",
     *         name="code",
     *         required=true,
     *         @OA\Schema(
     *          type="string"
     *         )
     *
     *     ),
     *     @OA\Parameter(
     *         description="获取验证吗返回的messageId",
     *         in="query",
     *         name="messageId",
     *         required=true,
     *         @OA\Schema(
     *          type="string"
     *         )
     *
     *     ),
     *     @OA\Response(
     *         response=200,
     *         description="successful operation",
     *          @OA\MediaType(
     *              mediaType="application/json",
     *             @OA\Schema(
     *                 type="object",
     *                 required={"code"},
     *                  @OA\Property(property="data", type="object",
     *                      @OA\Property(property="access_token", type="string"),
     *                      @OA\Property(property="token_type", type="string"),
     *                      @OA\Property(property="expires_in", type="string"),
     *                  ),
     *                  @OA\Property(property="msg", type="string", default=""),
     *                  @OA\Property(property="code", type="integer", default=200)
     *             )
     *         )
     *      ),
     * )
     */
    public function login(Request $request)
    {
        $validate = Validator::make($request->all(), [
            'email' => 'required|string|email',
            'password' => 'required|string'
        ]);
        if($validate->fails())
        {
            return $this->fail(100,$validate->errors()->first());
        }
        if(!captcha_api_check($request->get('code'),$request->get('messageId'),'flat')){
            return $this->fail(1,"验证码失败");
        }
        $email = $request->get('email');
        $user = User::query()->where('email',$email)->first();
        if(empty($user)){
            return $this->fail(1,"邮箱不存在");
        }
        //三次登录失败，就提示等5分钟内不能登录
        if($user['fail_times']>=3 && time()-strtotime($user['fail_at'])<=300){
            return $this->fail(2,"失败次数过多，等5分钟后再登录");
        }

        // jwt token
        $credentials = $request->only('email', 'password');
        // $credentials['status'] = 1; // 需要在验证登录的时候，需要验证其他参数，可这样加
        if (!$token = JWTAuth::attempt($credentials)) {
            User::query()->where("email",$email)->update([
                'fail_times'=>DB::raw('fail_times+1'),
                'fail_at'=>date('Y-m-d H:i:s',time()),
            ]);
            return $this->fail(3,"登录失败");
        }
        // JWTFactory::setTTL(80);// 设置TOKEN缓存时间

        //更新token,到数据库, 在需要token认证的接口实现，踢出其他账号
        User::query()->where('email',$email)->update([
            'jwt_token'=>$token,
            'login_at'=>date('Y-m-d H:i:s',time()),
            'login_ip'=>$request->ip(),
        ]);

        return $this->responseWithToken($token);
    }

    /**
     * 刷新token
     */
    public function refresh()
    {
        return $this->responseWithToken(JWTAuth::refresh());
    }

    /**
     * @OA\Post(
     *     path="/logout",
     *     tags={"api"},
     *     operationId="logout",
     *     summary="登出",
     *     description="登出",
     *     @OA\Response(
     *         response=200,
     *         description="successful operation",
     *         @OA\JsonContent(
     *              type="object",
     *              @OA\Property(property="data", type="string", default=""),
     *              @OA\Property(property="msg", type="string", default="xx not correct"),
     *              @OA\Property(property="code", type="integer", default=-1)
     *         )
     *      ),
     * )
     */
    public function logout(Request $request)
    {
        //JWTAuth::invalidate(JWTAuth::getToken()); // 即把当前token加入黑名单
         auth()->logout();
        return $this->success();
    }

    /**
     * 获取用户信息
     */
    public function userInfo(Request $request)
    {
        $user = JWTAuth::toUser();
        return $this->success($user);
    }

    /**
     * 响应
     */
    private function responseWithToken(string $token)
    {
        $response = [
            'access_token' => $token,
            'token_type' => 'Bearer',
            'expires_in' => JWTFactory::getTTL() * 60
        ];

        return $this->success($response);
    }
    //忘记密码
    public function forgot(){
        return "";
    }
    /**
     * @OA\Post(
     *     path="/resetPwd",
     *     tags={"api"},
     *     operationId="resetPwd",
     *     summary="修改密码",
     *     description="修改密码",
     *     @OA\Parameter(
     *         description="旧密码",
     *         in="query",
     *         name="password",
     *         required=true,
     *         @OA\Schema(
     *          type="string"
     *         )
     *
     *     ),
     *     @OA\Parameter(
     *         description="新密码",
     *         in="query",
     *         name="newpassword",
     *         required=true,
     *         @OA\Schema(
     *          type="string"
     *         )
     *
     *     ),
     *     @OA\Response(
     *         response=200,
     *         description="successful operation",
     *          @OA\MediaType(
     *              mediaType="application/json",
     *             @OA\Schema(
     *                 type="object",
     *                 required={"code"},
     *                  @OA\Property(property="data", type="string" ),
     *                  @OA\Property(property="msg", type="string", default=""),
     *                  @OA\Property(property="code", type="integer", default=200)
     *             )
     *         )
     *      ),
     * )
     */
    //修改密码
    public function resetPwd($request){
        $validate = Validator::make($request->all(), [
            'password' => ['required','string','regex:/^[a-zA-Z0-9_]{6,16}$/'],
            'newpassword' => ['required','string','regex:/^[a-zA-Z0-9_]{6,16}$/'],
            'code' => ['required','integer','regex:/^([0-9]{6})$/'],
            'messageId' => ['required','string'],   //用于校验验证码
        ]);
        if($validate->fails())
        {
            return $this->fail(100,$validate->errors()->first());
        }
        if(!captcha_api_check($request->get('code'),$request->get('messageId'),'flat')){
            return $this->fail(1,"验证码失败");
        }
        if($request->get('newpassword')!=$request->get('password')){
            return $this->fail(2,"新旧密码不能相同");
        }
        $user = JWTAuth::user();
        if($user['password']!=$request->get('password')){
            return $this->fail(2,"密码错误");
        }
        User::query()->where('email',$request->get('email'))->update([
            'password'=>Hash::make($request->newpassword)
        ]);
        return $this->success();
    }
    //注册
    //登录
    //忘记密码

    //用户信息
    //修改密码
}
