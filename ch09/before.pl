#!/usr/bin/perl

use strict;
use warnings;
use 5.014;

say 'Enter a pattern: ';
chomp( my $pattern = <STDIN> );

if(0){
  say "Enter some lines:";
  while( <STDIN> ) {
    if( eval { m/$pattern/ } ) {
      print "Match: $_";
    }
    if( $@ ) {
      die "There was a regex problem: $@\n";
    }
  }

}

sub find_match {
  my( $pattern ) = @_;
  if( eval { m/$pattern/ } ) {
    print "Match: $_";
  }
  if( $@ ) {
    die "There was a regex problem: $@\n";
  }
}

sub is_valid_pattern {
  my( $pattern ) = @_;
  local( $@ );
  eval { '' =~ /$pattern/ };
  return defined $@ ? 0 : 1;
}
