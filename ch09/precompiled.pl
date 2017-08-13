#!/usr/bin/perl

use strict;
use warnings;
use 5.014;

if (0){
  my $regex = qr/Gilligan|Skipper/;
  print $regex; # (?^u:Gilligan|Skipper)
}

=head2 Flags
/x Allows you to use white space in the expression for clarity.
/i Makes the match case insensitive.
/s Allows use of . to match a newline character.
/m Specifies that if the string has newline or carriage return characters, the ^ and $ operators will now match against a newline boundary, instead of a string boundary.
/p
/o
/a
/l
/d
/u
=cut
if (0){
  my $reg1 = qr/Gilligan$/mi;
  my $reg2 = qr/(?mi:Gilligan$)/;
  my $reg3 = qr/abc(?x-i:G i l l i g a n)def/i;
}
=head2 Applying Regex References
=cut
{
  my $string = "Gilligan is there";
  my $regex = qr/Gilligan/;
  say $string =~ m/$regex/;
  say $string =~ $regex;
  say $string ~~ $regex;

  $string =~ s/$regex/Skipper/;
  say $string;
}
