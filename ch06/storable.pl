#!/usr/bin/perl

use strict;
use warnings;
use 5.014;

=head2 Storing Complex Data with Storable
=cut

use Storable qw(freeze nstore retrieve thaw);
{
  my @data1 = qw(one won);
  my @data2 = qw(two too to);
  push @data2, \@data1;
  push @data1, \@data2;
  my $frozen = freeze([\@data1, \@data2]);

  my $data = thaw( $frozen );
  my $filename = "out.nstore";
  nstore [\@data1, \@data2], $filename;
  my $array_ref = retrieve $filename;

}

use Data::Dumper;
# use Storable qw(freeze thaw);
{
  my @provisions = qw( hat suncreen );
  my @science_kit = qw( microscope radio );
  push @provisions, \@science_kit;

  my $frozen = freeze \@provisions;
  my @packed = @{ thaw $frozen };
  push @packed, 'blue_shirt';
  push @{ $packed[2] }, 'batteries';

  print Data::Dumper->Dump(
    [ \@provisions ],
    [ qw( *provisions ) ]
  );
  print Data::Dumper->Dump(
    [ \@packed ],
    [ qw( *packed ) ]
  );
}

=head2 dclone
my @packed = @{ dclone \@provisions };
=cut

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

{
  use YAML;

  open OUT, ">out.yml";
  print OUT Dump(\%total_bytes);
  close OUT;
}

{
  use JSON;

  my $json_string = to_json( \%total_bytes, { pretty => 1 } );
  open OUT, ">out.json";
  print OUT $json_string;
  close OUT;

  my $hash_ref = from_json( $json_string );
}
