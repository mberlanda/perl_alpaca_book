#!perl -T

use strict;
use warnings;
use Test::More  tests => 14;
use Test::Output;


BEGIN {
  require_ok( 'RaceHorse' ) || BAIL_OUT(); # print "Bail out!\n";
}
diag( "Testing RaceHorse $RaceHorse::VERSION, Perl $], $^X" );

# check that methods definition
ok( defined &RaceHorse::named, 'RaceHorse::named is defined' );
ok( defined &RaceHorse::won, 'RaceHorse::won is defined' );
ok( defined &RaceHorse::placed, 'RaceHorse::placed is defined' );
ok( defined &RaceHorse::showed, 'RaceHorse::showed is defined' );
ok( defined &RaceHorse::lost, 'RaceHorse::lost is defined' );
ok( defined &RaceHorse::standings, 'RaceHorse::standings is defined' );

{
  my $racer = RaceHorse->named("Billy Boy");
  is($racer->name, 'Billy Boy', 'named() created an instance of RaceHorse as expected');
  $racer->won;
  $racer->won;
  $racer->won;
  $racer->showed;
  $racer->placed;
  $racer->lost;
  is($racer->standings,
    '3 wins, 1 places, 1 shows, 1 losses',
    'standings() returns the value of won, placed, showed and lost'
  );
  {
    my $new_racer = RaceHorse->named("Billy Boy");
    is($new_racer->standings,
      '0 wins, 0 places, 0 shows, 0 losses',
      'standings() returns the value of won, placed, showed and lost'
    );
  }
  {
    my $racer = RaceHorse->named("Billy Boy");
    stdout_is( sub { undef $racer }, "[Billy Boy has died.]\n[Billy Boy has gone off to the glue factory.]\n",
      'RaceHorse DESTROY() when SUPER::DESTROY is defined');
  }
  {
    my $racer = RaceHorse->named("Billy Boy");
    local *Horse::DESTROY;
    stdout_is( sub { undef $racer }, "[Billy Boy has died.]\n",
      'RaceHorse DESTROY() when Horse::DESTROY is not defined');
  }
  {
    my $racer = RaceHorse->named("Billy Boy");
    local *Animal::DESTROY;
    stdout_is( sub { undef $racer }, "[Billy Boy has gone off to the glue factory.]\n",
      'RaceHorse DESTROY() when Animal::DESTROY is not defined');
  }
  {
    my $racer = RaceHorse->named("Billy Boy");
    local *Horse::DESTROY;
    local *Animal::DESTROY;
    stdout_is( sub { undef $racer }, "",
      'RaceHorse DESTROY() when Animal::DESTROY and Horse::DESTROY are not defined');
  }
}
