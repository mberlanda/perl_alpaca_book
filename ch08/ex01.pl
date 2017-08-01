#!/usr/bin/perl

use strict;
use warnings;
use 5.014;

=head2
Write a program that prints the today’s date and the day of the week,
but allows the user to choose to send the output to a file, a scalar, or both at the
same time. No matter which one the user selects, send the output with a single
print statement. If the user chooses to send the output to a scalar, at the end of
the program print the scalar’s value to standard output.
=cut

use IO::Tee;
use IO::File;

my $fh;
my $scalar;
print 'Enter type of output [Scalar/File/Tee]> ';

my $type = <STDIN>;
if( $type =~ /^s/i ) {
  open $fh, '>', \$scalar;
}
elsif( $type =~ /^f/i ) {
  my $fh = IO::File->new( '$0.out', 'w' );
}
elsif( $type =~ /^t/i ) {
  my $file_fh = IO::File->new( '$0.out', 'w' );
  open my $scalar_fh, '>', \$scalar;
  $fh = IO::Tee->new( $file_fh, $scalar_fh );
}

my $date = localtime;
my $day_of_week = (localtime)[6];

print $fh <<"HERE";
This is run $$
The date is $date
The day of the week is $day_of_week
HERE

print STDOUT <<"HERE" if $type =~ m/^[st]/i;
Scalar contains:
$scalar
HERE
