#!/usr/bin/perl
use strict;
use warnings;
use 5.014;

{
  my @data1 = qw(one won);
  my @data2 = qw(two too to);
  push @data2, \@data1;
  push @data1, \@data2;

  # access won with an infinite number of names, such as
  say $data1[1];
  say $data2[3][1];
  say $data1[2][3][1];
  say $data2[3][2][3][1];
  say $data1[2][3][2][3][1];
  say $data2[3][2][3][2][3][1];
  say $data1[2][3][2][3][2][3][1];

  # at the end:
  @data1 = ();
  @data2 = ();
}
