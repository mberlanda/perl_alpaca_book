#!perl -T

use strict;
use warnings;
use Test::More tests => 3;

BEGIN {
  require_ok( 'Sheep' ) || BAIL_OUT(); # print "Bail out!\n";
}
diag( "Testing Sheep $Sheep::VERSION, Perl $], $^X" );

# check that sound()
ok( defined &Sheep::sound, 'Sheep::sound is defined' );
is(Sheep->sound(), 'baaaah', 'Sheep\'s sound() should be \'baaaah\'')
