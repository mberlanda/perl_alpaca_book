#!perl -T
use 5.006;
use strict;
use warnings;
use Test::More;

plan tests => 7;

BEGIN {
  foreach my $class ( qw(Animal Cow Horse Sheep Mouse LivingCreature Person) ) {
    use_ok( $class ) or print "Bail out! $class does not compile!\n";
  }
}

diag( "Testing Animal $Animal::VERSION, Perl $], $^X" );
