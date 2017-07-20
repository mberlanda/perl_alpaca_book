#!/usr/bin/perl
use strict;
use warnings;
use 5.014;

= head1 Functional Interfaces

=head2 File::Basename
use File::Basename;
my $some_full_path = '/etc/cron.d/';
my $basename = basename( $some_full_path );
my $dirname = dirname( $some_full_path );
=cut

#use File::Basename ();
# use File::Basename ('fileparse', 'basename');
use File::Basename qw( fileparse basename );

my $some_full_path = '/etc/cron.d/';
my $basename = File::Basename::basename( $some_full_path );
my $dirname = File::Basename::dirname( $some_full_path );

say $basename;
say $dirname;
