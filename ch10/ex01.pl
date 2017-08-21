#!/usr/bin/perl

use strict;
use warnings;
use 5.014;

=head2
Using the glob operator, a naïve sort of every name in your home
directory by their relative sizes might be written as:
  chdir; # the default is our home directory
  my @sorted = sort { -s $a <=> -s $b } glob '*';
Rewrite this using the Schwartzian Transform technique.
=cut

chdir;

my @sorted =
  map $_->{NAME},
  sort { $a->{SIZE} <=> $b->{SIZE} }
  map { NAME => $_, SIZE => -s $_ },
  glob '*';
say join "\n", @sorted;
