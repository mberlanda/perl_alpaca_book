#!/usr/bin/perl

use strict;
use warnings;
use 5.014;

=head2
The Oogaboogoo natives on the island have unusual names for the
days and months. Here is some simple but not very well-written code from Gilligan.
Fix it up, add a conversion function for the month names, and make the whole
thing into a library. For extra credit, add suitable error checking and consider what
should be in the documentation:
  @day = qw(ark dip wap sen pop sep kir);
  sub number_to_day_name { my $num = shift @_; $day[$num]; }
  @month = qw(diz pod bod rod sip wax lin sen kun fiz nap dep);
=cut

{
  use Cwd 'abs_path';
  use File::Basename;
  my $script_dirname = dirname(abs_path($0));
  chdir $script_dirname;
}

require 'Oogaboogoo/Date.pm';

{
  use Test::More tests => 6;
  use Test::Exception;

  dies_ok( sub { Oogaboogoo::Date::day(-1) }, 'Oogaboogoo::Date::day(-1) expecting to die' );
  dies_ok( sub { Oogaboogoo::Date::day(7) }, 'Oogaboogoo::Date::day(7) expecting to die' );
  dies_ok( sub { Oogaboogoo::Date::month(-1) }, 'Oogaboogoo::Date::month(-1) expecting to die' );
  dies_ok( sub { Oogaboogoo::Date::month(12) }, 'Oogaboogoo::Date::month(12) expecting to die' );

  ok( Oogaboogoo::Date::day(0) eq 'ark', 'Oogaboogoo::Date::day() eq ark');
  ok( Oogaboogoo::Date::month(1) eq 'pod', 'Oogaboogoo::Date::month() eq pod');
}
