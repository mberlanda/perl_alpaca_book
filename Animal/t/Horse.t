#!perl -T

use strict;
use warnings;
use Test::More tests => 7;
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

# test DESTROY() when SUPER::DESTROY is not defined;
{
  my $tv_horse = Horse->named('Mr. Ed');

  stdout_is( sub { undef $tv_horse }, "[Mr. Ed has died.]\n[Mr. Ed has gone off to the glue factory.]\n",
      'Horse DESTROY() when SUPER::DESTROY is defined');
}

{
  my $tv_horse = Horse->named('Mr. Ed');
  # no warnings 'redefine';
  local *Animal::DESTROY;
  stdout_is( sub { undef $tv_horse }, "[Mr. Ed has gone off to the glue factory.]\n",
      'Horse DESTROY() when SUPER::DESTROY is not defined');
}
