#!perl -T

use strict;
use warnings;
use Test::More;
use Test::Output;

sub print_hello { print STDOUT "Welcome Aboard!\n" }
sub print_error { print STDERR "There's a hole in the ship!\n" }

stdout_is( \&print_hello, "Welcome Aboard\n" );
stderr_like( \&print_error, qr/ship/ );

stdout_is( sub { print "Welcome Aboard" }, "Welcome Aboard" );
stdout_is { print "Welcome Aboard" } "Welcome Aboard";

{
  use Test::Warn;
  sub add_letters { "Skipper" + "Gilligan" }
  warning_like { add_letters() } qr/numeric/;
}
{
  use Test::NoWarnings;
  my( $n, $m );
  # use an uninitialized value
  my $sum = $n + $m;
}

done_testing();
