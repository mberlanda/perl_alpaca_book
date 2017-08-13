#!/usr/bin/perl

use strict;
use warnings;
use 5.014;

=head2
Modify the program from Exercise 2 to use Regexp::Assemble so you have one
pattern instead of an array of patterns.
=cut

use IO::File;
use Regexp::Assemble;

chdir('ch09');
my $fh = IO::File->new( 'patterns.txt', 'r' );

my $ra = Regexp::Assemble->new;
while( <$fh> ) {
  chomp;
  $ra->add( $_ );
}

my $compiled = $ra->re;
while( <> ) {
  print "Match at line $. | $_" if /$compiled/;
}
