#!perl -T

use 5.006;
use strict;
use warnings;
use Test::More;

BEGIN {
  use_ok( 'My::List::Util' ) || BAIL_OUT();
}

ok( defined &My::List::Util::shuffle, 'shuffle() is defined' );

{
  my @shuffled = My::List::Util::shuffle();
  is( scalar @shuffled, 0, 'No args returns an empty list' );
}

{
  my @array = 1 .. 10;
  my @shuffled = My::List::Util::shuffle( @array );
  is( scalar @array, scalar @shuffled, "The output list is the same size" );
  isnt( "@array", "@shuffled", "The list is shuffled" );
}

done_testing();
