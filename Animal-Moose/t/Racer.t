#!perl -T

use strict;
use warnings;
use Test::More tests => 8;
use Test::Output;

BEGIN {
  require_ok( 'Racer' ) || BAIL_OUT(); # print "Bail out!\n";
}
diag( "Testing Racer $Racer::VERSION, Perl $], $^X" );

# Defined methods in Racer.pm
ok( defined &Racer::won, 'won() is defined');
ok( defined &Racer::placed, 'placed() is defined');
ok( defined &Racer::showed, 'showed() is defined');
ok( defined &Racer::lost, 'lost() is defined');
ok( defined &Racer::standings, 'standings() is defined');

package RoleRacer {
  use Moose;
  use namespace::autoclean;
  with 'Racer';
  __PACKAGE__->meta->make_immutable;
}

{
  my $racer = RoleRacer->new();
  $racer->won();
  $racer->won();
  $racer->lost();
  $racer->placed();
  $racer->placed();
  $racer->won();
  is($racer->standings, '3 wins, 2 places, 0 shows, 1 losses', 'standings() works as expected');

  $racer->showed();
  is($racer->standings, '3 wins, 2 places, 1 shows, 1 losses', 'standings() works as expected');
}
