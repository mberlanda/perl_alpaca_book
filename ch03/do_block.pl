#!/usr/local/bin/perl
use strict;
use warnings;

use 5.014;

=head1 The do Block
my $bowler;
if( ...some condition... ) {
  $bowler = 'Mary Ann';
}
elsif( ... some condition ... ) {
  $bowler = 'Ginger';
}
else {
  $bowler = 'The Professor';
};

my $bowler = do {
  if( ... some condition ... ) { 'Mary Ann' }
  elsif( ... some condition ... ) { 'Ginger' }
  else { 'The Professor' }
};
=cut
my $filename = 'README.md';

my $file_contents = do {
  local $/;
  local @ARGV = ( $filename );
  <>
};

BEGIN { # what use is really doing
  require List::Util;
  List::Util->import();
}
