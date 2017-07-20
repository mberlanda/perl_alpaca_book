#!/usr/bin/perl
use strict;
use warnings;
use 5.014;

=head2
Read the list of files in the current directory and convert the names
to their full path specification. Don’t use the shell or an external program to get
the current directory. The File::Spec and Cwd modules, both of which come with
Perl, should help. Print each path with four spaces before it and a newline after it.
=cut
use Cwd;
use File::Spec::Functions;

my $cwd = getcwd;
foreach(glob( ".* *" )){
  say " " x 4 . catfile( $cwd, $_ );
}
