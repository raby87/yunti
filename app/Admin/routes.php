<?php

use App\Admin\Controllers\UserController;
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
    $router->get('/config', [UserController::class,"index"])->name('config.index');
    //添加
    $router->get('/config/create', [UserController::class,"create"])->name('config.create');
    //编辑
    $router->get('/config/{id}/edit', [UserController::class,"edit"])->name('config.edit');
    //快速添加
    $router->post('/config', [UserController::class,"store"])->name('config.store');
    //行内编辑
    $router->put('/config/{id}', [UserController::class,"update"])->name('config.update');
    //删除
    $router->delete('/config/{id}', [UserController::class,"destroy"])->name('config.destroy');

});
