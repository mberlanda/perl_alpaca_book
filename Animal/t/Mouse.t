#!perl -T

use strict;
use warnings;
use Test::More  tests => 4;
use Test::Output;


BEGIN {
  require_ok( 'Mouse' ) || BAIL_OUT(); # print "Bail out!\n";
}
diag( "Testing Mouse $Mouse::VERSION, Perl $], $^X" );

# check that sound()
ok( defined &Mouse::sound, 'Mouse::sound is defined' );
is(Mouse->sound(), 'squeak', 'Mouse\'s sound() should be \'squeak\'');

# check that speak()
stdout_is(
  sub { Mouse->speak() },
  "an unnamed Mouse goes squeak\n[but you can barely hear it!]\n",
  'A Mouse speaks as expected'
);

# done_testing();
