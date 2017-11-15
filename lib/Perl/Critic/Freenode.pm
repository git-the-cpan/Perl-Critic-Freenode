package Perl::Critic::Freenode;

use strict;
use warnings;

our $VERSION = '0.010';

1;

=head1 NAME

Perl::Critic::Freenode - Perl::Critic policies inspired by #perl on
freenode IRC

=head1 SYNOPSIS

  $ perlcritic --theme freenode script.pl
  $ perlcritic --theme freenode lib/

=head1 DESCRIPTION

A set of L<Perl::Critic> policies to enforce the practices generally
recommended by the denizens of #perl on L<Freenode IRC|https://freenode.net/>.
Because this policy "theme" is designed to be used with zero configuration on
the command line, some duplication will occur if it is used in combination with
core L<Perl::Critic> policies.

=head1 AFFILIATION

This module has no functionality, but instead contains documentation for this
distribution and acts as a means of pulling other modules into a bundle. All of
the Policy modules contained herein will have an "AFFILIATION" section
announcing their participation in this grouping.

=head1 POLICIES

=over

=item L<Perl::Critic::Policy::Freenode::AmpersandSubCalls>

Don't use C<&> to call subroutines

=item L<Perl::Critic::Policy::Freenode::BarewordFilehandles>

Don't use bareword filehandles other than built-ins

=item L<Perl::Critic::Policy::Freenode::DiscouragedModules>

Various modules discouraged from use

=item L<Perl::Critic::Policy::Freenode::DollarAB>

Don't use C<$a> or C<$b> as variable names outside C<sort()>

=item L<Perl::Critic::Policy::Freenode::Each>

Don't use C<each()> to iterate through a hash

=item L<Perl::Critic::Policy::Freenode::EmptyReturn>

Don't use C<return> with no arguments

=item L<Perl::Critic::Policy::Freenode::ModPerl>

Don't use C<mod_perl> to write web applications

=item L<Perl::Critic::Policy::Freenode::OpenArgs>

Always use the three-argument form of C<open()>

=item L<Perl::Critic::Policy::Freenode::Prototypes>

Don't use function prototypes

=item L<Perl::Critic::Policy::Freenode::StrictWarnings>

Always use L<strict> and L<warnings>, or a module that imports these

=item L<Perl::Critic::Policy::Freenode::Threads>

Interpreter-based threads are officially discouraged

=item L<Perl::Critic::Policy::Freenode::Wantarray>

Don't write context-sensitive functions using C<wantarray()>

=item L<Perl::Critic::Policy::Freenode::WarningsSwitch>

Scripts should not use the C<-w> switch on the shebang line

=item L<Perl::Critic::Policy::Freenode::WhileDiamondDefaultAssignment>

Don't use C<while> with implicit assignment to C<$_>

=back

=head1 CONFIGURATION AND ENVIRONMENT

All policies included are in the "freenode" theme. See the L<Perl::Critic>
documentation for how to make use of this.

=head1 AUTHOR

Dan Book, C<dbook@cpan.org>

=head1 CONTRIBUTORS

=over

=item H.Merijn Brand (Tux)

=item John SJ Anderson (genehack)

=item Matt S Trout (mst)

=back

=head1 COPYRIGHT AND LICENSE

Copyright 2015, Dan Book.

This library is free software; you may redistribute it and/or modify it under
the terms of the Artistic License version 2.0.

=head1 SEE ALSO

L<Perl::Critic>
