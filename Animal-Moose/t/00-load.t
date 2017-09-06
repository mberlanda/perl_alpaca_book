#!perl -T
use 5.006;
use strict;
use warnings;
use Test::More tests => 6;

BEGIN {
  foreach my $class ( qw(Animal Cow Horse Racer RaceHorse Sheep) ) {
    use_ok( $class ) or print "Bail out! $class does not compile!\n";
  }
}

diag( "Testing Animal $Animal::VERSION, Perl $], $^X" );
