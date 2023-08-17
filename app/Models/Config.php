<?php

namespace App\Models;

use DateTimeInterface;
use Illuminate\Database\Eloquent\Model;

class Config extends Model
{
    protected $primaryKey="cid";
    protected $guarded = [
    ];

    //todo 解决接口数据带T Z格式问题
    protected function serializeDate(DateTimeInterface $date)
    {
        return $date->format($this->dateFormat ?: 'Y-m-d H:i:s');
    }
}
