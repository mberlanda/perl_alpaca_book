#!/usr/bin/perl

use strict;
use warnings;
use 5.014;

=head2
Write a program that takes multiple directory names from the com-
mand line and then prints out their contents. Use a function that takes a directory
handle reference that you made with opendir .
=cut

my @not_dirs = grep { ! -d } @ARGV;
map { say "$_ is not a directory!"} @not_dirs;

my @dirs = grep { -d } @ARGV;
my @dir_hs = map { opendir my $dh, $_; $dh } @dirs;
map { print_contents($_) } @dir_hs;

sub print_contents {
  my $dh = shift;
  while( my $file = readdir $dh ) {
    next if( $file eq '.' or $file eq '..');
    say "$file";
  }
};
