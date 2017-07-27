#!/usr/bin/perl

use strict;
use warnings;
use 5.016;

package MagicalCodeRef 1.00 {
  use overload '""' => sub {
    require B; # http://perldoc.perl.org/B.html

    my $ref = shift;
    my $gv = B::svref_2object($ref)->GV;

    require B::Deparse;
    my $deparse = B::Deparse->new;
    my $code = $deparse->coderef2text($ref);

    require PadWalker; # http://search.cpan.org/~robin/PadWalker-2.2/PadWalker.pm
    my $hash = PadWalker::closed_over($ref);

    require Data::Dumper;
    local $Data::Dumper::Terse = 1;

    my $string = sprintf "---code ref---\n%s:%d\n%s\n---\n%s---",
                 $gv->FILE, $gv->LINE, $code, Data::Dumper::Dumper( $hash );
  };
  sub enchant { bless $_[1], $_[0] }
}

{;
  my $sub = MagicalCodeRef->enchant( sub { say 'Gilligan!!!' } );
  test_subroutine($sub);
}

{;
  my $sub = do {
    my $name = 'Gilligan';
    MagicalCodeRef->enchant( sub { say "$name!!!" } );
  };
  test_subroutine($sub);
}


sub test_subroutine {
  my $sub = shift;
  use experimental qw(smartmatch);
  my @array = ( \ 'xyz', [qw(a b c)], $sub );
  foreach (@array){
    when(ref eq ref \ '') { say "Scalar $$_" }
    when(ref eq ref []) { say "Array @$_" }
    when(ref eq 'MagicalCodeRef' ) { say "Sub $sub" }
  }
}

