<?php

namespace App\Admin\Controllers;

use App\Models\Config;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;

class ConfigController extends AdminController
{
    public function index(Content $content)
    {
        $grid = new Grid(new Config());

        $grid->column('cid', 'CID')->sortable();
        $grid->column('k', "配置项");
        $grid->column('v', "配置值")->editable();
        $grid->column('updated_at', "更新时间");

        $grid->filter(function($filter){
            $filter->equal('k', "配置项");
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
        $form = new Form(new Config());
        $form->text('v','配置值');
        return $form;
    }
}
