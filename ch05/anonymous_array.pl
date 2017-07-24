#!/usr/bin/perl
use strict;
use warnings;
use 5.014;

my @skipper_with_name;
{
  my @skipper = qw(blue_shirt hat jacket preserver sunscreen);
  @skipper_with_name = ('The Skipper', \@skipper);
}

=begin
my $ref_to_skipper_provisions;
{
  my @temporary_name = (qw(blue_shirt hat jacket preserver sunscreen));
  $ref_to_skipper_provisions = \@temporary_name;
}
=cut

my $ref_to_skipper_provisions = [ qw(blue_shirt hat jacket preserver sunscreen) ];
@skipper_with_name = ('The Skipper', $ref_to_skipper_provisions);

@skipper_with_name = ( 'The Skipper', [ qw(blue_shirt hat jacket preserver sunscreen) ] );

sub get_provisions_list {
  return (
    ['The Skipper', [qw(blue_shirt hat jacket preserver sunscreen)] ],
    ['The Professor', [qw(sunscreen water_bottle slide_rule batteries radio) ] ],
    ['Gilligan', [qw(red_shirt hat lucky_socks water_bottle)] ],
    ['Mrs. Howell', []], # anonymous empty array reference
  );
}

my @all_with_names = get_provisions_list();

=head2 Another Example
=cut
my $fruits;
{
  my @secret_variable = ('pineapple', 'papaya', 'mango');
  $fruits = \@secret_variable;
}

$fruits = ['pineapple', 'papaya', 'mango'];

