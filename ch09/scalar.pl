#!/usr/bin/perl

use strict;
use warnings;
use 5.014;
use experimental qw(smartmatch);

=head2 Regexes as Scalars
=cut

if (0) {
  my @patterns = (
    qr/(?:Willie )?Gilligan/,
    qr/Mary Ann/,
    qr/Ginger/,
    qr/(?:The )?Professor/,
    qr/Skipper/,
    qr/Mrs?. Howell/,
  );
  my $name = 'Ginger';

  foreach my $pattern ( @patterns ) {
    if( $name ~~ $pattern ) {
      say "Match!";
      last;
    }
  }
  say "Match!" if $name ~~ @patterns;
}

if (1) {
  my %patterns = (
    Gilligan => qr/(?:Willie )?Gilligan/,
    'Mary Ann' => qr/Mary Ann/,
    Ginger => qr/Ginger/,
    Professor => qr/(?:The )?Professor/,
    Skipper => qr/Skipper/,
    'A Howell' => qr/Mrs?. Howell/,
  );

  my $name = 'Ginger';
  my( $match ) = grep { $name =~ $patterns{$_} } keys %patterns;
  say "Matched $match" if $match;
}

=head2 Rightmost
=cut

if (1) {
  sub rightmost {
    my( $string, @patterns ) = @_;
    my $rightmost = -1;
    while( my( $i, $pattern ) = each @patterns ) {
      my $position = $string =~ m/$pattern/ ? $-[0] : -1;
      $rightmost = $position if $position > $rightmost;
    }
    return $rightmost;
  }

  my %patterns = (
    Gilligan => qr/(?:Willie )?Gilligan/,
    'Mary Ann' => qr/Mary Ann/,
    Ginger => qr/Ginger/,
    Professor => qr/(?:The )?Professor/,
    Skipper => qr/Skipper/,
    'A Howell' => qr/Mrs?. Howell/,
  );

  my $position = rightmost(
    'There is Mrs. Howell, Ginger, and Gilligan',
    @patterns{ sort keys %patterns }
  );
  say "Rightmost match at position $position";
}
