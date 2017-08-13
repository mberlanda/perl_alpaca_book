#!/usr/bin/perl

use strict;
use warnings;
use 5.014;

=head2
Get the rightmost program running (you can get the program from
the Downloads section of http://www.intermediateperl.com/ if you don’t want to
type the whole thing yourself). Once you have the example working, modify the
rightmost program, take a hash reference of patterns, and return the key of the
rightmost match. Instead of calling it like:
  my $position = rightmost(
    'There is Mrs. Howell, Ginger, and Gilligan',
    @patterns{ sort keys %patterns }
  );
call it like:
  my $key = rightmost(
    'There is Mrs. Howell, Ginger, and Gilligan',
    \%patterns
  );
=cut

my %patterns = (
  Gilligan   => qr/(?:Wiley )?Gilligan/,
  'Mary-Ann' => qr/Mary-Ann/,
  Ginger     => qr/Ginger/,
  Professor  => qr/(?:The )?Professor/,
  Skipper    => qr/Skipper/,
  'A Howell' => qr/Mrs?. Howell/,
);

my $key = rightmost(
    'There is Mrs. Howell, Ginger, and Gilligan',
    \%patterns
);
say "Rightmost character is $key";

sub rightmost {
  my( $string, $patterns ) = @_;
  my( $rightmost_position, $rightmost_key ) = ( -1, undef );

  while( my( $key, $value ) = each %$patterns ) {
    my $position = $string =~ m/$value/ ? $-[0] : -1;
    if( $position > $rightmost_position ) {
      $rightmost_key = $key;
      $rightmost_position = $position;
    }
  }
  return $rightmost_key;
}
