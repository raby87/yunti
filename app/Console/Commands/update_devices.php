<?php

namespace App\Console\Commands;

use App\Models\Guest;
use App\Models\StatisDay;
use Illuminate\Console\Command;

class DayStatis extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'command:name';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        //超时（APP没网，进程被杀等无法通知）强制下线  status=1, 5分钟时间未更新，就强制下线

        return 0;
    }
}
