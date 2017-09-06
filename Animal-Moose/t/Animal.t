#!perl -T

use strict;
use warnings;
use Test::More tests => 15;
use Test::Output;

BEGIN {
  require_ok( 'Animal' ) || BAIL_OUT(); # print "Bail out!\n";
}
diag( "Testing Animal $Animal::VERSION, Perl $], $^X" );


package RoleAnimal {
  use Moose;
  use namespace::autoclean;

  with 'Animal';
  sub sound { 'blah' }
  sub default_color { 'black' }
  __PACKAGE__->meta->make_immutable;

}

# they have to be defined in Animal.pm
ok( defined &RoleAnimal::name, 'RoleAnimal::name is defined' );
ok( defined &RoleAnimal::color, 'RoleAnimal::color is defined' );
ok( defined &RoleAnimal::speak, 'RoleAnimal::speak is defined' );
ok( defined &RoleAnimal::sound, 'RoleAnimal::sound is defined' );
ok( defined &RoleAnimal::default_color, 'RoleAnimal::default_color is defined' );

{
  my $animal = RoleAnimal->new( name =>  "Mr. Ed");
  is($animal->name, "Mr. Ed", "new() takes some attributes in the constructor");
  is($animal->color, $animal->default_color, "a new() sets default values when provided");

  my ($new_name, $new_color) = ("Mister Ed", "black");
  ok($animal->name($new_name), "name() works as a setter");
  ok($animal->color($new_color), "color() works as a setter");

  {
    eval { $animal->name([]) } or my $at = $@;
    like($at, qr/Validation failed/, "name() should perform type validation")
  }
    {
    eval { $animal->color('purple') } or my $at = $@;
    like($at, qr/Validation failed/, "color() should perform type validation")
  }
  is($animal->name, $new_name, "name() works as a getter");
  is($animal->color, $new_color, "color() works as a getter ");

  stdout_is(
    sub { $animal->speak },
    "Mister Ed goes blah\n",
    "speak() works as expected"
  );
}

