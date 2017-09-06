package AnimalRole {
  use Moose::Role;
  use namespace::autoclean;

  requires qw( sound );
  has 'name' => ( is => 'rw' );
  has 'color' => ( is => 'rw' );

  sub speak {
    my $self = shift;
    print $self->name, " goes ", $self->sound, "\n";
  }
}
1;
