#!perl -T

use strict;
use warnings;
use Test::More;
use Test::LongString;

is( "Hello Perl", "Hello perl" );

is_string(
  "The quick brown fox jumped over the lazy dog\n" x 10,
  "The quick brown fox jumped over the lazy dog\n" x 9 .
  "The quick brown fox jumped over the lazy camel",
);

done_testing();
