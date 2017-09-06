package HorseRole {
  use Moose;
  use namespace::autoclean;

  with 'AnimalRole';
  sub sound { 'neigh' }
  __PACKAGE__->meta->make_immutable;
}
1;
