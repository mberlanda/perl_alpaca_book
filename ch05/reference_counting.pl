#!/usr/bin/perl
use strict;
use warnings;
use 5.014;

my @skipper = qw(blue_shirt hat jacket preserver sunscreen);
my $ref_to_skipper = \@skipper;
my $second_ref_to_skipper = $ref_to_skipper;
my $third_ref_to_skipper = \@skipper;

# We can add and remove references as we wish, and as long as the reference count doesn’t hit zero
# check_provisions_list(\@skipper)

# kill off each reference by using the variable for something other than a reference to the value of @skipper
$ref_to_skipper = undef;

# bare block
{
  my $ref = \@skipper;
}


my $ref;
{
  my @skipper = qw(blue_shirt hat jacket preserver sunscreen); # ref count is 1
  $ref = \@skipper; # ref count is 2
  say "$ref->[2]"; # prints jacket

}

say "$ref->[2]"; # still prints jacket # ref count is 1

# Until the value of $ref changes, or $ref itself disappears, we can still use all the dereferencing strategies
push @$ref, 'sextant'; # add a new provision
say "$ref->[-1]"; # prints sextant

my $copy_of_ref = $ref; # equivalent to my $copy_of_ref = \@$ref;

# Data stays alive until we destroy the last reference
$ref = undef; # not yet...
$copy_of_ref = undef; # poof!
