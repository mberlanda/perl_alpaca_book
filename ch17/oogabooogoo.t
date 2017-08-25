#!perl -T

use strict;
use warnings;
# use Oogaboogoo::Date qw(day month); # as per Ex 01
use Oogaboogoo::Date qw(:all);

use Test::More tests => 6;
use Test::Exception;

dies_ok( sub { day(-1) }, 'Oogaboogoo::Date::day(-1) expecting to die' );
dies_ok( sub { day(7) }, 'Oogaboogoo::Date::day(7) expecting to die' );
dies_ok( sub { month(-1) }, 'Oogaboogoo::Date::month(-1) expecting to die' );
dies_ok( sub { month(12) }, 'Oogaboogoo::Date::month(12) expecting to die' );

ok( day(0) eq 'ark', 'Oogaboogoo::Date::day() eq ark');
ok( month(1) eq 'pod', 'Oogaboogoo::Date::month() eq pod');
