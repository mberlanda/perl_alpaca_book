#!/usr/bin/perl
use strict;
use warnings;
use 5.014;

=head2
Write a program that takes a list of filenames on the command line
and uses grep to select the ones whose size is less than 1,000 bytes. Use map to
transform the strings in this list, putting four space characters in front of each and
a newline character after. Print the resulting list.
e.g. $ perl ex01.pl do_block.pl  dynamic_code.pl  ex01.pl  list_operators.pl  trapping_errors.pl
=cut
map { say " " x 4 . $_; } grep {(-s) < 1000} @ARGV;
