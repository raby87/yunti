<?php

namespace App\Http\Middleware;

use App\Traits\ResponseFormat;
use Closure;
use Illuminate\Http\Request;
use Tymon\JWTAuth\Exceptions\JWTException;
use Tymon\JWTAuth\Exceptions\TokenExpiredException;
use Tymon\JWTAuth\Exceptions\TokenInvalidException;
use Tymon\JWTAuth\Facades\JWTAuth;

class JwtAuthenticate
{
    use ResponseFormat;
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\JsonResponse
     */
    public function handle(Request $request, Closure $next)
    {
        try {
            /**
             *TODO 获取用户信息的方法可封装起来
             *对应的放回参数可根据个人习惯进行自定义
             */
            $token = JWTAuth::getToken();
            if ($token) JWTAuth::setToken($token);
            if (!$user = JWTAuth::toUser()){
                return response()->json([
                    'errcode' => 400004,
                    'errmsg' => '无此用户'
                ], 404);
            }
            //踢出已登录用户
            if($user['jwt_token']!=$token){
                return $this->fail(400005,'抱歉，你已在其它地方登录了。');
            }
        } catch (TokenExpiredException $e) {
            return $this->fail(400001,'token 过期');
        } catch (TokenInvalidException $e) {
            return $this->fail(400003,'token 失效');
        } catch (JWTException $e) {
            return $this->fail(400002,'token 参数错误');
        }
        return $next($request);
    }
}
