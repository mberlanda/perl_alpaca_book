#!/usr/bin/perl

use strict;
use warnings;
use 5.014;

use IO::Null;

my $Debug = 0;
my $debug_fh = $Debug ? *STDOUT : IO::Null->new;
$debug_fh->print( "Hey, the radio's not working!" );

{
  # use IO::Interactive;
  use IO::Interactive qw(interactive);
  print { interactive } 'Bamboo car frame';
}
