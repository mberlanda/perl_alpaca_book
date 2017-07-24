#!/usr/bin/perl

use strict;
use warnings;
use 5.014;

=head2
Modify the crew roster program to add a location field for each castaway.
At the start, set each person’s location to “The Island.” After you’ve added
that field to each person’s hash, change the Howells’ locations to “The Island
Country Club.” Make a report of everyone’s location, like this:
  Gilligan at The Island
  Skipper at The Island
  Mr. Howell at The Island Country Club
  Mrs. Howell at The Island Country Club
Some starting code is in the Downloads section on http://www.intermediateperl.com/.
=cut

# materials/crew_location.pl
my %gilligan_info = (
  name     => 'Gilligan',
  hat      => 'White',
  shirt    => 'Red',
  position => 'First Mate',
);
my %skipper_info = (
  name     => 'Skipper',
  hat      => 'Black',
  shirt    => 'Blue',
  position => 'Captain',
);
my %mr_howell = (
  name => 'Mr. Howell',
  hat => undef,
  shirt => 'White',
  position => 'Passenger',
);
my %mrs_howell = (
  name => 'Mrs. Howell',
  hat => undef,
  shirt => 'Purple',
  position => 'Passenger',
);

my @castaways = (\%gilligan_info, \%skipper_info, \%mr_howell, \%mrs_howell);

foreach my $person (@castaways){
  if ($person->{name} =~ /Howell/){
    $person->{location} = 'The Island Country Club';
  } else {
    $person->{location} = 'The Island';
  }
  say "$person->{name} at $person->{location}";
}
