#!/usr/bin/perl

use strict;
use warnings;
use 5.014;

=head2 Callbacks
=cut
if (0){
  {
    use File::Find;
    sub what_to_do {
      say "$File::Find::name found";
    }
    my @starting_directories = qw(.);
    find(\&what_to_do, @starting_directories);
  }
  {
    use File::Find;
    my @starting_directories = qw(.);
    find(sub { say "$File::Find::name found" }, @starting_directories);
  }
}

=head2 Closures
=cut
if (0){
  {
    use File::Find;
    my $total_size = 0;
    find(sub { $total_size += -s if -f }, '.');
    say $total_size;
  }

  use File::Find;
  my $callback;
  {
    my $count = 0;
    $callback = sub { say ++$count, ": $File::Find::name" };
  }
  find($callback, '.');
}

=head2 Returning a Subroutine from a Subroutine
=cut
if (0){
  use File::Find;
  sub create_find_callback_that_counts {
    my $count = 0;
    return sub { say ++$count, ": $File::Find::name" };
  }
  my $callback = create_find_callback_that_counts();
  find($callback, '.');

  say "my /tmp:";
  find($callback, '/tmp'); # This won't reset the counter of $callback

  my $callback2 = create_find_callback_that_counts( );
  say "my /tmp:";
  find($callback2, '/tmp'); # The new reference $callback resets the counter

  sub create_find_callbacks_that_sum_the_size {
    my $total_size = 0;
    return(sub { $total_size += -s if -f }, sub { return $total_size });
  }

  my ($count_em, $get_results) = create_find_callbacks_that_sum_the_size();
  find($count_em, '/tmp');
  my $total_size = &$get_results( );
  say "total size of /tmp is $total_size";

  ## set up the subroutines
  my %subs;
  foreach my $dir (glob('*/')){
    my ($callback, $getter) = create_find_callbacks_that_sum_the_size();
    $subs{$dir}{CALLBACK} = $callback;
    $subs{$dir}{GETTER} = $getter;
  }

  ## gather the data
  for (keys %subs) {
    find($subs{$_}{CALLBACK}, $_);
  }

  ## show the data
  for (sort keys %subs) {
    my $sum = $subs{$_}{GETTER}->();
    say "$_ has $sum bytes";
  }
}

=head2 Closure Variables as Inputs
=cut
if (1){
  use File::Find;

  sub print_bigger_than {
    my $minimum_size = shift;
    return sub { say "$File::Find::name" if -f and -s >= $minimum_size };
  }
  my $bigger_than_1024 = print_bigger_than(1024);
  find($bigger_than_1024, '.');

  # File::Find::Closures
  # use File::Find::Closures;
  # my( $wanted, $list_reporter ) = find_by_name( qw(README) );
  # find( $wanted, $ENV{HOME} );
  # my @readmes = $list_reporter->();

  # find_by_min_size
  use File::Spec::Functions qw(canonpath no_upwards);

  sub find_by_min_size {
    my $min = shift;
    my @files = ();
    sub { push @files, canonpath($File::Find::name) if -s $_ >= $min },
    sub {
      @files = no_upwards( @files );
      wantarray ? @files : [ @files ]
    }
  }
  my ($push_em, $get_results) = find_by_min_size(2048);
  find($push_em, '.');
  foreach($get_results->()){ say; }
}
