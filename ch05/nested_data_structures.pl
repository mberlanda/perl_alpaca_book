#!/usr/bin/perl
use strict;
use warnings;
use 5.014;

# my @all_with_names;
sub get_provisions_list {
  my @skipper = qw(blue_shirt hat jacket preserver sunscreen);
  my @skipper_with_name = ('The Skipper', \@skipper);
  my @professor = qw(sunscreen water_bottle slide_rule batteries radio);
  my @professor_with_name = ('The Professor', \@professor);
  my @gilligan = qw(red_shirt hat lucky_socks water_bottle);
  my @gilligan_with_name = ('Gilligan', \@gilligan);
  # @all_with_names = (...)
  return (
    \@skipper_with_name,
    \@professor_with_name,
    \@gilligan_with_name,
  );
}

my @all_with_names = get_provisions_list();

my $gilligan_stuff = $all_with_names[2][1];
# then when we remove @all_with_names , we still have one live reference to what was
# formerly @gilligan , and the data from there downward remains alive.
@all_with_names = undef;
say join(", ", @$gilligan_stuff);
