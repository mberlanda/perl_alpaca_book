#!perl
# scripts/horse.pl

use strict;
use warnings;
use Horse;

{
  my $name = "Mr. Ed";
  my $tv_horse = { Name => $name };
  bless $tv_horse, 'Horse';
  my $noise = $tv_horse->sound;
  Horse::sound($tv_horse);
  print $noise . "\n";
}
{
  my $tv_horse = Horse->named('Mr. Ed');
  print $tv_horse->name, " says ", $tv_horse->sound, "\n";
  $tv_horse->set_color('black-and-white');
  print $tv_horse->name, ' is colored ', $tv_horse->color, "\n";
}
