#!/usr/bin/perl

use strict;
use warnings;
use 5.014;

use IO::Scalar;

my $string_log = '';
my $scalar_fh = IO::Scalar->new( \$string_log );
print $scalar_fh "The Howells' private beach club is closed\n";

while( <$scalar_fh> ) {
  next unless /Gilligan/;
  print;
}
