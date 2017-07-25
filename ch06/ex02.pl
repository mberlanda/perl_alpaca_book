#!/usr/bin/perl

use strict;
use warnings;
use 5.014;

=head2
Modify the program from Exercise 1 to use JSON instead of Storable .
=cut

use JSON;

my $all = "**all machines**";
my $filename = 'total_bytes.json';

my $total_bytes;
if (-e $filename) {
  local $/;
  open my $fh, '<:raw', $filename;
  my $json_text = <$fh>;
  $total_bytes = decode_json( $json_text );
}
while(<>) {
  next if /^#/;
  my ($source, $destination, $bytes) = split;
  $total_bytes->{$source}{$destination} += $bytes;
  $total_bytes->{$source}{$all} += $bytes;
}

sub by_all_count {
  $total_bytes->{$b}{$all} <=> $total_bytes->{$a}{$all}
}

my @sources = sort by_all_count keys %$total_bytes;
for my $source (@sources) {
  my $tb = $total_bytes->{$source};
  my @destinations = sort { $tb->{$b} <=> $tb->{$a} } keys %$tb;
  say "$source: $tb->{$all} total bytes sent";
  for my $destination (@destinations) {
    next if $destination eq $all;
    say " $source => $destination: $tb->{$destination} bytes";
  }
  say "";
}

{
  open my $fh, '>:utf8', $filename;
  print $fh to_json($total_bytes, { pretty => 1});
}
