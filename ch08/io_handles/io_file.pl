#!/usr/bin/perl

use strict;
use warnings;
use 5.014;

use IO::File;

# It is not suitable to mix the syntax of open and IO::File
# my $fh = IO::File->new( '> castaways.log' ) or die "Could not create filehandle: $!";

my $write_fh = IO::File->new( 'castaways.log', 'w' );
my $read_fh = IO::File->new( 'castaways.log', 'r' );
my $append_fh = IO::File->new( 'castaways.log', O_WRONLY|O_APPEND );
my $temp_fh = IO::File->new_tmpfile;
$temp_fh->close or die "Could not close file: $!";
undef $append_fh;
