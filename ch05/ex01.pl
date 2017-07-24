#!/usr/bin/perl

use strict;
use warnings;
use 5.014;

=head2
Without running it, can you see what’s wrong with this piece of a
program? If you can’t see the problem after a minute or two, see whether trying to
run it will give you a hint of how to fix it (you might try turning on warnings ):
  my %passenger_1 = {
    name => 'Ginger',
    age => 22,
    occupation => 'Movie Star',
    real_age => 35,
    hat => undef,
  };
  my %passenger_2 = {
    name => 'Mary Ann',
    age => 19,
    hat => 'bonnet',
    favorite_food => 'corn',
  };
  my @passengers = (\%passenger_1, \%passenger_2);
=cut

my $passenger_1 = +{
  name => 'Ginger',
  age => 22,
  occupation => 'Movie Star',
  real_age => 35,
  hat => undef,
};
my $passenger_2 = +{
  name => 'Mary Ann',
  age => 19,
  hat => 'bonnet',
  favorite_food => 'corn',
};
my @passengers = ($passenger_1, $passenger_2);
