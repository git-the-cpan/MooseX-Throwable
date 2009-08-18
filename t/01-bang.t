use strict;
use warnings;
use Test::More tests => 5;
use lib 't/lib';
use TestClass;

eval {
	my $o = TestClass->new;
};
is($@->message, 'Attribute (attr1) is required', 'useful error from constructor');
ok($@->stack, 'stack from constructor');

is("$@", $@->message, 'stringify as message');

eval {
	my $o = TestClass->new( attr1 => 1 );
	$o->attr1("foo");
};
is($@->message, "Attribute (attr1) does not pass the type constraint because: " .
	        "Validation failed for 'Int' failed with value foo", 'useful error from setter');
ok($@->stack, 'stack from setter');

