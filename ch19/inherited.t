#!perl -T

use strict;
use warnings;
use Test::More tests => 12;
use Test::Output;

BEGIN {
  require_ok( 'InheritedHorse' ) || BAIL_OUT(); # print "Bail out!\n";
}

# they have to be defined in InheritedHorse.pm
ok( defined &InheritedHorse::sound, 'InheritedHorse::sound is defined' );
ok( InheritedHorse->can('name'), 'InheritedHorse can name()' );
ok( InheritedHorse->can('color'), 'InheritedHorse can color()' );

{
  my $tv_horse = InheritedHorse->new;
  is($tv_horse->sound, 'neigh', 'sound() works as instance method');

  is($tv_horse->name, undef, 'name() is undef by default');
  is($tv_horse->color, undef, 'color() is undef by default');
}

{
  my $tv_horse = InheritedHorse->new;
  $tv_horse->name("Mr. Ed");
  $tv_horse->color("black");
  is($tv_horse->name, 'Mr. Ed', 'name() is defined by the setter');
  is($tv_horse->color, 'black', 'color() is defined by the setter');
}
{
  my $tv_horse = InheritedHorse->new( name => "Mr. Ed", color => "black" );
  is($tv_horse->name, 'Mr. Ed', 'name() is defined by the initializer');
  is($tv_horse->color, 'black', 'color() is defined by the initializer');

  stdout_is(
    sub { $tv_horse->speak() }, "Mr. Ed goes neigh\n", "speak() works as expected"
  );
}
