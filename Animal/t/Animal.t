#!perl -T

use strict;
use warnings;
use Test::More tests => 34;
use Test::Output;

BEGIN {
  require_ok( 'Animal' ) || BAIL_OUT(); # print "Bail out!\n";
}
diag( "Testing Animal $Animal::VERSION, Perl $], $^X" );

# they have to be defined in Animal.pm
ok( defined &Animal::named, 'Animal::named is defined' );
ok( defined &Animal::name, 'Animal::name is defined' );
ok( defined &Animal::set_name, 'Animal::set_name is defined' );
ok( defined &Animal::color, 'Animal::color is defined' );
ok( defined &Animal::set_color, 'Animal::set_color is defined' );
ok( defined &Animal::default_color, 'Animal::default_color is defined' );
ok( defined &Animal::sound, 'Animal::sound is defined' );
ok( defined &Animal::speak, 'Animal::speak is defined' );
ok( defined &Animal::eat, 'Animal::eat is defined' );

## Class Methods
# Methods available for Subclasses only

{
  eval { Animal->sound() } or my $at = $@;
  like( $at, qr/should define/, 'sound() dies with a message' );
}
{
  eval { Animal->speak() } or my $at = $@;
  like( $at, qr/should define/, 'speak() dies with a message' );
}

# Methods available for Instances only
{
  eval { Animal->set_color("blue") } or my $at = $@;
  like( $at, qr/instance variable needed/, 'set_color() dies with a message' );
}
{
  eval { Animal->set_name("Mr. Ed") } or my $at = $@;
  like( $at, qr/instance variable needed/, 'set_color() dies with a message' );
}

# Class methods working
stdout_is(
  sub { Animal->eat('potato') },
  "an unnamed Animal eats potato.\n",
  'eat() should work as class method'
);

is(Animal->name(), 'an unnamed Animal', 'name() should work as class method');
is(Animal->default_color(), 'brown', 'default_color() should work as class method');
is(Animal->color(), Animal->default_color(), 'color() should work as class method');

## Instance Methods

{
  my $animal = Animal->named("Mr. Ed");
  is($animal->name, "Mr. Ed", "named() should create an instance of Animal");
  is($animal->color, Animal->default_color, "a named() created instance of Animal has default color");

  my ($new_name, $new_color) = ("Mister Ed", "purple");
  ok($animal->set_name($new_name), "set_name() should work for an instance of Animal");
  ok($animal->set_color($new_color), "set_color() should work for an instance of Animal");

  is($animal->name, $new_name, "set_name() should work as expected");
  is($animal->color, $new_color, "set_color() should work as expected ");
}

## Subclasses Methods

{
  package Foofle {
    use parent qw(Animal);
    sub sound { 'foof' }
  }

  is( Foofle->sound(), 'foof', 'An Animal subclass does sound()');
  stdout_is( sub { Foofle->speak() }, "an unnamed Foofle goes foof\n",
      'An Animal subclass does speak()');

  eval { Foofle->speak("blahblah") } or my $at = $@;
  like( $at, qr/animals can't talk/, 'An Animal subclass speak() dies with a message' );

  {
    my $name = "Mr. Ed";
    my $tv_foofle = { Name => $name };
    bless $tv_foofle, 'Foofle';

    is(
      ($tv_foofle->name) . " says " . ($tv_foofle->sound),
      'Mr. Ed says foof', 'An Animal subclass name() should work'
    );

    my $new_name = "Mister Ed";
    $tv_foofle->set_name($new_name);
    is($tv_foofle->name, $new_name, 'An Animal subclass set_name() should work');
  }

  {
    my $tv_foofle = Foofle->named('Mr. Ed');
    is(
      ($tv_foofle->name) . " says " . ($tv_foofle->sound),
      'Mr. Ed says foof', 'An Animal subclass named() should work'
    );
    stdout_is( sub { $tv_foofle->speak() }, "Mr. Ed goes foof\n",
      'An Animal subclass speak() should work');
    stdout_is(
      sub { $tv_foofle->eat('potato') },
      "Mr. Ed eats potato.\n",
      'An Animal subclass eat() should work'
    );
    is($tv_foofle->color, Animal->default_color(), 'An Animal subclass color() should be defined by default');
    $tv_foofle->set_color('white');
    is($tv_foofle->color, 'white', 'An Animal subclass color() could be changed from default');
  }

}
