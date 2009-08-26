package MooseX::Throwable;
use strict;
use warnings;
require 5.008006;

use Moose ();
use Moose::Exporter;

our $VERSION = '0.02';

=head1 NAME

MooseX::Throwable - access to Moose's error messages -
   without a stack trace attached.

=head1 SYNOPSIS

  package MyClass;
  use Moose;
  use MooseX::Throwable;

  has required_attr => (required => 1, ...)

  ...

  eval {
    $o = MyClass->new;
  }
  print $@->message if $@;

=head1 DESCRIPTION

This module changes Moose's error reporting to raise an exception
rather than call confess. While confess is useful in development to
provide a stack trace, it's less useful in production where stack
traces are unwelcome yet the error message is still required. 

The exception thrown provides access to both the message and stack
trace separately.

=cut

Moose::Exporter->setup_import_methods();

=head1 METHODS

=head2 init_meta

Apply the necessary roles to caller. 

=cut

sub init_meta
{
    shift;
    my %p = @_;

    Moose->init_meta(%p);

    my $caller = $p{for_class};
    $caller->meta->error_class('MooseX::Throwable::Exception');

    return $caller->meta();
}

=head1 AUTHOR

Copyright (c) 2009 Chris Andrews <chris@nodnol.org>

=cut

1;
