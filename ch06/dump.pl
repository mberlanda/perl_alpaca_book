#!/usr/bin/perl

use strict;
use warnings;
use 5.014;

=head2 Using the Debugger to View Complex Data
The simplest way is to launch perl with the -d option:
$ perl -d ex03.pl materials/coconet.dat
=cut
=head2 Data::Dumper
use Data::Dumper;

my %total_bytes;
while (<>) {
  my ($source, $destination, $bytes) = split;
  $total_bytes{$source}{$destination} += $bytes;
}
print Dumper(\%total_bytes);
=cut

use Data::Dumper;

$Data::Dumper::Purity = 1; # declare possibly self−referencing structures
my @data1 = qw(one won);
my @data2 = qw(two too to);
push @data2, \@data1;
push @data1, \@data2;
print Dumper(\@data1, \@data2);

=head2
$ perl dump.pl ../ch05/materials/coconet.dat
$VAR1 = [
          'one',
          'won',
          [
            'two',
            'too',
            'to',
            []
          ]
        ];
$VAR1->[2][3] = $VAR1;
$VAR2 = $VAR1->[2];
=cut

use Data::Dump qw(dump);

my %total_bytes = (
  'thurston.howell.hut' => {
    'lovey.howell.hut' => 1250
  },
  'ginger.girl.hut' => {
    'maryann.girl.hut' => 199,
    'professor.hut' => 1218
  },
  'professor.hut' => {
    'gilligan.crew.hut' => 1250,
    'lovey.howell.hut' => 1360
  },
);
dump( \%total_bytes );

=head2 Data::Printer
use Data::Printer;
p( %total_bytes );
=cut

=head2 Marshalling Data
use Data::Dumper;
=cut

my $string = Dumper( \@data1, \@data2 ); # to some filehandle
my $data_structure = eval $string;

print Data::Dumper->Dump(
  [ \@data1, \@data2 ],
  [ qw(*data1 *data2) ]
);
