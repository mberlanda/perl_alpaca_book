#!/usr/bin/perl

use strict;
use warnings;
use 5.014;

=head2
The Professor has to read a logfile that looks like the example we
show here. You can get sample data files from the Downloads section of http://www.intermediateperl.com/:
Gilligan: 1 coconut
Skipper: 3 coconuts
Gilligan: 1 banana
Ginger: 2 papayas
Professor: 3 coconuts
MaryAnn: 2 papayas
...
He wants to write a series of files, called gilligan.info , maryann.info , and so on.
Each file should contain all the lines that begin with that name. (Names are always
delimited by the trailing colon.) At the end, gilligan.info should start with:
Gilligan: 1 coconut
Gilligan: 1 banana
Now, the logfile is large and the coconut-powered computer is not fast, so he wants
to process the input file in one pass and write all output files in parallel. How does
he do it?
Hint: Use a hash keyed by castaway name and whose values are IO::File objects
for each output file. Create those files if they don’t exist yet, and overwrite them if they do.
# materials/8.2-data-file.txt
=cut
use IO::File;


while( <> ) {
  state $fhs;

  unless (/^([^:]+):/) {
    warn "ignoring the line with missing name: $_";
    next;
  }
  my $name = lc $1;
  unless( $fhs->{$name} ) {
    my $fh = IO::File->new("ex02_$name.info", "w");
    $fhs->{$name} = $fh;
  }
  print { $fhs->{$name} } $_;
}
