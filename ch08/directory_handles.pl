#!/usr/bin/perl

use strict;
use warnings;
use 5.014;

if (0){
  opendir my $dh, '.' or die "Could not open directory: $!";
  foreach my $file ( readdir( $dh ) ) {
    print "Skipper, I found $file!\n";
  }
}
if (1){
  use IO::Dir;
  my $dir_fh = IO::Dir->new( '.' ) or die "Could not open dirhandle! $!\n";

  while( defined( my $file = $dir_fh->read ) ) {
    print "I found $file!\n";
  }
  # time passes
  $dir_fh->rewind;
  while( defined( my $file = $dir_fh->read ) ) {
    print "I can still find $file!\n";
  }
}
