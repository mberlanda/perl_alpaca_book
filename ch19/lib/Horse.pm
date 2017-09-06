package Horse {
  use Moose;
  use namespace::autoclean;

  has 'name' => ( is => 'rw' );
  has 'color' => ( is => 'rw' );
  # no Moose;
  __PACKAGE__->meta->make_immutable;
}
1;
