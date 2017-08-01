#!/usr/bin/perl

use strict;
use warnings;
use 5.014;

use IO::Tee;

open my $read_fh, '<', 'sample';
open my $log_fh, '>>', 'castaways.log' or die "Could not open castaways.log";
open my $scalar_fh, '>>', \ my $string;
if (0) {
  my $tee_fh = IO::Tee->new( $log_fh, $scalar_fh );
  print $tee_fh "The radio works in the middle of the ocean!\n";
}
if (1) {
  my $tee_fh = IO::Tee->new( $read_fh, $log_fh, $scalar_fh );
  # reads from $read_fh, prints to $log_gh and $scalar_fh
  my $message = <$tee_fh>;
}
