#!/usr/bin/perl

use strict;
use warnings;
use 5.016;

=head2
Modify the iterative version of data_for_path to handle both depth-
first or breadth-first traversal. Use an optional third argument to allow the user to
decide which to use:
my $depth = data_for_path( $start_dir, $threshold, 'depth-first' );
my $breadth = data_for_path( $start_dir, $threshold, 'breadth-first' );
=cut
use File::Basename;
use File::Spec::Functions;

my $path = shift // '.';
my $type = shift // 'depth';
my $data = data_for_path($path, $type);

dump_data_for_path( $path, $data );

sub data_for_path {
  my( $path, $type ) = @_;
  my $data = {};
  my @queue = ( [ $path, 0, $data ] );
  my $coderef = $type eq 'depth' ? \&add_to_front : \&add_to_back;

  while( my $next = shift @queue ) {
    my( $path, $level, $ref ) = @$next;
    my $basename = basename( $path );
    $ref->{$basename} = do {
      if( -f $path or -l $path ) { undef }
      else {
        my $hash = {};
        opendir my ($dh), $path;
        my @new_paths = map {
          catfile( $path, $_ )
          } grep { ! /^\.\.?\z/ } readdir $dh;
        $coderef->(\@queue, map { [ $_, $level + 1, $hash ] } @new_paths);
        # if( $type eq 'depth' ) {
        #   unshift @queue, map { [ $_, $level + 1, $hash ] } @new_paths;
        # }
        # else {
        #   push @queue, map { [ $_, $level + 1, $hash ] } @new_paths;
        # }
        $hash;
      }
    };
  }
  $data;
}

sub add_to_front {
  my ($q, @list) = @_;
  unshift @$q, @list;
}

sub add_to_back {
  my ($q, @list) = @_;
  push @$q, @list;
}

sub dump_data_for_path {
    my $path  = shift;
    my $data  = shift;
    my $level = shift // 0;

    print ' ' x $level, $path;

    if ( not defined $data ) {
        say;
        return;
    }

    if ( keys %$data ) {
        say ", with contents:";
        foreach ( sort keys %$data ) {
            dump_data_for_path( "$path/$_", $data->{$_}, $level + 1 );
        }
    } else {
        say ", an empty directory";
    }
}
