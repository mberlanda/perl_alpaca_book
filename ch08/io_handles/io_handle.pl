#!/usr/bin/perl

use strict;
use warnings;
use 5.014;

# use IO::Handle;
# since 5.14 we don't need to load it explicitly
my $filename = 'sample';
open my $fh, '>', $filename or die '...';
$fh->print( 'Coconut headphones' );
$fh->close;
