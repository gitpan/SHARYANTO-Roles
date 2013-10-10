use strict;
use warnings;

# this test was generated with Dist::Zilla::Plugin::Test::Compile 2.030

use Test::More  tests => 9 + ($ENV{AUTHOR_TESTING} ? 1 : 0);



my @module_files = (
    'SHARYANTO/Role/BorderStyle.pm',
    'SHARYANTO/Role/ColorTheme.pm',
    'SHARYANTO/Role/Doc/Section.pm',
    'SHARYANTO/Role/Doc/Section/AddTextLines.pm',
    'SHARYANTO/Role/I18N.pm',
    'SHARYANTO/Role/I18NMany.pm',
    'SHARYANTO/Role/I18NRinci.pm',
    'SHARYANTO/Role/TermAttrs.pm',
    'SHARYANTO/Roles.pm'
);



# no fake home requested

use IPC::Open3;
use IO::Handle;

my @warnings;
for my $lib (@module_files)
{
    # see L<perlfaq8/How can I capture STDERR from an external command?>
    my $stdin = '';     # converted to a gensym by open3
    my $stderr = IO::Handle->new;

    my $pid = open3($stdin, '>&STDERR', $stderr, qq{$^X -Mblib -e"require q[$lib]"});
    binmode $stderr, ':crlf' if $^O; # eq 'MSWin32';
    waitpid($pid, 0);
    is($? >> 8, 0, "$lib loaded ok");

    if (my @_warnings = <$stderr>)
    {
        warn @_warnings;
        push @warnings, @_warnings;
    }
}



is(scalar(@warnings), 0, 'no warnings found') if $ENV{AUTHOR_TESTING};


