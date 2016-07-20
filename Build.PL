use 5.006;
use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'Pantry::Schema::Result::CategoryToStore',
    license             => 'gpl_3',
    dist_author         => q{Brett T. Warden <bwarden@cpan.org>},
    dist_version_from   => 'lib/Pantry/Schema/Result/CategoryToStore.pm',
    release_status      => 'stable',
    configure_requires => {
        'Module::Build' => 0,
    },
    build_requires => {
        'Test::More' => 0,
    },
    requires => {
        #'ABC'              => 1.6,
        #'Foo::Bar::Module' => 5.0401,
    },
    add_to_cleanup     => [ 'Pantry-*' ],
    create_makefile_pl => 'traditional',
);

$builder->create_build_script();
