<?php

use App\Admin\Controllers\UserController;
use App\Admin\Controllers\ConfigController;
use Illuminate\Routing\Router;

Admin::routes();

Route::group([
    'prefix'        => config('admin.route.prefix'),
    'namespace'     => config('admin.route.namespace'),
    'middleware'    => config('admin.route.middleware'),
    'as'            => config('admin.route.prefix') . '.',
], function (Router $router) {

    $router->get('/', 'HomeController@index')->name('home');

    $router->get('/guests', 'GuestController@index');

    $router->get('/users', [UserController::class,"index"]);

    //列表
    $router->get('/configs', [ConfigController::class,"index"])->name('configs.index');
    //添加
    $router->get('/configs/create', [ConfigController::class,"create"])->name('configs.create');
    //编辑
    $router->get('/configs/{id}/edit', [ConfigController::class,"edit"])->name('configs.edit');
    //快速添加
    $router->post('/configs', [ConfigController::class,"store"])->name('configs.store');
    //行内编辑
    $router->put('/configs/{id}', [ConfigController::class,"update"])->name('configs.update');
    //删除
    $router->delete('/configs/{id}', [ConfigController::class,"destroy"])->name('configs.destroy');

});
