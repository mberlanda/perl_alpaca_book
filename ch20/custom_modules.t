#!perl -T

use strict;
use warnings;

use Test::More tests => 1;
use Test::Minnow::RequiredItems;

my @gilligan = (
  Gilligan => [ qw(red_shirt hat lucky_socks water_bottle) ]
);

check_required_items_ok( @gilligan );
