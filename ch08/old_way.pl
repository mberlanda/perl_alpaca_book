#!/usr/bin/perl

use strict;
use warnings;
use 5.014;

=head2 The Old Way
=cut

open LOG_FH, '>>', 'castaways.log' or die "Could not open castaways.log: $!";
log_message( *LOG_FH, 'The Globetrotters are stranded with us!' );
log_message( \*LOG_FH, 'An astronaut passes overhead' );

sub log_message {
  local *FH = shift;
  print FH @_, "\n";
}
