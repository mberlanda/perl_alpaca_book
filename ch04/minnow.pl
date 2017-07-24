#!/usr/bin/perl
use strict;
use warnings;
use 5.014;

=head2 First implementation
my @required = qw(preserver sunscreen water_bottle jacket);

my %skipper = map { $_, 1 } qw(blue_shirt hat jacket preserver sunscreen);
my %gilligan = map { $_, 1 } qw(red_shirt hat lucky_socks water_bottle);
my %professor = map { $_, 1 } qw(sunscreen water_bottle slide_rule batteries radio);

foreach my $item (@required) {
  unless ( $skipper{$item} ) {
    print "Skipper is missing $item.\n";
  }
  unless ( $gilligan{$item} ) {
    print "Gilligan is missing $item.\n";
  }
  unless ( $professor{$item} ) {
    print "Professor is missing $item.\n";
  }
}

=head2 Second implementation: introducing a subroutine
sub check_required_items {
  my $who = shift;
  my %whos_items = map { $_, 1 } @_;
  my @required = qw(preserver sunscreen water_bottle jacket);
  for my $item (@required) {
    unless ( $whos_items{$item} ) {
      say "\u$who is missing $item.";
    }
  }
}
my @skipper = qw(blue_shirt hat jacket preserver sunscreen);
check_required_items('skipper', @skipper);

=head2 Third implementation: Referencing the array
sub check_required_items {
  my $who = shift;
  my $items = shift;
  my %whos_items = map { $_, 1 } @{$items};

  my @required = qw(preserver sunscreen water_bottle jacket);
  for my $item (@required) {
    unless ( $whos_items{$item} ) {
      say "\u$who is missing $item.";
    }
  }
}

=head2 Fourth implementation: Without shift
sub check_required_items {
  my %whos_items = map {$_, 1} @{$_[1]};
  my @required = qw(preserver sunscreen water_bottle jacket);
  for my $item (@required) {
    unless ( $whos_items{$item} ) {
      say "$_[0] is missing $item";
    }
  }
}
=head2 Fifth implementation: Getting our braces off
my @gilligan = qw(red_shirt hat lucky_socks water_bottle);
my @skipper = qw(blue_shirt hat jacket preserver sunscreen);
my @professor = qw(sunscreen water_bottle slide_rule batteries radio);
check_required_items('skipper', \@skipper);
check_required_items('gilligan', \@gilligan);
check_required_items('professor', \@professor);

sub check_required_items {
  my $who = shift;
  my $items = shift;

  my @required = qw(preserver sunscreen water_bottle jacket);
  foreach my $item (@required){

  }
  my %whos_items = map { $_, 1 } @{$items};
  my @missing = ();

  for my $item (@required) {
    unless ( grep $item eq $_, @$items ) {
      say "\u$who is missing $item.";
      push @missing, $item;
    }
  }

  if (@missing){
    say "Adding @missing to @$items for $who";
    push @$items, @missing;
  }
}


=cut

my @skipper = qw(blue_shirt hat jacket preserver sunscreen);
my @gilligan = qw(red_shirt hat lucky_socks water_bottle);
my @professor = qw(sunscreen water_bottle slide_rule batteries radio);
my @skipper_with_name = ('Skipper' => \@skipper);
my @gilligan_with_name = ('Gilligan' => \@gilligan);
my @professor_with_name = ('Professor' => \@professor);

my @all_with_name = (
  \@skipper_with_name,
  \@gilligan_with_name,
  \@professor_with_name,
);

check_required_items(@$_) for @all_with_name;

sub check_required_items {
  my $who = shift;
  my $items = shift;

  my @required = qw(preserver sunscreen water_bottle jacket);
  foreach my $item (@required){

  }
  my %whos_items = map { $_, 1 } @{$items};
  my @missing = ();

  for my $item (@required) {
    unless ( grep $item eq $_, @$items ) {
      say "\u$who is missing $item.";
      push @missing, $item;
    }
  }

  if (@missing){
    say "Adding @missing to @$items for $who";
    push @$items, @missing;
  }
}

