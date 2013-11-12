package SHARYANTO::Role::I18NRinci;

use 5.010;
use Log::Any '$log';
use Moo::Role;
use Perinci::Object;

our $VERSION = '0.66'; # VERSION

with 'SHARYANTO::Role::I18N';

requires 'lang';

sub langprop {
    my ($self, $meta, $prop) = @_;
    my $opts = {
        lang=>$self->lang,
    };
    rimeta($meta)->langprop($prop, $opts);
}

1;
# ABSTRACT: Role for class that wants to work with language and Rinci metadata

__END__

=pod

=encoding UTF-8

=head1 NAME

SHARYANTO::Role::I18NRinci - Role for class that wants to work with language and Rinci metadata

=head1 VERSION

version 0.66

=head1 DESCRIPTION

=head1 FUNCTIONS


None are exported by default, but they are exportable.

=head1 METHODS

=head2 $obj->langprop($meta, $prop)

=head1 HOMEPAGE

Please visit the project's homepage at L<https://metacpan.org/release/SHARYANTO-Roles>.

=head1 SOURCE

Source repository is at L<https://github.com/sharyanto/perl-SHARYANTO-Roles>.

=head1 BUGS

Please report any bugs or feature requests on the bugtracker website
L<https://rt.cpan.org/Public/Dist/Display.html?Name=SHARYANTO-Roles>

When submitting a bug or request, please include a test-file or a
patch to an existing test-file that illustrates the bug or desired
feature.

=head1 AUTHOR

Steven Haryanto <stevenharyanto@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Steven Haryanto.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
