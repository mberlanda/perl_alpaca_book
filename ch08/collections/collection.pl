#!/usr/bin/perl

use strict;
use warnings;
use 5.014;

=head2 Collections of Filehandlescollection.pl
This example is to run using the coconet.dat as argument
=cut

if (1) {
  while( <> ) {
    state $fhs;
    my( $source, $destination, $bytes ) = split;
    unless( $fhs->{$source} ) {
      open my $fh, '>>', $source or die '...';
      $fhs->{$source} = $fh;
    }
    say { $fhs->{$source} } "$destination $bytes";
  }
}
