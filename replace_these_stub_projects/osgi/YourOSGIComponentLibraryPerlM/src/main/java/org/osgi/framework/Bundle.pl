# Generated Code Do Not Modify

# Java interface
package org::osgi::framework::Bundle;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub getSymbolicName {
    my ($self) = @_;
    die "abstract method getSymbolicName";
}


# throws BundleException
sub start_j0 {
    my ($self) = @_;
    die "abstract method start";
}


# throws BundleException
sub start_j1 {
    my ($self, $options) = @_;
    die "abstract method start";
}

sub start {
    my ($invocant, @arguments) = @_;
    return $invocant->start_j0(@arguments) if scalar(@arguments) == 0;
    return $invocant->start_j1(@arguments) if scalar(@arguments) == 1;
    die "No method start takes " . scalar(@arguments) . " arguments";
}


1;

