use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'Gcode::ParseSpeed',
    AUTHOR              => 'G. Wade Johnson <gwadej@cpan.org>',
    VERSION_FROM        => 'lib/Gcode/ParseSpeed.pm',
    ABSTRACT_FROM       => 'lib/Gcode/ParseSpeed.pm',
    LICENSE             => 'perl',
    MIN_PERL_VERSION    => 5.010,
    EXE_FILES           => [],
    PL_FILES            => {},
    CONFIGURE_REQUIRES  => {
        'ExtUtils::MakeMaker' => 0,
    },
    BUILD_REQUIRES => {
        'Test::More' => 0,
    },
    PREREQ_PM => {
        #'Foo'      => 1.234,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'Gcode-ParseSpeed-*' },
#    META_MERGE          => {
#        'meta-spec' => { version => 2 },
#       resources => {
#           homepage   => 'http://homepage.for.the.project/',
#           bugtracker => {
#               web    => 'http://rt.cpan.org/Public/Dist/Display.html?Name=Gcode-ParseSpeed',
#               mailto => 'bug-{RT NAME}@rt.cpan.org>'
#           },
#           repository => {
#               type => 'git',
#               url  => 'https://github.com/gwadej/Gcode-ParseSpeed.git',
#               web  => 'https://github.com/gwadej/Gcode-ParseSpeed',
#       },
#    },
    test               => {
        TESTS => 't/*.t xt/*.t',
    },
);
