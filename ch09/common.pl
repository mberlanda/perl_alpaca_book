#!/usr/bin/perl

use strict;
use warnings;
use 5.014;

=head2 Regex-Creating Modules
=cut
if (0) {
  use Regexp::Common qw(URI);
  while( <> ) {
    print if /$RE{URL}{HTTP}/;
  }
}

if (0) {
  use Regexp::Common qw(zip);
  say $RE{zip}{US};
}

=head2 Assembling Regular Expressions
=cut

if (1){
  use Regexp::Assemble;

  my $ra = Regexp::Assemble->new;
  for ( 'Mr. Howell', 'Mrs. Howell', 'Mary Ann' ) {
    $ra->add( "\Q$_" );
  }
  say $ra->re;
}
