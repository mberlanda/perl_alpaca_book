#!/usr/bin/perl

use strict;
use warnings;
use 5.014;

=head2 Build Up Regular Expressions
=cut

my $howells = qr/Thurston|Mrs/;
my $tagalongs = qr/Ginger|Mary Ann/;
my $passengers = qr/$howells|$tagalongs/;
my $crew = qr/Gilligan|Skipper/;
my $everyone = qr/$crew|$passengers/;

=head2 RFC 1738
=cut

my $alpha = qr/[a-z]/;
my $digit = qr/\d/;
my $alphadigit = qr/(?i:$alpha|$digit)/;
my $safe = qr/[\$_.+-]/;
my $extra = qr/[!*'\(\),]/;
my $national = qr/[{}|\\^~\[\]`]/;
my $reserved = qr|[;/?:@&=]|;
my $hex = qr/(?i:$digit|[A-F])/;
my $escape = qr/%$hex$hex/;
my $unreserved = qr/$alpha|$digit|$safe|$extra/;
my $uchar = qr/$unreserved|$escape/;
my $xchar = qr/$unreserved|$reserved|$escape/;
my $ucharplus = qr/(?:$uchar|[;?&=])*/;
my $digits = qr/(?:$digit){1,}/;

my $hsegment = $ucharplus;
my $hpath = qr|$hsegment(?:/$hsegment)*|;
my $search = $ucharplus;

my $scheme = qr|(?i:https?://)|;
my $port = qr/$digits/;
my $password = $ucharplus;
my $user = $ucharplus;

my $toplevel = qr/$alpha|$alpha(?:$alphadigit|-)*$alphadigit/;
my $domainlabel = qr/$alphadigit|$alphadigit(?:$alphadigit|-)*$alphadigit/x;
my $hostname = qr/(?:$domainlabel\.)*$toplevel/;
my $hostnumber = qr/$digits\.$digits\.$digits\.$digits/;
my $host = qr/$hostname|$hostnumber/;
my $hostport = qr/$host(?::$port)?/;
my $login = qr/(?:$user(?::$password)\@)?/;

my $urlpath = qr/(?:(?:$xchar)*)/;

my $httpurl = qr|$scheme$hostport(?:/$hpath(?:\?$search)?)?|;

while( <> ) {
  say if /$httpurl/;
}
