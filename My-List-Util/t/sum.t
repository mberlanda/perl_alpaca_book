#!perl -T
use 5.006;
use strict;
use warnings;
use Test::More tests => 9;

BEGIN {
  use_ok( 'My::List::Util' ) || BAIL_OUT();
}

ok( defined &sum, 'sum() is defined' );

is( sum( 1, 2, 3 ), 6, '1+2+3 is six' );
is( sum( qw(1 2 3) ), 6, '1+2+3 as strings is six' );
is( sum( 4, -9, 37, 6 ), 38, '4-9+37+6 is six' );
is( sum( 3.14, 2.2 ), 5.34, '3.14 + 2.2 is 5.34' );
is( sum(), undef, 'No arguments returns undef' );
is( sum( qw(a b) ), undef, 'All bad args gives undef' );
is( sum( qw(a b 4 5) ), 9, 'Some good args works' );
