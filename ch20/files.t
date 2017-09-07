#!perl -T

use strict;
use warnings;
use Test::More;
use Test::File;

ok( ! -e 'minnow.db' );
file_not_exists_ok( 'minnow.db' );

{
  my $file = 'files.t';
  file_exists_ok( $file );
  file_not_empty_ok( $file );
  file_readable_ok( $file );
  file_min_size_ok( $file, 500 );
  file_mode_is( $file, 0775 );
}

done_testing();
