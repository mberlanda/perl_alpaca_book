#!/usr/bin/perl

use strict;
use warnings;
use 5.014;

use Data::Dumper;
=head2 Selecting and Altering Complex Data
=cut

my %provisions = (
  'The Skipper' => [qw(blue_shirt hat jacket preserver sunscreen)],
  'The Professor' => [qw(sunscreen water_bottle slide_rule batteries radio)],
  'Gilligan' => [qw(red_shirt hat lucky_socks water_bottle)],
);

# Who brought fewer than five items?
my @packed_light = grep @{ $provisions{$_} } < 5, keys %provisions;

# Who brought a water bottle?
my @all_wet = grep {
  my @items = @{ $provisions{$_} };
  grep $_ eq 'water_bottle', @items;
} keys %provisions;

print Data::Dumper->Dump([\@packed_light, \@all_wet], [qw(*packed_light *all_wet)]);

# Transform data
my @remapped_list = map {
  [ $_ => $provisions{$_} ];
} keys %provisions;

my @person_item_pairs = map {
  my $person = $_;
  my @items = @{ $provisions{$person} };
  map [$person => $_], @items;
} keys %provisions;

print Data::Dumper->Dump([\@remapped_list, \@person_item_pairs], [qw(*remapped_list *person_item_pairs)]);
