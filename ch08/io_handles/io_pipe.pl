#!/usr/bin/perl

use strict;
use warnings;
use 5.014;

use IO::Pipe;

my $pipe = IO::Pipe->new;

if (0) {
  $pipe->reader( "$^X -V" ); # $^X is the current perl executable
  while( <$pipe> ) {
    print "Read: $_";
  }
}
if (1) {
  my $command = "echo 5";
  $pipe->writer( $command );
  foreach ( 1..10 ) {
    print $pipe "I can count to $_\n";
  }
}
