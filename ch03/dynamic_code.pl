#!/usr/local/bin/perl
use strict;
use warnings;

use 5.014;

=head1 Dynamic Code with eval
=cut

foreach my $operator ( qw(+ − * /) ) {
  my $result = eval "2 $operator 2";
  say "2 $operator 2 is $result";
}

say 'The quotient is ', eval '5 /';
warn $@ if $@;
