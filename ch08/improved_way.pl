#!/usr/bin/perl

use strict;
use warnings;
use 5.014;

=head2 The Improved Way
=cut
if (0){
  open my $log_fh, '>>', 'castaways.log' or die "Could not open castaways.log: $!";
  print { $log_fh } "We have no bananas today!\n";

  $_ = 'Salt water batteries';
  print;
  print STDOUT;
  print STDERR;

  sub log_message {
    my $fh = shift;
    print $fh @_, "\n";
  }
}
{
  open my $log_fh, '<', 'castaways.log' or die "Could not open castaways.log: $!";
  while( <$log_fh> ) { print; }
  if( -t $log_fh ) { print; }
  my $line = readline $log_fh;
  close $log_fh;
}
