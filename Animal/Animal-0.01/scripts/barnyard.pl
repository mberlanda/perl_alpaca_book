#!/usr/bin/perl -w

use Cow;
use Horse;
use Mouse;
use Sheep;

my @barnyard = ();
{
  print "enter an animal (empty to finish): ";
  chomp(my $animal = <STDIN>);
  $animal = ucfirst lc $animal;
  last unless $animal =~ /^(Cow|Horse|Sheep|Mouse)$/;
  push @barnyard, $animal;
  redo;
}

foreach my $beast (@barnyard) {
  $beast->speak;
}
