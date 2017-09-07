#!perl -T

use strict;
use warnings;
use Test::More;

package SkipHorse {
  sub say_it_aloud {}
}

my $tv_horse = bless {}, 'SkipHorse';

SKIP: {
  skip 'Mac::Speech is not available', 1 unless eval { require Mac::Speech };
  ok( $tv_horse->say_it_aloud( 'I am Mr. Ed' ) ) ;
}
done_testing();
