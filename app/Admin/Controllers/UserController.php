<?php

namespace App\Admin\Controllers;

use App\Http\Controllers\Controller;
use App\Models\User;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;

class UserController extends AdminController
{
    public function index(Content $content)
    {
        $grid = new Grid(new User());

        $grid->column('uid', __('UID'))->sortable();
        $grid->column('nickname', "昵称");
        $grid->column('email', "邮箱");
        $grid->column('login_ip', "登录IP");
        $grid->column('login_at', "最后登录时间");
        $grid->column('created_at', "注册时间");

        $grid->filter(function($filter){
            $filter->between('created_at', "注册时间")->datetime();
        });
        $grid->filter(function($filter){
            $filter->equal('email', "邮箱");
        });

        $grid->disableActions();
        return $content->body($grid);
    }
}
