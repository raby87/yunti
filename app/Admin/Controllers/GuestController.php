<?php

namespace App\Admin\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Guest;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Controllers\Dashboard;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Column;
use Encore\Admin\Layout\Content;
use Encore\Admin\Layout\Row;

class GuestController extends AdminController
{
    public function index(Content $content)
    {
        $grid = new Grid(new Guest());

        $grid->column('id', __('ID'))->sortable()->totalRow('合计');
        $grid->column('ip', '访客IP');
        $grid->column('country', '国家');
        $grid->column('province', '省份');
        $grid->column('city', '城市');
        $grid->column('visits', '总访问量')->totalRow();
        $grid->column('day_visits', '今天访问量')->totalRow();
        $grid->column('reg_referer', 'SEO来源-第一次');
        $grid->column('referer', 'SEO来源');
        $grid->column('visited_at', '访问时间');
        $grid->column('created_at', "创建时间");


        $grid->filter(function($filter){
            $filter->between('created_at', "创建时间")->datetime();
        });
        $grid->filter(function($filter){
            $filter->equal('IP', "访客IP");
        });
        $grid->filter(function($filter){
            $filter->equal('country', "国家");
        });
        $grid->filter(function($filter){
            $filter->equal('country', "省份");
        });
        $grid->filter(function($filter){
            $filter->equal('country', "城市");
        });
        $grid->filter(function($filter){
            $filter->contains('referer', "SEO来源");
        });
        $grid->filter(function($filter){
            $filter->between('visited_at', "访问时间")->datetime();
        });

        $grid->disableActions();
        return $content->body($grid);
    }

    /**
     * 表单定义
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Guest());
        $form->number('score','分数');
        return $form;
    }
}
