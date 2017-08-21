use strict;
package Oogaboogoo::Date {
  our @day = qw(ark dip wap sen pop sep kir);
  our @month = qw(diz pod bod rod sip wax lin sen kun fiz nap dep);

  sub day {
    my $num = shift @_;
    die "$num is not a valid day number" unless $num >= 0 and $num <= 6;
    $day[$num];
  }

  sub month {
    my $num = shift @_;
    die "$num is not a valid month number" unless $num >= 0 and $num <= 11;
    $month[$num];
  }
}

1;
