#!/usr/bin/perl

use strict;
use warnings;
use 5.014;

=head2 Applying a Bit of Indirection
=cut

my @input_numbers = (1, 2, 4, 8, 16, 32, 64);
my @indices_of_odd_digit_sums = grep {
  my $number = $input_numbers[$_];
  my $sum;
  $sum += $_ for split //, $number;
  $sum % 2;
} 0..$#input_numbers;

my @odd_digit_sums = @input_numbers[ @indices_of_odd_digit_sums ];

=head2
my @bigger_indices = grep {
  $_ > $#y or $x[$_] > $y[$_];
} 0..$#x;
my @bigger = @x[@bigger_indices];

my @bigger = map {
  if ($_ > $#y or $x[$_] > $y[$_]) {
    $x[$_];
  } else {
    ( );
  }
} 0..$#x;
=cut
