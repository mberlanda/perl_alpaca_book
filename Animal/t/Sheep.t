#!perl -T

use strict;
use warnings;
use Test::More tests => 5;

BEGIN {
  require_ok( 'Sheep' ) || BAIL_OUT(); # print "Bail out!\n";
}
diag( "Testing Sheep $Sheep::VERSION, Perl $], $^X" );

# check that sound()
ok( defined &Sheep::sound, 'Sheep::sound is defined' );
is(Sheep->sound(), 'baaaah', 'Sheep\'s sound() should be \'baaaah\'');

# check default_color()
ok( defined &Sheep::default_color, 'Sheep::default_color is defined' );
is(Sheep->default_color(), 'white', 'Sheep default_color() is white');
