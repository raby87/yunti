<?php

namespace App\Admin\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Guest;
use Encore\Admin\Controllers\Dashboard;
use Encore\Admin\Layout\Column;
use Encore\Admin\Layout\Content;
use Encore\Admin\Layout\Row;

class HomeController extends Controller
{
    public function index(Content $content)
    {
        return $content
            //->title('Dashboard')
            //->description('Description...')
            //->row(Dashboard::title())
            ->row(function (Row $row) {

                $row->column(4, function (Column $column) {

                    $start = date('Y-m-d 00:00:00');
                    $end = date('Y-m-d 23:59:59');
                    $query = Guest::query()
                        ->where('visited_at','>=',$start)
                        ->where('visited_at','<=',$end);
                    $ip_counts = $query->count('ip');

                    $query = $query ->where('country',"China");
                    $china_counts = $query->count('ip');
                    $out_counts = $ip_counts-$china_counts;
                    $column->append("今日访问:".$ip_counts."人  ($china_counts/$out_counts)");
                });

                $row->column(4, function (Column $column) {

                    $start = date('Y-m-d 00:00:00');
                    $end = date('Y-m-d 23:59:59');
                    $new = Guest::query()
                        ->where('created_at','>=',$start)
                        ->where('created_at','<=',$end);
                    $new_ips = $new->count('ip');

                    $new = $new->where('country',"China");
                    $china_counts = $new->count('ip');
                    $out_counts = $new_ips-$china_counts;
                    $column->append("今日新增:".$new_ips."人  ($china_counts/$out_counts)");
                    //$column->append(Dashboard::extensions());
                });

//                $row->column(4, function (Column $column) {
//                    $column->append(Dashboard::dependencies());
//                });
            });
    }
}
