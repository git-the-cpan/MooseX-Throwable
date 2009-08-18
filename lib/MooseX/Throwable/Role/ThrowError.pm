package MooseX::Throwable::Role::ThrowError;
use strict;
use warnings;

use Moose::Role;

=head1 NAME

MooseX::Throwable::Role::ThrowError - role overriding 
  throw_error to raise an exception instead of calling confess.

=head1 METHODS

=head2 throw_error

Overridden to throw an exception containing the Moose message, and a
stacktrace separately.

=cut

sub throw_error {
        shift;
        MooseX::Throwable::Exception->throw( message => $_[0]);
}

1;
