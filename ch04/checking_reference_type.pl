#!/usr/bin/perl
use strict;
use warnings;
use 5.014;

use Carp qw(croak);
use Scalar::Util qw(reftype);

sub show_hash{
  my $hash_ref = shift;
  my $ref_type = reftype $hash_ref;
  croak "I expected a hash reference"
    # unless $ref_type eq ref {};
    unless { keys %$ref_type; 1 };
  foreach my $key (%$hash_ref) {
    # ...
  }
}
