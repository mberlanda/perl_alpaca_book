#!perl -T

use strict;
use warnings;
use Test::More tests => 2;
use Test::Output;

BEGIN {
  require_ok( 'RaceHorse' ) || BAIL_OUT();
}
diag( "Testing RaceHorse $RaceHorse::VERSION, Perl $], $^X" );

my $s = RaceHorse->new( name => 'Seattle Slew' );
$s->won;
$s->won;
$s->won;
$s->placed;
$s->lost;
is($s->standings, '3 wins, 1 places, 0 shows, 1 losses', 'RaceHorse works as expected');
