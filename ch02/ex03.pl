#!/usr/bin/perl
use strict;
use warnings;
use 5.014;

=head2
Parse the International Standard Book Number from the back of this
book (9781449393090). Install the Business::ISBN module from CPAN and use it
to extract the group code and the publisher code from the number.
=cut

use Business::ISBN;

my $isbn = Business::ISBN->new( $ARGV[0] );
say "ISBN is " . $isbn->as_string;
say "Country code: " . $isbn->group_code;
say "Publisher code: " . $isbn->publisher_code;

=head2 Debug
$ cpanm Business::ISBN
Can't locate object method "country_code" via package "Business::ISBN13" at ex03.pl line 16.
$ perldoc Business::ISBN | grep country # Empty
Testing the group_code implementation with:
9788842542582 F. Dostoevskij, Le notti bianche, Ugo Mursia Editore (1 gennaio 2009)
$ perl ex03.pl 9788842542582
ISBN is 978-88-425-4258-2
Country code: 88
Publisher code: 425
https://everything2.com/title/ISBN+Country+codes
88 is Italian (Italy, Switzerland). Correct!
=cut
