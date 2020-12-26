#!/usr/bin/env perl

use warnings;
use strict;

while(1) {
    my $time = time;

    my $temp_line = qx(vcgencmd measure_temp);
    chomp $temp_line;
    $temp_line =~ /([\d.]+)/;
    my $temp = $1;

    my $freq_line = qx(vcgencmd measure_clock arm);
    chomp $freq_line;
    $freq_line =~ /([\d.]+)$/;
    my $freq = $1;

    print "$time,$temp,$freq\n";
    sleep(1);
}
