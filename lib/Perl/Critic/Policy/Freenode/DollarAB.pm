package Perl::Critic::Policy::Freenode::DollarAB;

use strict;
use warnings;

use Perl::Critic::Utils qw(:severities :classification :ppi);
use parent 'Perl::Critic::Policy';

our $VERSION = '0.013';

use constant DESC => 'Using $a or $b outside sort()';
use constant EXPL => '$a and $b are special package variables for use in sort() and related functions. Declaring them as lexicals like "my $a" may break sort(). Use different variable names.';

sub supported_parameters { () }
sub default_severity { $SEVERITY_HIGH }
sub default_themes { 'freenode' }
sub applies_to { 'PPI::Token::Symbol' }

my %sorters = (
	sort      => 1,
	reduce    => 1,
	pairgrep  => 1,
	pairfirst => 1,
	pairmap   => 1,
);

sub violates {
	my ($self, $elem) = @_;
	return () unless $elem->symbol eq '$a' or $elem->symbol eq '$b';
	
	my $name = $self->_find_sorter($elem);
	return $self->violation(DESC, EXPL, $elem) unless exists $sorters{$name};
	return ();
}

sub _find_sorter {
	my ($self, $elem) = @_;
	
	my $outer = $elem;
	$outer = $outer->parent until !$outer or $outer->isa('PPI::Structure::Block');
	return '' unless $outer and $outer->isa('PPI::Structure::Block');
	
	# Find function or method call (assumes block/sub is first argument)
	my $function = $outer->previous_token;
	$function = $function->previous_token until !$function
		or ($function->isa('PPI::Token::Word')
			and (is_method_call $function or is_function_call $function or is_hash_key $function));
	return '' unless $function and $function->isa('PPI::Token::Word')
		and (is_method_call $function or is_function_call $function or is_hash_key $function);
	
	my $name = $function;
	$name =~ s/.+:://;
	return $name;
}

1;

=head1 NAME

Perl::Critic::Policy::Freenode::DollarAB - Don't use $a or $b as variable names
outside sort

=head1 DESCRIPTION

The special variables C<$a> and C<$b> are reserved for C<sort()> and similar
functions which assign to them to iterate over pairs of values. These are
global variables, and declaring them as lexical variables with C<my> to use
them outside this context can break usage of these functions. Use different
names for your variables.

  my $a = 1;                  # not ok
  my $abc = 1;                # ok
  sort { $a <=> $b } (3,2,1); # ok

=head1 AFFILIATION

This policy is part of L<Perl::Critic::Freenode>.

=head1 CONFIGURATION

This policy is not configurable except for the standard options.

=head1 AUTHOR

Dan Book, C<dbook@cpan.org>

=head1 COPYRIGHT AND LICENSE

Copyright 2015, Dan Book.

This library is free software; you may redistribute it and/or modify it under
the terms of the Artistic License version 2.0.

=head1 SEE ALSO

L<Perl::Critic>
