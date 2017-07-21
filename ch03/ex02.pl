#!/usr/bin/perl
use strict;
use warnings;
use 5.014;

=head2
Write a program that asks the user to enter a pattern (regular expres-
sion). Read this as data from standard input; don’t get it from the command line
arguments. Report a list of files in some hardcoded directory (such as "/etc" or
'C:\\Windows' ) whose names match the pattern. Repeat this until the user enters
an empty string instead of a pattern. The user should not type the slashes tradi-
tionally used to delimit pattern matches in Perl; the input pattern is delimited by
the trailing newline. Ensure that a faulty pattern, such as one with unbalanced
parentheses, doesn’t crash the program
=cut

use Cwd;

chdir;
my $dir = getcwd();

LOOP: {
  say "Please enter a regex pattern to match in $dir:";
  chomp(my $pattern = <STDIN>);
  last unless( defined $pattern && length $pattern );
  map { say " " x 4 . $_; } grep { eval {/$pattern/} } glob(".* *");
  redo LOOP;
}
