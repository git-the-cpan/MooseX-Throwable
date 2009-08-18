use inc::Module::Install;
use 5.008006;

license  'perl';

name     'MooseX-Throwable';
all_from 'lib/MooseX/Throwable.pm';

requires 'Moose' => undef;
requires 'MooseX::Types' => undef;
requires 'Throwable' => undef;

my @force_build_requires_if_author = qw(
  Test::NoTabs
  Test::Pod
  Test::Pod::Coverage
  Pod::Coverage
);

if ($Module::Install::AUTHOR) {
    foreach my $module (@force_build_requires_if_author) {
        build_requires $module;
    }
    darwin_check_no_resource_forks();
}

WriteAll;
