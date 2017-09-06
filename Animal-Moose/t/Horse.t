#!perl -T

use strict;
use warnings;
use Test::More tests => 5;
use Test::Output;

BEGIN {
  require_ok( 'Horse' ) || BAIL_OUT(); # print "Bail out!\n";
}
diag( "Testing Horse $Horse::VERSION, Perl $], $^X" );

# check that sound()
ok( defined &Horse::sound, 'Horse::sound is defined' );
is(Horse->sound(), 'neigh', 'Horse\'s sound() should be \'neigh\'');

# check name() method
{
  my $name = "Mr. Ed";
  my $tv_horse = Horse->new( name => $name );

  is( $tv_horse->name, $name, 'Horse name() works as expected' );
  is( $tv_horse->color, $tv_horse->default_color, 'Horse color() works as expected' );
}
