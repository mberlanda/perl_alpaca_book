#!perl -T

use strict;
use warnings;
use Test::More tests => 3;

BEGIN {
  require_ok( 'Person' ) || BAIL_OUT(); # print "Bail out!\n";
}
diag( "Testing Person $Person::VERSION, Perl $], $^X" );

# check that sound()
ok( defined &Person::sound, 'Person::sound is defined' );
is(Person->sound(), 'hmmmm', 'Person\'s sound() should be \'hmmmm\'')
