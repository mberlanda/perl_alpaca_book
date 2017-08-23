#!perl -T

use strict;
use warnings;
use Test::More;
use Test::Output;

BEGIN {
  require_ok( 'LivingCreature' ) || BAIL_OUT(); # print "Bail out!\n";
}
diag( "Testing LivingCreature $LivingCreature::VERSION, Perl $], $^X" );

# check that speak()
ok( defined &LivingCreature::speak, 'LivingCreature::speak is defined' );

{
  package Foofle {
    use parent qw(LivingCreature);
    sub sound { 'foof' }
  }

  stdout_is( sub { Foofle->speak() }, "a Foofle goes foof\n",
      'An LivingCreature subclass speaks the default sound() if no args provided');
  stdout_is( sub { Foofle->speak("blahblah") }, "a Foofle goes 'blahblah'\n",
      'An LivingCreature subclass speaks the default sound() if no args provided');
}

done_testing();
