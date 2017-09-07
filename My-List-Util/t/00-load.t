#!perl -T
use 5.006;
use strict;
use warnings;
use Test::More tests => 2;

BEGIN {
    use_ok( 'My::List::Util' ) || BAIL_OUT();
    use_ok( 'Test::My::List::Util' ) || BAIL_OUT();
}

diag( "Testing My::List::Util $My::List::Util::VERSION, Perl $], $^X" );
