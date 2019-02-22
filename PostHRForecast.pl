#!/usr/bin/env perl
use strict;
use warnings;

use utf8;
use Data::Dumper;

use FindBin;
use lib "$FindBin::Bin/extlib/lib/perl5";
use lib "$FindBin::Bin/lib";

# CPAN Module
use Encode;
use Log::Handler;
use LWP::UserAgent;

# Bata64 Module
use Bata64::PostHRForecast;

my $filepath = "$FindBin::Script";
if ( ! defined $ARGV[2] ){
    print "USAGE: $filepath [ :service_name/:section_name/:graph_name ] [datetime] [number]","\n";
    exit 0;
}

# 各種設定
my $base_url = 'http://reimei.net:5127/api/';

my $graphname = $ARGV[0];
my $plot_time = $ARGV[1];
my $plot_value = $ARGV[2];

# set for bata64::PostHRForecast
    my $graph = Bata64::PostHRForecast->new(
        base_url   => $base_url,
    );

# set for Log::Handler
my $log = Log::Handler->new(
    file => {
        filename => '/home/kawabata/log/PostHRForecast.log',
        maxlevel => 'debug',
        timeformat => "%Y/%m/%d %H:%M:%S",
        utf8 => 1,
    }
);

$log->info("処理開始");
$log->info("グラフ名：$graphname 日付：$plot_time 値：$plot_value で登録します。");
my $code = $graph->post( $graphname, $plot_time, $plot_value );
if ( $code == 200 ){
    $log->info("グラフ名：$graphname 日付：$plot_time 値：$plot_value で登録しました。");
} else {
    $log->info("グラフ名：$graphname 日付：$plot_time 値：$plot_value の登録に失敗しました。HTTP応答コード：$code ");
}
$log->info("処理終了");