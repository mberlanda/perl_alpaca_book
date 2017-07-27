#!/usr/bin/perl

use strict;
use warnings;
use 5.014;

=head2 Referencing a Named Subroutine
=cut

{
  sub skipper_greets {
    my $person = shift;
    say "Skipper: Hey there, $person!";
  }
  sub gilligan_greets {
    my $person = shift;
    if ($person eq "Skipper") {
      say "Gilligan: Sir, yes, sir, $person!";
    } else {
    say "Gilligan: Hi, $person!";
    }
  }

  sub professor_greets {
    my $person = shift;
    say "Professor: By my calculations, you must be $person!";
  }
  # Just call the subroutine
  gilligan_greets("Skipper");
  professor_greets("Gilligan");
  professor_greets("Skipper");
  skipper_greets("Gilligan");

  # Call the reference to the subroutine
  my $ref_to_greeter = \&skipper_greets;
  & { $ref_to_greeter } ("Gilligan");
  &$ref_to_greeter("Gilligan");
  $ref_to_greeter->("Gilligan");

  for my $greet (\&skipper_greets, \&gilligan_greets) {
    $greet->('Professor');
  }

  my %greets = (
    Gilligan => \&gilligan_greets,
    Skipper => \&skipper_greets,
    Professor => \&professor_greets,
  );
  for my $person (qw(Skipper Gilligan)) {
    $greets{$person}->('Professor');
  }

  my @everyone = sort keys %greets;
  for my $greeter (@everyone) {
    for my $greeted (@everyone) {
      $greets{$greeter}->($greeted) unless $greeter eq $greeted;
    }
  }

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
