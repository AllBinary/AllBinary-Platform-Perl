# Generated Code Do Not Modify

# Java interface
package org::osgi::framework::BundleContext;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub getBundles {
    my ($self) = @_;
    die "abstract method getBundles";
}


# throws BundleException
sub installBundle {
    my ($self, $location) = @_;
    die "abstract method installBundle";
}


sub registerService {
    my ($self, $clazz, $service, $properties) = @_;
    die "abstract method registerService";
}


sub getService {
    my ($self, $reference) = @_;
    die "abstract method getService";
}


# throws InvalidSyntaxException
sub getServiceReferences {
    my ($self, $clazz, $filter) = @_;
    die "abstract method getServiceReferences";
}


sub getServiceReference {
    my ($self, $clazz) = @_;
    die "abstract method getServiceReference";
}

# use java::util::Dictionary;

1;

