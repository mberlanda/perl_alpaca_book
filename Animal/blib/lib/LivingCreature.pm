package LivingCreature {

  our $VERSION = '0.01';

=head1 NAME

LivingCreature

=head1 VERSION

Version 0.01

=cut

  sub speak {
    my $class = shift;
    if (@_) { print "a $class goes '@_'\n"; }
    else { print "a $class goes ", $class->sound, "\n"; }
  }
}

1; # End of LivingCreature
