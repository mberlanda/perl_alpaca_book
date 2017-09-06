#!perl -T

use strict;
use warnings;
use Test::More tests => 5;
use Test::Output;

BEGIN {
  require_ok( 'Cow' ) || BAIL_OUT(); # print "Bail out!\n";
}
diag( "Testing Cow $Cow::VERSION, Perl $], $^X" );

# check that sound()
ok( defined &Cow::sound, 'Cow::sound is defined' );
is(Cow->sound(), 'moooooo', 'Cow\'s sound() should be \'moooooo\'');

# check name() method
{
  my $name = "Mr. Ed";
  my $tv_cow = Cow->new( name => $name );

  is( $tv_cow->name, $name, 'Cow name() works as expected' );
  is( $tv_cow->color, $tv_cow->default_color, 'Cow color() works as expected' );
}
