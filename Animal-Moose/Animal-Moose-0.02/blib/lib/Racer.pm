package Racer {
  our $VERSION = '0.02';

  use Moose::Role;
  use namespace::autoclean;

  has $_ => (is => 'rw', default => 0)
    foreach qw(wins places shows losses);

  sub won { my $self = shift; $self->wins($self->wins + 1) }
  sub placed { my $self = shift; $self->places($self->places + 1) }
  sub showed { my $self = shift; $self->shows($self->shows + 1) }
  sub lost { my $self = shift; $self->losses($self->losses + 1) }

  sub standings {
    my $self = shift;
    join ", ", map { $self->$_ . " $_" } qw(wins places shows losses);
  }
}
1;

=head1 NAME

Racer - racer role

=head1 VERSION

Version 0.02

=head1 SYNOPSIS

Perhaps a little code snippet.

    use Racer;
    package RoleRacer {
      use Moose;
      use namespace::autoclean;
      with 'Racer';
      ...
      __PACKAGE__->meta->make_immutable;
    }

=head1 SUBROUTINES/METHODS

=head2 won

=head2 placed

=head2 showed

=head2 lost

=head2 standings

=head1 AUTHOR

Mauro Berlanda, C<< <kupta at cpan.org> >>

=cut

