#!perl -T

use strict;
use warnings;
use Test::More tests => 8;
use Test::Output;

# pass();

BEGIN {
  require_ok( 'Animal' ) || BAIL_OUT(); # print "Bail out!\n";
}
diag( "Testing Animal $Animal::VERSION, Perl $], $^X" );

# they have to be defined in Animal.pm
ok( defined &Animal::speak, 'Animal::speak is defined' );
ok( defined &Animal::sound, 'Animal::sound is defined' );

# check that sound() dies
{
  eval { Animal->sound() } or my $at = $@;
  like( $at, qr/should define/, 'sound() dies with a message' );
}

# check that speak() dies too
{
  eval { Animal->speak() } or my $at = $@;
  like( $at, qr/should define/, 'speak() dies with a message' );
}

{
  package Foofle {
    use parent qw(Animal);
    sub sound { 'foof' }
  }

  is( Foofle->sound(), 'foof', 'An Animal subclass does sound()');
  stdout_is( sub { Foofle->speak() }, "a Foofle goes foof\n",
      'An Animal subclass does the right thing');

  eval { Foofle->speak("blahblah") } or my $at = $@;
  like( $at, qr/animals can't talk/, 'speak() dies with a message' );
}
