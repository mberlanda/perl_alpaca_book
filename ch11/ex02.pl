#!/usr/bin/perl

use strict;
use warnings;
use 5.014;

=head2
Make a program that uses your library and the following code to print
out a message, such as Today is dip sen 15 2011 , meaning that today is a Monday
in August. You might use localtime :
  my($sec, $min, $hour, $mday, $mon, $year, $wday) = localtime;
Hint: The year and month numbers returned by localtime may not be what you’d
expect, so you need to check the documentation.
=cut
{
  use Cwd 'abs_path';
  use File::Basename;
  my $script_dirname = dirname(abs_path($0));
  chdir $script_dirname;
}

require 'Oogaboogoo/Date.pm';

sub message {
  my ($sec, $min, $hour, $mday, $mon, $year, $wday) = @_;
  my $day_name = Oogaboogoo::Date::day($wday);
  my $mon_name = Oogaboogoo::Date::month($mon);
  $year += 1900;
  return "Today is $day_name, $mon_name $mday, $year.";
}

# say message localtime;

use Test::More tests => 1;

my @test_time1 = qw(15 59 16 21 7 117 1);
ok( message(@test_time1) eq "Today is dip, sen 21, 2017.", 'Message with mocked localtime'  )
