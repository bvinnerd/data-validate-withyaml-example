#!/usr/bin/env perl

use strict;
use warnings;
use lib 'extperlmods/lib/perl5';
use feature qw/say/;

use Data::Dumper;
use Data::Validate::WithYAML;

my $validator = Data::Validate::WithYAML->new('config.yml');

my %hash = (
	foo => 5,
	severity => 'debug',
);

my @invalid;

while (my ($name, $value) = each(%hash)) {
	push(@invalid, $name) unless ($validator->check($name, $value));
}

say(Dumper(\@invalid));
