<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use App\Http\Controllers\VideoController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

//Route::middleware('auth:api')->get('/user', function (Request $request) {
//    return $request->user();
//});

//防爬虫爬链接，访问攻击
Route::group(['middleware'=>'check.sign'],function () {
    Route::group(['prefix' => 'user','middleware'=>'jwt.me.auth'],function () {
        Route::get('info', [UserController::class,"userInfo"]);
    });

    //访客
    Route::group(['middleware'=>'jwt.guest'],function () {
        Route::post('login', [UserController::class,"login"]);
        Route::post('register', [UserController::class,"register"]);
        Route::post('forgot', [UserController::class,"forgot"]);

        Route::any('video/info', [VideoController::class,"info"]);
    });
});


Route::get('/captcha', [UserController::class,"getCaptcha"]);
Route::get('/captcha/verfy', [UserController::class,"verfyCaptcha"]);
Route::get('/test', function (Request $request) {
    return "我是前端API";
});
