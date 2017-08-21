#!/usr/bin/perl

use strict;
use warnings;
use 5.014;

my $castaways_example = 0;
my $i_sorting = 1;

=head2 Fancier Sorting
comparing $a and $b , like so:
{
  if ($a < $b) { -1 }
  elsif ($b > $a) { +1 }
  else { 0 }
}

{ $a <=> $b }
=cut

if ($castaways_example) {
  my @sorted = sort qw(Gilligan Skipper Professor Ginger Mary Ann);

  my @wrongly_sorted = sort 1, 2, 4, 8, 16, 32;
  say "@wrongly_sorted";

  my @numerically_sorted = sort { $a <=> $b } @wrongly_sorted;
  say "@numerically_sorted";

  # my @numerically_descending = reverse sort { $a <=> $b } @wrongly_sorted;
  my @numerically_descending = sort { $b <=> $a } @wrongly_sorted;
  say "@numerically_descending";
}

=head2 Sorting with Indices
=cut

if ($castaways_example) {
  my @input = qw(Gilligan Skipper Professor Ginger);
  push @input, "Mary Ann";
  # say "input: @input";

  my @sorted_positions = sort { $input[$a] cmp $input[$b] } 0 .. $#input;
  # say "sorted: @sorted_positions";

  my @ranks;
  # @ranks[@sorted_positions] = (0..$#sorted_positions);
  @ranks[@sorted_positions] = (1..@sorted_positions);
  # say "rank: @ranks";

  say "$input[$_] sorts into position $ranks[$_]" for (0..$#ranks);
}

=head2 Sorting Efficiently
=cut

sub ask_monkey_about {
  my $name = shift;
  my $lname = 10 ** length($name);
  my $r = rand;
  return int($lname * $r);
}

my @castaways = qw(Gilligan Skipper Professor Ginger Mary Ann Thurston Lovey);

if ($castaways_example) {
  say "1. castaways: @castaways";

  my @wasters = sort {
    ask_monkey_about($b) <=> ask_monkey_about($a)
  } @castaways;
  say "2. wasters: @wasters";

  my @names_and_pineapples = map {
    [ $_, ask_monkey_about($_) ]
  } @castaways;
  say "3. names_and_pineapples:";
  map { say "@$_" } @names_and_pineapples;

  my @sorted_names_and_pineapples = sort {
    $b->[1] <=> $a->[1];
  } @names_and_pineapples;
  say "4. sorted_names_and_pineapples:";
  map { say "@$_" } @sorted_names_and_pineapples;

  my @names = map $_->[0], @sorted_names_and_pineapples;
  say "5. names: @names";
}

=head2 The Schwartzian Transform
my @output_data =
  map { EXTRACTION },
  sort { COMPARISON }
  map [ CONSTRUCTION ],
  @input_data;
=cut

if ($castaways_example){
  # Previous example
  my @names =
    map $_->[0], # 0-idx element
    sort { $b->[1] <=> $a->[1] } # Descending ordered 1-idx element
    map [ $_, ask_monkey_about($_) ], # map to 2-D array
    @castaways;
}

if ($i_sorting){
  my @input = @castaways;

  my @output =
    map $_->[0],
    sort { $a->[1] cmp $b->[1] }
    map [ $_, "\F$_" ],
    @input;
  say "@output";

  my @output_data =
    map $_->{ORIGINAL},
    sort { $a->{FOLDED} cmp $b->{FOLDED} }
    map { ORIGINAL => $_, FOLDED => "\F$_" },
    @input;
  say "@output_data";
}

=head2 Multilevel Sort with the Schwartzian Transform
=cut
if (0) {
  my @input_data;
  my @output_data =
    map $_->[0],
    sort {
      $a->[1] cmp $b->[1] or
      $a->[2] <=> $b->[2] or
      $a->[3] cmp $b->[3]
    }
    map [ $_, lc, get_id($_), get_name($_) ],
    @input_data;
  my @output =
   map $_->{VALUE},
    sort {
      $a->{LOWER} cmp $b->{LOWER} or
      $a->{ID} <=> $b->{ID} or
      $a->{NAME} cmp $b->{NAME}
    }
    map {
      VALUE => $_,
      LOWER => lc,
      ID => get_id($_),
      NAME => get_name($_),
    },
    @input_data;
}
