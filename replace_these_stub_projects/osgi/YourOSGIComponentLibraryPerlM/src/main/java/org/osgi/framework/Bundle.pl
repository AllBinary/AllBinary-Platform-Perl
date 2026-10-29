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
sub start {
    my ($self) = @_;
    die "abstract method start";
}


# throws BundleException
# Java overloaded method: Perl keeps the last definition
sub start {
    my ($self, $options) = @_;
    die "abstract method start";
}


1;

