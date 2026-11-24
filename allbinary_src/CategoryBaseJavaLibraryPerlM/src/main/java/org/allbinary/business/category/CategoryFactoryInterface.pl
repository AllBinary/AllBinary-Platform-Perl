#
# AllBinary Open License Version 1
# Copyright (c) 2011 AllBinary
# 
# By agreeing to this license you and any business entity you represent are
# legally bound to the AllBinary Open License Version 1 legal agreement.
# 
# You may obtain the AllBinary Open License Version 1 legal agreement from
# AllBinary or the root directory of AllBinary's AllBinary Platform repository.
# 
# Created By: Travis Berthelot
#  
# Generated Code Do Not Modify

# Java interface
package org::allbinary::business::category::CategoryFactoryInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub getRootInstance_j0 {
    my ($self) = @_;
    die "abstract method getRootInstance";
}


sub getRootInstance_j1 {
    my ($self, $categoryPath) = @_;
    die "abstract method getRootInstance";
}

sub getRootInstance {
    my ($invocant, @arguments) = @_;
    return $invocant->getRootInstance_j0(@arguments) if scalar(@arguments) == 0;
    return $invocant->getRootInstance_j1(@arguments) if scalar(@arguments) == 1;
    die "No method getRootInstance takes " . scalar(@arguments) . " arguments";
}


sub getRootInstanceFromNode {
    my ($self, $node) = @_;
    die "abstract method getRootInstanceFromNode";
}


sub getInstance_j3_1 {
    my ($self, $rootCategoryInterface, $parentCategoryInterface, $name) = @_;
    die "abstract method getInstance";
}


sub getInstance_j3_2 {
    my ($self, $rootCategoryInterface, $parentCategoryInterface, $node) = @_;
    die "abstract method getInstance";
}


sub getInstance_j3_3 {
    my ($self, $rootCategoryInterface, $parentCategoryInterface, $categoryPropertiesHashMap) = @_;
    die "abstract method getInstance";
}

sub getInstance {
    my ($invocant, @arguments) = @_;
    return $invocant->getInstance_j3(@arguments) if scalar(@arguments) == 3;
    die "No method getInstance takes " . scalar(@arguments) . " arguments";
}

sub getInstance_j3 {
    my ($invocant, @arguments) = @_;
    return $invocant->getInstance_j3_1(@arguments) if 1 && (!defined($arguments[0]) || (ref($arguments[0]) && ref($arguments[0]) ne 'ARRAY')) && (!defined($arguments[1]) || (ref($arguments[1]) && ref($arguments[1]) ne 'ARRAY')) && !ref($arguments[2]);
    return $invocant->getInstance_j3_2(@arguments) if 1 && (!defined($arguments[0]) || (ref($arguments[0]) && ref($arguments[0]) ne 'ARRAY')) && (!defined($arguments[1]) || (ref($arguments[1]) && ref($arguments[1]) ne 'ARRAY')) && (!defined($arguments[2]) || (ref($arguments[2]) && ref($arguments[2]) ne 'ARRAY'));
    return $invocant->getInstance_j3_3(@arguments);
}

use java::util::HashMap ();
use org::allbinary::logic::io::path::AbPath ();
use org::w3c::dom::Node ();

1;

