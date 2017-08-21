#!/usr/bin/perl

use 5.014;
use strict;
use warnings;

my $string = "abcd";
my $lstring = length $string;

say ask_monkey_about($string);

sub ask_monkey_about {
  my $name = shift;
  my $lname = 10 ** length($name);
  my $r = rand;
  return int($lname * $r);
}
