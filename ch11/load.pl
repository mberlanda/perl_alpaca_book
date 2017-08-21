#!/usr/bin/perl

use strict;
use warnings;
use 5.014;

=head2 Inserting Code with eval
=cut

if (0){
  sub load_common_subroutines {
    open my $more_fh, '<', 'Navigation.pm' or die "Navigation.pm: $!";
    undef $/; # enable slurp mode
    my $more_code = <$more_fh>;
    close $more_fh;
    eval $more_code;
    die $@ if $@;
  }

  load_common_subroutines();
  turn_toward_heading(230);

}

=head2 Using do
=cut
if (0){
  do 'Navigation.pm';
  die $@ if $@;
  turn_toward_heading(90);
}

=head2 Using require
=cut
if (1){
  require 'Navigation.pm';
  Navigation::turn_toward_heading(90);
  say "@DropAnchor::homeport";
}
