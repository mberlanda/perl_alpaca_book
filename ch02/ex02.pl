#!/usr/bin/perl
use strict;
use warnings;
use 5.014;

=head2
Install the local::lib module and use it when you install
Module::CoreList (or another module if you like). Write a program that reports the
name and first release date for all the modules in Perl v5.14.2. Read the documen-
tation for local::lib to see if it has special installation instructions.

$ sudo cpanm local::lib
or https://metacpan.org/pod/local::lib#SYNOPSIS
=cut

use local::lib;
use Module::CoreList;
use List::Util qw(max);

my @modules = sort keys %{$Module::CoreList::version{5.014002}};

=head2 Naif max_length
my $max_length = -1;
foreach(@modules){
  $max_length = length if length > $max_length;
}
=cut
my $max_length = max map { length } @modules;

foreach(@modules){
  printf "%*s %s\n", -$max_length, $_, Module::CoreList->first_release;
}
