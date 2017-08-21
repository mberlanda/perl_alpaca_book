#!/usr/bin/perl

use strict;
use warnings;
use 5.014;

=head2
Read up on the Benchmark module, included with Perl. Write a pro-
gram that will answer the question, “How much does using the Schwartzian Trans-
form speed up the task of Exercise 1?”
=cut

use Benchmark qw(timethese);

chdir;

my @files = glob '*';
say 'There are ' . @files . " files to compare";

my $ordinary = sub {
  my @sorted = sort { -s $a <=> -s $b } @files;
};

my $transform = sub {
  my @sorted =
    map $_->{NAME},
    sort { $a->{SIZE} <=> $b->{SIZE} }
    map { NAME => $_, SIZE => -s $_ },
    @files;
};

timethese( -2, {
  Ordinary => $ordinary,
  Schwartzian => $transform,
});
