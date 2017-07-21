#!/usr/local/bin/perl
use strict;
use warnings;

use 5.014;

=head1 List Operators
=cut

=head2 Operators already seen in Learning Perl: sort, reverse, push

my @castaways = sort qw(Gilligan Skipper Ginger Professor Mary Ann);
my @castaways = reverse qw(Gilligan Skipper Ginger Professor Mary Ann);

my @castaways = qw(Gilligan Skipper Ginger Professor);
push @castaways, 'Mary Ann';
@castaways = reverse @castaways;
=cut

my @input_numbers = (1, 2, 4, 8, 16, 32, 64);

=head2 List Filtering with grep
my @gilligans_possessions = qw(Pecan Wafer Kiwi Strudel);
sub is_edible{ 1; }
my @lunch_choices = grep is_edible($_), @gilligans_possessions ;
=cut

my @bigger_than_10 = grep $_ > 10, @input_numbers;
my @end_in_4 = grep /4$/, @input_numbers;
my @odd_digit_sum = grep digit_sum_is_odd($_), @input_numbers;

sub digit_sum_is_odd {
  my $input = shift;
  my @digits = split //, $input; # Assume no nondigit characters
  my $sum;
  $sum += $_ for @digits;
  return $sum % 2;
}

my @odd_digit_sum_shorter = grep {
  my $sum;
  $sum += $_ for split //;
  $sum % 2;
} @input_numbers;

use HTTP::SimpleLinkChecker qw(check_link);

my @links = ('http://www.google.com', 'badlink.none', 'http//<server name here>');
my @good_links = grep {
  check_link( $_ );
  ! $HTTP::SimpleLinkChecker::ERROR;
} @links;

=head2 Transforming Lists with map
=cut

my @result = map $_ + 100, @input_numbers;
my %hash = map { $_, 3 * $_ } @input_numbers;
