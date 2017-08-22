package Mouse {
  use strict;
  use warnings;

  use parent qw(Animal);

  sub sound { 'squeak' }

  sub speak {
    my $class = shift;
    # print "a $class goes ", $class->sound, "!\n";
    # $class->Animal::speak(@_);
    $class->SUPER::speak;
    print "[but you can barely hear it!]\n";
  }
}

1; # End of Mouse
