#!/usr/bin/perl

use strict;
use warnings;
use 5.014;

=head2
Starting with your data structure from Exercise 2, rewrite the
coconet.dat file so that it’s in the same format, but sorted by source machine. Report
each destination machine once per source machine along with total bytes trans-
ferred. The destination machines should be indented under the source machine
name and be sorted by the machine name:
  ginger.hut
    maryann.hut 13744
  professor.hut
    gilligan.hut 1845
    maryann.hut 90
  thurston.howell.hut
    lovey.howell.hut 97560
perl ex03.pl materials/coconet.dat
=cut

my %total_bytes;
while(<>) {
  next if /^#/;
  my ($source, $destination, $bytes) = split;
  $total_bytes{$source}{$destination} += $bytes;
}
for my $source (sort keys %total_bytes) {
  say $source;
  my $tb = $total_bytes{$source};
  foreach(sort keys %$tb) {
    say "  $_ $tb->{$_}";
  }
}
