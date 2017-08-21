#!/usr/bin/perl

use strict;
use warnings;
use 5.016;

=head2
Using a Schwartzian Transform, read a list of words and sort them
in “dictionary order.” Dictionary order ignores all capitalization and internal punc-
tuation. Hint: The following transformation might be useful:
  my $string = 'Mary Ann';
  $string =~ tr/A-Z/a-z/;
  $string =~ tr/a-z//cd;
  print $string;
  # force all lowercase
  # strip all but a-z from the string
  # prints "maryann"
Be sure you don’t mangle the data! If the input includes the Professor and The
Skipper , the output should have them listed in that order, with that capitalization.
=cut

=solution 1
my @dictionary_sorted =
  map $_->[0],
  sort { $a->[1] cmp $b->[1] }
  map {
    my $string = $_;
    $string =~ tr/A-Z/a-z/;
    $string =~ tr/a-z//cd;
    [ $_, $string ];
  } @input_list;
=cut

my @input_list = qw(
  aSDRu1324hs 234sAERT ADGR31
);

my @dictionary_sorted =
  map $_->[0],
  sort { $a->[1] cmp $b->[1] }
  map {
    my $string = $_;
    $string =~ s/\P{Letter}//g;
    $string = fc( $string );
    [ $_, $string ];
  } @input_list;
map { say } @dictionary_sorted;
