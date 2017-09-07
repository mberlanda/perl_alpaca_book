#!perl -T

use strict;
use warnings;
use Test::More;

subtest 'Major feature works' => sub {
  ok( defined &some_subroutine, 'Target sub is defined' );
  ok( -e $file, 'The necessary file is there' );
  is( some_subroutine(), $expected, 'Does the right thing' );
};

done_testing();
