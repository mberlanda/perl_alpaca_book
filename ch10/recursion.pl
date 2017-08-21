#!/usr/bin/perl

use strict;
use warnings;
use 5.014;

=head2 Recursively Defined Data
=cut

sub factorial {
  my $n = shift;
  if ($n <= 1) {
    return 1;
  } else {
    return $n * factorial($n -1);
  }
}

# say factorial 6;

=head2 Building Recursively Defined Data
=cut

sub data_for_path {
  my $path = shift;
  if (-f $path or -l $path) { # files or symbolic links
    return undef;
  }
  if (-d $path) {
    my %directory;
    opendir PATH, $path or die "Cannot opendir $path: $!";
    my @names = readdir PATH;
    closedir PATH;
    for my $name (@names) {
      next if $name eq '.' or $name eq '..';
      $directory{$name} = data_for_path("$path/$name");
    }
    return \%directory;
  }
  warn "$path is neither a file nor a directory\n";
  return undef;
}

use Data::Dumper;
# print Dumper(data_for_path('.'));


=head2 Displaying Recursively Defined Data
$ find . -print
=cut

sub dump_data_for_path {
  state %directory;
  my $path = shift;
  my $data = shift;
  if (not defined $data) {
    say "$path";
    return;
  }

  foreach (sort keys %$data){
    dump_data_for_path("$path/$_", $directory{$_});
  }
}

dump_data_for_path('.', data_for_path('.'));

=head2 Avoiding Recursion
sub iterative_solution {
  my( $start ) = @_;
  my $data = {};
  my @queue = ( [ $start, $data ] );
  while( my $next = shift @queue ) {
    ... process current element ...
    ... add new things to @queue ...
  }
  return $data;
}
=cut
{

  use File::Basename;
  use File::Spec::Functions;

  my $data = iterative_data_for_path( '.' );

  sub iterative_data_for_path {
    my( $path ) = @_;
    my $data = {};
    my @queue = ( [ $path, $data ] );
    while( my $next = shift @queue ) {
      my( $path, $ref ) = @$next;
      my $basename = basename( $path );
      $ref->{$basename} = do {
        if( -f $path or -l $path ) { undef }
        else {
          my $hash = {};
          opendir my $dh, $path;
          my @new_paths = map {
            catfile( $path, $_ )
          } grep { ! /^\.\.?\z/ } readdir $dh;
          unshift @queue, map { [ $_, $hash ] } @new_paths;
          $hash;
        }
      }
    }
    $data;
  };
  print Dumper($data);
}

=head2 The Breadth-First Solution
=cut
{
  use Data::Dumper;
  use File::Basename;
  use File::Spec::Functions;

  my $data = data_for_path( $ENV{HOME}, 2 );
  print Dumper( $data );

  sub data_for_path {
    my( $path, $threshold ) = @_;
    my $data = {};
    my @queue = ( [ $path, 0, $data ] );

    while( my $next = shift @queue ) {
      my( $path, $level, $ref ) = @$next;
      my $basename = basename( $path );
      $ref->{$basename} = do {
        if( -f $path or -l $path ) { undef }
        else {
          my $hash = {};
          if( $level < $threshold ) {
            opendir my $dh, $path;
            my @new_paths = map {
              catfile( $path, $_ )
            } grep { ! /^\.\.?\z/ } readdir $dh;
            push @queue, map { [ $_, $level + 1, $hash ] } @new_paths;
          }
          $hash;
        }
      };
    }
    $data;
  }
}
