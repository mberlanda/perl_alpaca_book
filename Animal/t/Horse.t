#!perl -T

use strict;
use warnings;
use Test::More tests => 5;

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
  my $tv_horse = { Name => $name };
  bless $tv_horse, 'Horse';

  is(
    ($tv_horse->name) . " says " . ($tv_horse->sound),
    'Mr. Ed says neigh', 'Horse name() should work'
  );
}

# check named() constructor
{
  my $tv_horse = Horse->named('Mr. Ed');

  is(
    ($tv_horse->name) . " says " . ($tv_horse->sound),
    'Mr. Ed says neigh', 'Horse named() should work'
  );
}
