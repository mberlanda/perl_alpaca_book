#!perl -T

use Test::More tests => 9;

BEGIN {
  require_ok( 'HorseRole' ) || BAIL_OUT(); # print "Bail out!\n";
}

# they have to be defined in HorseRole.pm
ok( defined &HorseRole::name, 'HorseRole::name is defined' );
ok( defined &HorseRole::color, 'HorseRole::color is defined' );

{
  my $tv_horse = HorseRole->new;
  is($tv_horse->name, undef, 'name() is undef by default');
  is($tv_horse->color, undef, 'color() is undef by default');
}

{
  my $tv_horse = HorseRole->new;
  $tv_horse->name("Mr. Ed");
  $tv_horse->color("black");
  is($tv_horse->name, 'Mr. Ed', 'name() is defined by the setter');
  is($tv_horse->color, 'black', 'color() is defined by the setter');
}
{
  my $tv_horse = HorseRole->new( name => "Mr. Ed", color => "black" );
  is($tv_horse->name, 'Mr. Ed', 'name() is defined by the initializer');
  is($tv_horse->color, 'black', 'color() is defined by the initializer');
}
