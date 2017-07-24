#!/usr/bin/perl
use strict;
use warnings;
use 5.014;

my %gilligan_info = (
  name     => 'Gilligan',
  hat      => 'White',
  shirt    => 'Red',
  position => 'First Mate',
);

my $ref_to_gilligan_info;
{;
  my %gilligan_info = (
    name     => 'Gilligan',
    hat      => 'White',
    shirt    => 'Red',
    position => 'First Mate',
  );
  $ref_to_gilligan_info = \%gilligan_info;
}

# Single step with anonymous hash constructor

$ref_to_gilligan_info = {
  name => 'Gilligan',
  hat => 'White',
  shirt => 'Red',
  position => 'First Mate',
};

my $ref_to_skipper_info = {
  name     => 'Skipper',
  hat      => 'Black',
  shirt    => 'Blue',
  position => 'Captain',
};

my @crew = ($ref_to_gilligan_info, $ref_to_skipper_info);
@crew = (
  +{
    name => 'Gilligan',
    hat => 'White',
    shirt => 'Red',
    position => 'First Mate',
  },
  +{
    name     => 'Skipper',
    hat      => 'Black',
    shirt    => 'Blue',
    position => 'Captain',
  },
);


=head2
Now, a word from our parser: because blocks and anonymous hash constructors both
use curly braces in roughly the same places in the syntax tree, the compiler has to guess
which of the two we mean. If the compiler ever decides incorrectly, we might need to
provide a hint to get what we want. To show the compiler that we want an anonymous
hash constructor, put a plus sign before the opening curly brace: +{ ... } . To get a
block of code, put a semicolon (representing an empty statement) at the beginning of
the block: {; ... } .
=cut
