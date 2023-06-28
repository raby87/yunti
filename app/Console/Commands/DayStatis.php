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
        $start = date('Y-m-d 00:00:00');
        $end = date('Y-m-d 23:59:59');
        $query = Guest::query()
            ->where('visited_at','>=',$start)
            ->where('visited_at','<=',$end);
        $ip_counts = $query->count('ip');
        $visits = $query->sum('day_visits');

        $new = Guest::query()
            ->where('created_at','>=',$start)
            ->where('created_at','<=',$end);
        $new_ips = $new->count('ip');

        StatisDay::create([
            'new_ips'=>$new_ips,
            'visits'=>$visits,
            'ip_counts'=>$ip_counts,
        ]);
        $query->update(['day_visits'=>0]);
        return 0;
    }
}
