#!/usr/bin/perl
use strict;
use warnings;
use 5.014;

=head1 Object-Oriented Interfaces
=cut

use File::Spec;
my $filespec = File::Spec->catfile( $ENV{HOME},
'web_docs', 'photos', 'USS_Minnow.gif' );
say $filespec;

=head2 A More Typical Object-Oriented Module: Math::BigInt
=cut

use Math::BigInt;
my $value = Math::BigInt->new(2);
$value->bpow(1000);
say $value->bstr;


=head2 Fancier Output with Modules
=cut

use Spreadsheet::WriteExcel;

# Create a new Excel workbook
my $workbook = Spreadsheet::WriteExcel->new('perl.xls');
# Add a worksheet
my $worksheet = $workbook->add_worksheet();
$worksheet->write('A1', 'Hello Excel!');
$worksheet->write(0, 0, 'Hello Excel!');
# Add formats
my $red_background = $workbook->add_format(
  color    => 'white',
  bg_color => 'red',
  bold     => 1,
  );
my $bold = $workbook->add_format(
   bold => 1,
  );
$worksheet->write(0, 0, 'Colored cell', $red_background);
$worksheet->write(0, 1, 'Bold cell', $bold);
# Cast cell type
my $product_code = '01234';
$worksheet->write_string( 0, 2, $product_code );
# Use formulas
$worksheet->write( 'A2', 37 );
$worksheet->write( 'B2', 42 );
$worksheet->write( 'C2', '= A2 + B2');
