#!/usr/bin/perl

use strict;
use warnings;
use 5.014;

=head2 Filehandles to Strings
=cut
if(0){

  {
    use CGI;
    open my $string_fh, '>', \ my $string;
    CGI->save( $string_fh );
  }
  {
    use Storable qw(nstore_fd);

    my @data = [];
    open my $string_fh, '>', \ my $string;
    nstore_fd \@data, $string_fh;
  }
  {
    print "1. This goes to the real standard output\n";
    my $string;
    {
      local *STDOUT;
      open STDOUT, '>', \ $string;
      print "2. This goes to the string\n";
      # $some_obj->noisy_method(); # this STDOUT goes to $string too
    }
    print "3. This goes to the real standard output\n";

    say $string;
  }

  sub output_to_fh {
    my( $fh, @data ) = @_;
    print $fh @data;
  }
  sub as_string {
    my( @data ) = @_;
    open my $string_fh, '>', \ my $string;
    output_to_fh( $string_fh, @data );
    $string;
  }
}

=head2 Processing Strings Line by Line
=cut

if (0) {
  my $multiline_string = "a\nb\n";
  my @lines = split /$/, $multiline_string;
  foreach my $line ( @lines ) {
    print $line;
  }
  open my $string_fh, '<', \ $multiline_string;
  while( <$string_fh> ) {
    print;
  }
}
