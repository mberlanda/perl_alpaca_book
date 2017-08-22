package LivingCreature {

  our $VERSION = '0.01';

  sub speak {
    my $class = shift;
    if (@_) { print "a $class goes '@_'\n"; }
    else { print "a $class goes ", $class->sound, "\n"; }
  }
}

1;
