#!/usr/bin/perl

use strict;
use warnings;
use 5.014;

=head2 Anonymous Subroutines
=cut

{
  my $ginger = sub {
    my $person = shift;
    say "Ginger: (in a sultry voice) Well hello, $person!";
  };
  $ginger->('Skipper');
}
{
  my %greets = (
    Skipper => sub {
      my $person = shift;
      say "Skipper: Hey there, $person!";
    },
    Gilligan => sub {
      my $person = shift;
      if ($person eq 'Skipper') {
        say "Gilligan: Sir, yes, sir, $person!";
      } else {
      say "Gilligan: Hi, $person!";
      }
    },
    Professor => sub {
      my $person = shift;
      say "Professor: By my calculations, you must be $person!";
    },
    Ginger => sub {
      my $person = shift;
      say "Ginger: (in a sultry voice) Well hello, $person!";
    },
  );

  # People walk into the room and greet the present people
  my @room;
  for my $person (sort keys %greets) {
    say "";
    say "$person walks into the room.";
    for my $room_person (@room) {
      $greets{$person}->($room_person);
      $greets{$room_person}->($person);
    }
    push @room, $person;
  }
}
