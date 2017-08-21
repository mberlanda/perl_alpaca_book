#!/usr/bin/perl

use strict;
use warnings;
use 5.016;

=head2
Modify the recursive directory dumping routine so it shows the nested
directories through indentation. An empty directory should show up as:
  sandbar, an empty directory
while a nonempty directory should appear with nested contents, indented two
spaces:
  uss_minnow, with contents:
    anchor
    broken_radio
    galley, with contents:
      captain_crunch_cereal
      gallon_of_milk
      tuna_fish_sandwich
    life_preservers
=cut

my $path = shift // '.';
my $data = data_for_path($path);

dump_data_for_path( $path, $data );

sub data_for_path {
    my $path = shift;

    if ( -f $path or -l $path ) {
        return undef;
    }

    if ( -d $path ) {
        opendir PATH, $path or die $!;
        my @names = readdir PATH;
        close PATH;
        my %directory;
        foreach my $name (@names) {
            next if $name eq '.' or $name eq '..';
            $directory{$name} = data_for_path("$path/$name");
        }
        return \%directory;
    }

    warn "$path of neither a file nor a directory\n";
    return undef;
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
