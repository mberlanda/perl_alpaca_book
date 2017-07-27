#!/usr/bin/perl

use strict;
use warnings;
use 5.016;

=head2 Dumping Closures
=cut

use Data::Dump::Streamer;
my @luxuries = qw(Diamonds Furs Caviar);
my $hash = {
  Gilligan => sub { say 'Howdy Skipper!' },
  Skipper => sub { say 'Gilligan!!!!'},
  'Mr. Howell' => sub { say 'Money money money!' },
  Ginger => sub { say $luxuries[rand @luxuries] },
};

Dump $hash;
