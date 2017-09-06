#!perl -T

use strict;
use warnings;
use Test::More tests => 5;
use Test::Output;

BEGIN {
  require_ok( 'Sheep' ) || BAIL_OUT(); # print "Bail out!\n";
}
diag( "Testing Sheep $Sheep::VERSION, Perl $], $^X" );

# check that sound()
ok( defined &Sheep::sound, 'Sheep::sound is defined' );
is(Sheep->sound(), 'baaaah', 'Sheep\'s sound() should be \'baaaah\'');

# check name() method
{
  my $name = "Mr. Ed";
  my $tv_sheep = Sheep->new( name => $name );

  is( $tv_sheep->name, $name, 'Sheep name() works as expected' );
  is( $tv_sheep->color, $tv_sheep->default_color, 'Sheep color() works as expected' );
}
