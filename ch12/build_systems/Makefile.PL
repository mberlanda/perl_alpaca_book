use 5.006;
use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
  NAME => 'Animal',
  AUTHOR => q{Willie Gilligan <gilligan@island.example.com>},
  VERSION_FROM => 'lib/Animal.pm',
  ABSTRACT_FROM => 'lib/Animal.pm',
  PL_FILES => {},
  PREREQ_PM => {
    'Test::More' => 0,
  },
  dist => { COMPRESS => 'gzip −9f', SUFFIX => 'gz', },
  clean => { FILES => 'Animal2−*' },
);
