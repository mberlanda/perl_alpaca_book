#!perl
# scripts/horse.pl

use strict;
use warnings;
use RaceHorse;

my $runner = RaceHorse->named('Billy Boy');
$runner->won;
print $runner->name, ' has standings ', $runner->standings, ".\n";
