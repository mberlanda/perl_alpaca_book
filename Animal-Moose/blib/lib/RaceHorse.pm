package RaceHorse {
  our $VERSION = '0.02';

  use Moose;
  use namespace::autoclean;

  extends 'Horse';
  with 'Racer';

  __PACKAGE__->meta->make_immutable;
}
1;

=head1 NAME

RaceHorse - Horse subclass and racer consumer

=head1 VERSION

Version 0.02

=head1 SYNOPSIS

    use RaceHorse;
    my $foo = RaceHorse->new(name => "blahblah");
    $foo->won();

=head1 SUBROUTINES/METHODS

=head1 AUTHOR

Mauro Berlanda, C<< <kupta at cpan.org> >>
=cut
