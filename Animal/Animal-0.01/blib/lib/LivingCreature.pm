package LivingCreature {

  use 5.006;
  use strict;
  use warnings;

  our $VERSION = '0.01';

  sub speak {
    my $class = shift;
    if (@_) { print "a $class goes '@_'\n"; }
    else { print "a $class goes ", $class->sound, "\n"; }
  }
}

=head1 NAME

LivingCreature

=head1 VERSION

Version 0.01

=head1 SUBROUTINES/METHODS

=head2 speak

=cut
1; # End of LivingCreature
