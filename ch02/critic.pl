#!/usr/bin/perl
use strict;
use warnings;
use 5.014;

use Perl::Critic;
my $file = shift;
my $critic = Perl::Critic->new();
my @violations = $critic->critique($file);
print @violations;
