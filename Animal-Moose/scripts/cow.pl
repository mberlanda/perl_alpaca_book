#!perl
# scripts/cow.pl

use strict;
use warnings;
use Cow;

{
  sub feed_a_cow_named {
    my $name = shift;
    my $cow = Cow->named($name);
    $cow->eat('grass');
    print "Returning from the subroutine.\n";
    # $cow is destroyed here
  }
  print "Start of program.\n";
  my $outer_cow = Cow->named('Bessie');
  print "Now have a cow named ", $outer_cow->name, ".\n";
  feed_a_cow_named('Gwen');
  print "Returned from subroutine.\n";
}

package Barn {
  sub new { bless [ ], shift }
  sub add { push @{shift()}, shift }
  sub contents { @{shift()} }
  sub DESTROY {
    my $self = shift;
    print "$self is being destroyed...\n";
    for ($self->contents) {
      print ' ', $_->name, " goes homeless.\n";
    }
  }
}

{
  my $barn = Barn->new;
  $barn->add(Cow->named('Bessie'));
  $barn->add(Cow->named('Gwen'));
  print "Burn the barn:\n";
  $barn = undef;
  print "End of program.\n";
}
{
  my $barn = Barn->new;
  my @cows = (Cow->named('Bessie'), Cow->named('Gwen'));
  $barn->add($_) for @cows;
  print "Burn the barn:\n";
  $barn = undef;
  print "Lose the cows:\n";
  @cows = ( );
  print "End of program.\n";
}

package Barn2 {
  sub new { bless [ ], shift }
  sub add { push @{shift()}, shift }
  sub contents { @{shift()} }
  sub DESTROY {
    my $self = shift;
    print "$self is being destroyed...\n";
    while (@$self) {
      my $homeless = shift @$self;
      print ' ', $homeless->name, " goes homeless.\n";
    }
  }
}

{
  my $barn = Barn2->new;
  $barn->add(Cow->named('Bessie'));
  $barn->add(Cow->named('Gwen'));
  print "Burn the barn:\n";
  $barn = undef;
  print "End of program.\n";
}
