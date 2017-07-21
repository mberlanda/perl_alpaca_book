#!/usr/local/bin/perl
use strict;
use warnings;

use 5.014;

=head1 Trapping Errors with eval
=cut
my $total = 1;
my $count = 0;

eval { my $average = $total / $count } ;
print "Continuing after error: $@" if $@;

eval { rescue_scheme_42() } ;
print "Continuing after error: $@" if $@;

use Try::Tiny;

my $average = try { $total / $count } catch { "NaN" };
say $average;
