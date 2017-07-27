#!/usr/bin/perl

use strict;
use warnings;
use 5.016;

=head2 Finding Out Who We Are
=cut
if (0) {
  my $countdown;
  $countdown = sub {
    state $n = 5;
    return unless $n > -1;
    say $n--;
    $countdown->();
  };
  $countdown->();

  sub countdown {
    state $n = 5;
    return unless $n > -1;
    say $n--;
    __SUB__ ->(); # Introduced in Perl 5.16
  };
  countdown();

}

=head2 Enchanting Subroutines
=cut

use experimental qw(smartmatch);

my @array = ( \ 'xyz', [qw(a b c)], sub { say 'Buster' } );
foreach (@array){
  when(ref eq ref \ '') { say "Scalar $$_" }
  when(ref eq ref []) { say "Array @$_" }
  when(ref eq ref sub {} ) { say "Sub ???" }
}





