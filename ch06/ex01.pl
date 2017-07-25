#!/usr/bin/perl

use strict;
use warnings;
use 5.014;

=head2
The program from Exercise 2 in Chapter 5 needs to read the entire
data file each time it runs. However, the Professor has a new router logfile each
day and doesn’t want to keep all that data in one giant file that takes longer and
longer to process.
Fix up that program to keep the running totals in a data file so the Professor can
run it on each day’s logs to get the new totals. Use the Storable module.
=cut

use Storable qw(nstore retrieve);

my $all = "**all machines**";
my $filename = 'total_bytes.data';

my %total_bytes;
if (-e $filename) {
  my $data = retrieve $filename;
  %total_bytes = %$data;
}
while(<>) {
  next if /^#/;
  my ($source, $destination, $bytes) = split;
  $total_bytes{$source}{$destination} += $bytes;
  $total_bytes{$source}{$all} += $bytes;
}

sub by_all_count {
  $total_bytes{$b}{$all} <=> $total_bytes{$a}{$all}
}

my @sources = sort by_all_count keys %total_bytes;
for my $source (@sources) {
  my $tb = $total_bytes{$source};
  my @destinations = sort { $tb->{$b} <=> $tb->{$a} } keys %$tb;
  say "$source: $tb->{$all} total bytes sent";
  for my $destination (@destinations) {
    next if $destination eq $all;
    say " $source => $destination: $tb->{$destination} bytes";
  }
  say "";
}
nstore \%total_bytes, $filename;
