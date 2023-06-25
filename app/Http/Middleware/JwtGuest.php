<?php

namespace App\Http\Middleware;

use App\Models\Guest;
use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Torann\GeoIP\Facades\GeoIP;

class JwtGuest
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle(Request $request, Closure $next)
    {
        $ip = $request->ip();
        $referer = $request->header('referer');
        $user = Guest::query()->where('ip',$ip)->first();
        if($user){
            Guest::query()->where('ip',$ip)->update([
                'visits'=>DB::raw('visits+1'),
                'referer'=>$referer,
                'day_visits'=>DB::raw('day_visits+1'),
                'visited_at'=>date('Y-m-d H:i:s',time())
            ]);
        }else{
            $addrObj = geoip($ip)->toArray();
            Guest::create([
                'ip'=>$ip,
                'country'=>$addrObj['country'],
                'province'=>$addrObj['state_name'],
                'city'=>$addrObj['city'],
                'visits'=>1,
                'day_visits'=>1,
                'referer'=>$referer,
                'reg_referer'=>$referer,
                'visited_at'=>date('Y-m-d H:i:s',time())
            ]);
        }
        return $next($request);
    }
}
