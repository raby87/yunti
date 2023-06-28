<?php
namespace App\Http\Middleware;

use App\Traits\ResponseFormat;
use Carbon\Carbon;
use Closure;

/**
 * 接口签名
 *
 */
class CheckSign
{
    use ResponseFormat;
    //忽略列表
    protected $except = [
        //
    ];

    // 时间误差
    protected $timeError = 5;

    // 密钥
    protected $secretKey = 'nosmi#dn$w7o=uq';

    // 签名字段
    protected $signField = 'sn';

    //时间错字段timestamp  接口5分钟内有效

    /* public function __construct()
     {
         $this->secretKey = config('auth.api_sign.secret_key', '');
     }*/

    /**
     * Handle an incoming request.
     *
     * @param \Illuminate\Http\Request $request
     * @param \Closure $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        if (1 || $this->inExceptArray($request) || ($this->allowTimestamp($request) && $this->signMatch($request))) {
            return $next($request);
        }
        return $this->fail(-1,'签名有误');
    }

    /**
     * 判断当前请求是否在忽略列表中
     */
    protected function inExceptArray($request)
    {
        foreach ($this->except as $except) {
            if ($except !== '/') {
                $except = trim($except, '/');
            }
            if ($request->fullUrlIs($except) || $request->is($except)) {
                return true;
            }
        }
        return false;
    }

    /**
     * 判断用户请求是否在对应时间范围
     */
    protected function allowTimestamp($request)
    {
        $queryTime = Carbon::createFromTimestamp($request->query('timestamp', 0));
        $lfTime = Carbon::now()->subSeconds($this->timeError);
        $rfTime = Carbon::now()->addSeconds($this->timeError);
        if ($queryTime->between($lfTime, $rfTime, true)) {
            return true;
        }
        return false;
    }

    /**
     * 签名验证
     */
    protected function signMatch($request)
    {
        $data = $request->query();
        // 移除sign字段
        if (isset($data[$this->signField])) {
            unset($data[$this->signField]);
        }

        ksort($data);
        $sign = '';
        foreach ($data as $k => $v) {
            if ($this->signField !== $k) {
                $sign .= $k . $v;
            }
        }

        if (strtoupper(md5(md5($sign) . $this->secretKey)) === $request->query($this->signField, null)) {
            return true;
        }
        return false;
    }
}
