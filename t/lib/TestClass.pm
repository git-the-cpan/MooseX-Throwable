package TestClass;
use Moose;
use MooseX::Throwable;

has attr1 => (is => 'rw', isa => 'Int', required => 1);

__PACKAGE__->meta->make_immutable;
