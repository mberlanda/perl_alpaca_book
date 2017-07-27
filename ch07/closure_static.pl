#!/usr/bin/perl

use strict;
use warnings;

=head2 Closure Variables as Static Local Variables
=cut
{
  use 5.014;

  count_one();
  count_one();
  count_one();
  say 'we have seen ', count_so_far(), " coconuts!";

  {
    my $count;
    sub count_one { ++$count; }
    sub count_so_far { return $count; }
  }

  count_down();
  count_down();
  count_down();
  say 'we have down to ', count_remaining(), " coconuts!";

  BEGIN {
    my $countdown = 10;
    sub count_down { $countdown--; }
    sub count_remaining { return $countdown; }
  }
}

=head2 state Variables
=cut
{
  use 5.010;

  sub countdown {
    state $countdown = 10;
    $countdown--;
  }

  # say countdown(); # 10
  # say countdown(); # 9

  # Keep track of the comparison in a sort block
  my @array = qw( a b c d e f 1 2 3 );
  say sort {
    state $n = 0;
    say $n++, ": a[$a] b[$b]";
    $a cmp $b;
  } @array;

  # Keep track of the original position with map
  if (0){
    my @sorted_lines_tuples =
      sort { $b->[1] <=> $a->[1] }
      map { state $l = 0; [ $l++, $_ ] }
      <>;
  }
  # Declare non scalar variables with state: the code from the book doesn't compile
  sub add_to_tab {
    my $castaway = shift;
    state $castaways = [qw(Ginger Mary Ann Gilligan)];
    state $tab = +{ (map { $_, 0} @$castaways) };
    $tab->{$castaway}++;
    say "$castaway value is now: $tab->{$castaway}";
  }

  add_to_tab("Ginger");
  add_to_tab("Ginger");
  add_to_tab("Ginger");
  add_to_tab("Mary");
}
