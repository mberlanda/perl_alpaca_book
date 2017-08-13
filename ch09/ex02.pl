#!/usr/bin/perl

use strict;
use warnings;
use 5.014;

=head2
Write a program to read in a list of patterns from a file. Precompile
the patterns and store them in an array. For example, your patterns file might look
like:
  cocoa?n[ue]t
  Mary[−\s]+Anne?
  (The\s+)?(Skipper|Professor)

Prompt the user for lines of input, printing the line number and text for each line
that matches. The $. variable is useful here.
=cut

use IO::File;

my @patterns;

chdir('ch09');
my $fh = IO::File->new( 'patterns.txt', 'r' );

while( <$fh> ) {
  chomp;
  my $pattern = eval { qr/$_/ } or do { warn "Invalid pattern: $@"; next };
  push @patterns, $pattern;
}

while( <> ) {
  foreach my $pattern ( @patterns ) {
    say "Match of [$pattern] at line $. | $_" if /$pattern/;
  }
}
