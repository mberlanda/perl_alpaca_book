#!/usr/bin/perl

use strict;
use warnings;
use 5.014;

=head2
Using the final version of check_required_items , write a subroutine check_items_for_all that takes as its only parameter a reference to a hash whose
keys are the people aboard the Minnow and whose corresponding values are array references of the things they intend to bring on board.
For example, the hash reference might be constructed like so:
  my @gilligan = (... gilligan items ...);
  my @skipper = (... skipper items ...);
  my @professor = (... professor items ...);
  my %all = (
    Gilligan => \@gilligan,
    Skipper => \@skipper,
    Professor => \@professor,
  );
  check_items_for_all(\%all);
The newly constructed subroutine should call check_required_items for each person in the hash, updating their provisions list to include the required items.
Some starting code is in the Downloads section on http://www.intermediateperl.com/.
=cut

# materials/check_items_for_all.pl
my @skipper   = qw(blue_shirt hat jacket preserver sunscreen);
my @professor = qw(sunscreen water_bottle slide_rule batteries radio);
my @gilligan  = qw(red_shirt hat lucky_socks water_bottle);

my %all = (
  Gilligan  => \@gilligan,
  Skipper   => \@skipper,
  Professor => \@professor,
);

check_items_for_all(\%all);

sub check_items_for_all {
  my $all = shift;
  foreach(sort keys %$all){
    check_required_items($_, $all->{$_});
  }
}

# materials/check_required_items.pl
sub check_required_items {
  my $who = shift;
  my $items = shift;

  my %whose_items = map { $_, 1 } @$items;

  my @required = qw(preserver sunscreen water_bottle jacket);
  my @missing = ( );

  for my $item (@required) {
    unless ( $whose_items{$item} ) { # not found in list?
    print "$who is missing $item.\n";
    push @missing, $item; }
  }

  if (@missing) {
    print "Adding @missing to @$items for $who.\n";
    push @$items, @missing;
  }
}
