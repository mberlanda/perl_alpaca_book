package Animal;

use 5.006;
use strict;
use warnings;

use Carp qw(croak);

=head1 NAME

Animal

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';
use parent qw(LivingCreature);


=head1 SYNOPSIS

Perhaps a little code snippet.

    use Animal;

    my $foo = Animal->new();
    ...

=head1 EXPORT

A list of functions that can be exported.  You can delete this section
if you don't export anything, such as for a purely object-oriented module.

=head1 SUBROUTINES/METHODS

=head2 name

First implementation:
sub name {
  my $self = shift;
  $$self;
}

sub name {
  my $either = shift;
  ref $either ? $$either # it's an instance, return name
  : "an unnamed $either"; # it's a class, return generic
}

=cut

sub name {
  my $either = shift;
  ref $either ? $either->{Name} : "an unnamed $either";
}

=head2 named
This method is a constructor for the Horse object

sub named {
  my $class = shift;
  my $name = shift;
  bless \$name, $class;
}
=cut

sub named {
  my $class = shift;
  my $name = shift;
  my $self = { Name => $name, Color => $class->default_color };
  bless $self, $class;
}

=head2 set_name
sub set_name { $_[0]->{Name} = $_[1] }
=cut
sub set_name {
  ref(my $self = shift) or croak "instance variable needed";
  $self->{Name} = shift;
}

=head2 color

use Color::Conversions qw(color_name_to_rgb rgb_to_color_name);
sub set_color {
  my $self = shift;
  my $new_color = shift;
  $self->{Color} = color_name_to_rgb($new_color);
}
sub color {
  my $self = shift;
  rgb_to_color_name($self->{Color});
}
sub set_color_rgb {
  my $self = shift;
  $self->{Color} = [@_];
}
sub get_color_rgb {
  my $self = shift;
  @{ $self->{Color} };
}

Original implementation:

sub color {
  my $self = shift;
  $self->{Color};
}
sub color { $_[0]->{Color} }

=cut

sub color {
  my $either = shift;
  ref $either ? $either->{Color} : $either->default_color;
}

=head2 set_color

# Return the previous value
sub set_color {
  my $self = shift;
  my $old = $self->{Color};
  $self->{Color} = shift;
  $old;
}

sub set_color {
  my $self = shift;
  if (defined wantarray) {
    # this method call is not in void context, so
    # the return value matters
    my $old = $self->{Color};
    $self->{Color} = shift;
    $old;
  } else {
    # this method call is in void context
    $self->{Color} = shift;
  }
}
# Return the object itself
sub set_color {
  my $self = shift;
  $self->{Color} = shift;
  $self;
}

Original implementation:
sub set_color {
  my $self = shift;
  $self->{Color} = shift;
}

sub set_color { $_[0]->{Color} = $_[1] }

=cut

sub set_color {
  ref(my $self = shift) or croak "instance variable needed";
  $self->{Color} = shift;
}

=head2 default_color

=cut

sub default_color { 'brown' }

=head2 speak
First implementation:
sub speak {
  my $class = shift;
  die "animals can't talk!" if @_;
  #print "a $class goes ", $class->sound, "!\n";
  $class->SUPER::speak;
}

=cut

sub speak {
  my $either = shift;
  die "animals can't talk!" if @_;
  print $either->name, ' goes ', $either->sound, "\n";
}

=head2 sound

=cut

sub sound { die "all Animals should define a sound" }

=head2 eat

=cut

sub eat {
  my ($either, $food) = @_;
  print $either->name, " eats $food.\n";
}
=head1 AUTHOR

Mauro Berlanda, C<< <kupta at cpan.org> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-animal at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Animal>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Animal


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker (report bugs here)

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Animal>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Animal>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Animal>

=item * Search CPAN

L<http://search.cpan.org/dist/Animal/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

Copyright 2017 Mauro Berlanda.

This program is free software; you can redistribute it and/or modify it
under the terms of the the Artistic License (2.0). You may obtain a
copy of the full license at:

L<http://www.perlfoundation.org/artistic_license_2_0>

Any use, modification, and distribution of the Standard or Modified
Versions is governed by this Artistic License. By using, modifying or
distributing the Package, you accept this license. Do not use, modify,
or distribute the Package, if you do not accept this license.

If your Modified Version has been derived from a Modified Version made
by someone other than you, you are nevertheless required to ensure that
your Modified Version complies with the requirements of this license.

This license does not grant you the right to use any trademark, service
mark, tradename, or logo of the Copyright Holder.

This license includes the non-exclusive, worldwide, free-of-charge
patent license to make, have made, use, offer to sell, sell, import and
otherwise transfer the Package with respect to any patent claims
licensable by the Copyright Holder that are necessarily infringed by the
Package. If you institute patent litigation (including a cross-claim or
counterclaim) against any party alleging that the Package constitutes
direct or contributory patent infringement, then this Artistic License
to you shall terminate on the date that such litigation is filed.

Disclaimer of Warranty: THE PACKAGE IS PROVIDED BY THE COPYRIGHT HOLDER
AND CONTRIBUTORS "AS IS' AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES.
THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
PURPOSE, OR NON-INFRINGEMENT ARE DISCLAIMED TO THE EXTENT PERMITTED BY
YOUR LOCAL LAW. UNLESS REQUIRED BY LAW, NO COPYRIGHT HOLDER OR
CONTRIBUTOR WILL BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, OR
CONSEQUENTIAL DAMAGES ARISING IN ANY WAY OUT OF THE USE OF THE PACKAGE,
EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


=cut

1; # End of Animal
