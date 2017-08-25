#!perl -T

use strict;
use warnings;
use Time::Mock;

package MyDate {
  use Carp;
  use vars qw($AUTOLOAD);

  my %Allowed_methods = qw(day 3 month 4 year 5);
  my @Offsets = qw(0 0 0 0 1 1900 0 0 0);

  sub new { bless {}, $_[0] }

  sub DESTROY {}

  sub AUTOLOAD {
    my $method = $AUTOLOAD;
    $method =~ s/.*:://;

    unless( exists $Allowed_methods{ $method } ) {
      carp "Unknown method: $AUTOLOAD";
      return;
    }

    my $slice_index = $Allowed_methods{ $method };
    return (localtime)[$slice_index] + $Offsets[$slice_index];
  }
}

# Mock time for test consistency
Time::Mock->set("2017-08-01 17:48");

use Test::More tests => 8;

# Exercise 1

# Test method definition
ok( defined &MyDate::new, 'MyDate::new is defined' );
ok( defined &MyDate::AUTOLOAD, 'MyDate::AUTOLOAD is defined' );
ok( defined &MyDate::DESTROY, 'MyDate::DESTROY is defined' );

my $date = MyDate->new();
is($date->day, 1, 'day() should return the day');
is($date->month, 8, 'month() should return the month');
is($date->year, 2017, 'year() should return the year');

# Exercise 2

sub UNIVERSAL::debug {
  my $self = shift;
  my $when = localtime;
  my $message = join '|', @_;
  "[$when] $message\n";
}

ok($date->DOES('UNIVERSAL'), 'MyDate instance does UNIVERSAL');
is($date->debug("I'm all done"), "[Tue Aug  1 17:48:00 2017] I'm all done\n",
   'MyDate instance implement debug method from UNIVERSAL');
