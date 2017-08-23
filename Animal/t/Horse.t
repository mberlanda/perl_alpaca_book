#!perl -T

use strict;
use warnings;
use Test::More tests => 3;

BEGIN {
  require_ok( 'Horse' ) || BAIL_OUT(); # print "Bail out!\n";
}
diag( "Testing Horse $Horse::VERSION, Perl $], $^X" );

# check that sound()
ok( defined &Horse::sound, 'Horse::sound is defined' );
is(Horse->sound(), 'neigh', 'Horse\'s sound() should be \'neigh\'')
