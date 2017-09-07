#!perl -t

use Test::More;
use Test::File;

my $unix_file= '/etc/hosts';
my $windows_file = 'C:\\windows\\system32\\drivers\\etc\\hosts';
SKIP: {
  skip q(We're not on Windows), 1 unless $^O eq 'MSWin32';
  file_exists_ok( $windows_file );
  file_readable_ok( $windows_file );
}

SKIP: {
  skip q(We're not on Unix), 1 unless $^O ne 'MSWin32';
  file_exists_ok( $unix_file );
  file_readable_ok( $unix_file );
}

done_testing();
