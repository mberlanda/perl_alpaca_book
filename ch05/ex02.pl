#!/usr/bin/perl

use strict;
use warnings;
use 5.014;

=head2
The Professor’s data file (mentioned earlier in this chapter) is available
as coconet.dat in the Download section of http://www.intermediateperl.com/. There
may be comment lines (beginning with a # ); be sure to skip them. (That is, your
program should skip them. You might find a helpful hint if you read them!) Here
are the first data lines in the file:
  gilligan.crew.hut lovey.howell.hut 4721
  thurston.howell.hut lovey.howell.hut 4046
  professor.hut ginger.girl.hut 5768
  gilligan.crew.hut laser3.copyroom.hut 9352
  gilligan.crew.hut maryann.girl.hut 1180
  fileserver.copyroom.hut thurston.howell.hut 2548
  skipper.crew.hut gilligan.crew.hut 1259
  fileserver.copyroom.hut maryann.girl.hut 248
  fileserver.copyroom.hut maryann.girl.hut 798
  skipper.crew.hut maryann.girl.hut 1921
Modify the code from this chapter so that each source machine’s portion of the
output shows the total bytes from that machine. List the source machines in order
from most to least data transferred. Within each group, list the destination ma-
chines in order from most to least data transferred to that target from the source
machine:
  professor.hut => gilligan.hut: 1845
  professor.hut => maryann.hut: 90
The result should be that the machine that sent the most data will be the first source
machine in the list, and the first destination should be the machine to which it sent
the most data. The Professor can use this printout to reconfigure the network for
efficiency.
perl ex02.pl materials/coconet.dat
=cut

my $all = "**all machines**";

my %total_bytes;
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
