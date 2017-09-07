package Test::Minnow::RequiredItems {
  use strict;
  use warnings;

  use Exporter qw(import);
  use vars qw(@EXPORT $VERSION);

  use Test::Builder;
  my $Test = Test::Builder->new();

  $VERSION = '0.10';
  @EXPORT = qw(check_required_items_ok);

  sub check_required_items_ok {
    my $who = shift;
    my $items = shift;

    my @required = qw(preserver sunscreen water_bottle jacket);
    my @missing = ( );

    for my $item (@required) {
      push @missing, $item unless (grep $item eq $_, @$items);
    }
    if (@missing) {
      $Test->diag( "$who needs @missing.\n" );
      $Test->ok(0);
    } else {
      $Test->ok(1);
    }
  }
}

1;
