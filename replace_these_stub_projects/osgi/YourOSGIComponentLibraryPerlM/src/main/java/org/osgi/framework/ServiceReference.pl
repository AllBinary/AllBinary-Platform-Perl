# Generated Code Do Not Modify

# Java interface
package org::osgi::framework::ServiceReference;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub getProperty {
    my ($self, $key) = @_;
    die "abstract method getProperty";
}


sub getPropertyKeys {
    my ($self) = @_;
    die "abstract method getPropertyKeys";
}


1;

