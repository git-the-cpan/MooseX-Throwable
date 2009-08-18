package MooseX::Throwable::Exception;
use Moose;
with 'Throwable';

use MooseX::Types::Moose qw/ Str /;
use Carp ();

=head1 NAME

MooseX::Throwable::Exception - exception class with separate 
  attributes for message and stack. 

=cut

has message => (
        is => 'ro', 
        isa => Str,
        required => 1,
);

has stack => (
        is => 'ro', 
        isa => Str,
        default => sub {
                local $Carp::CarpLevel = 4;
                my $stack = Carp::longmess;
                return $stack;
        },
);

=head1 METHODS

=head2 stringify

Returns the bare message, for the stringify overload. 

=cut

sub stringify { $_[0]->message };
use overload '""' => \&stringify;

__PACKAGE__->meta->make_immutable;
