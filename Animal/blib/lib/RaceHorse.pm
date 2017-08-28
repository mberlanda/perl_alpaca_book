package RaceHorse {

  use parent qw(Horse);

  our $VERSION = '0.01';
  dbmopen (our %STANDINGS, "standings", 0666)
    or die "Cannot access standings dbm: $!";


  sub named {
    my $self = shift->SUPER::named(@_);
    my @standings = split ' ', $STANDINGS{$name} || "0 0 0 0";
    @$self{qw(wins places shows losses)} = @standings;
    $self;
  }

  sub DESTROY {
    my $self = shift;
    $STANDINGS{$self->name} = "@$self{qw(wins places shows losses)}";
    $self->SUPER::DESTROY if $self->can( 'SUPER::DESTROY' );
  }

  sub won { shift->{wins}++; }
  sub placed { shift->{places}++; }
  sub showed { shift->{shows}++; }
  sub lost { shift->{losses}++; }
  sub standings {
    my $self = shift;
    join ', ', map "$self->{$_} $_", qw(wins places shows losses);
  }

}

=head1 NAME

RaceHorse

=head1 VERSION

Version 0.01

=head1 SUBROUTINES/METHODS

=head2 named
First implementation:
  sub named {
    my $self = shift->SUPER::named(@_);
    $self->{$_} = 0 for qw(wins places shows losses);
    $self;
  }

=head2 won

=head2 placed

=head2 showed

=head2 lost

=head2 standings

=cut
1; # End of RaceHorse
