#!perl -T

use 5.006;
use strict;
use warnings;
use Test::More tests => 5;

BEGIN {
  use_ok( 'My::List::Util' ) || BAIL_OUT();
}

ok( defined &shuffle, 'shuffle() is defined' );

{
  my @shuffled = shuffle();
  is( scalar @shuffled, 0, 'No args returns an empty list' );
}

{
  my @array = 1 .. 10;
  my @shuffled = shuffle( @array );
  is( scalar @array, scalar @shuffled, "The output list is the same size" );
  isnt( "@array", "@shuffled", "The list is shuffled" );
}
