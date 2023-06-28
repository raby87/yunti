<?php

namespace App\Http\Controllers;


class VideoController extends Controller
{
    public function __construct()
    {

    }
    public function info(){
        return $this->success();
    }
}
