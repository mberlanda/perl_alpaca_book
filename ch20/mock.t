#!perl -T

use strict;
use warnings;
use Test::More;
use Test::MockObject;

# my $Minnow = Real::Object::Class->new( ... );
my $Minnow = Test::MockObject->new();

$Minnow->set_true( 'engines_on' );
$Minnow->set_true( 'has_maps' );
$Minnow->set_false( 'moored_to_dock' );

ok( $Minnow->engines_on, "Engines are on" );
ok( ! $Minnow->moored_to_dock, "Not moored to the dock" );

SKIP:{
  skip 'Island::Plotting is not available', 1 unless eval { require Island::Plotting };
  my $Quartermaster = Island::Plotting->new(
    ship => $Minnow,
    # ...
  );
  ok( $Quartermaster->has_maps, "We can find the maps" );
}


{
  my $db = Test::MockObject->new();
  # $db = DBI->connect( ... );
  $db->mock(
    list_names => sub { qw( Gilligan Skipper Professor ) }
  );

  my @names = $db->list_names;
  is( scalar @names, 3, 'Got the right number of results' );
  is( $names[0], 'Gilligan', 'The first result is Gilligan' );
  print "The names are @names\n";
}

done_testing();
