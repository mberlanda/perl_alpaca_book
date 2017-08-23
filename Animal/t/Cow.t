#!perl -T

use strict;
use warnings;
use Test::More tests => 3;

BEGIN {
  require_ok( 'Cow' ) || BAIL_OUT(); # print "Bail out!\n";
}
diag( "Testing Cow $Cow::VERSION, Perl $], $^X" );

# check that sound()
ok( defined &Cow::sound, 'Cow::sound is defined' );
is(Cow->sound(), 'moooo', 'Cow\'s sound() should be \'moooo\'')
