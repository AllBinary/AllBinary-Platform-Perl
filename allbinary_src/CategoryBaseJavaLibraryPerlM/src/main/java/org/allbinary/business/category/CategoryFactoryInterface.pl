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



sub getRootInstance {
    my ($self) = @_;
    die "abstract method getRootInstance";
}


# Java overloaded method: Perl keeps the last definition
sub getRootInstance {
    my ($self, $categoryPath) = @_;
    die "abstract method getRootInstance";
}


sub getRootInstanceFromNode {
    my ($self, $node) = @_;
    die "abstract method getRootInstanceFromNode";
}


sub getInstance {
    my ($self, $rootCategoryInterface, $parentCategoryInterface, $name) = @_;
    die "abstract method getInstance";
}


# Java overloaded method: Perl keeps the last definition
sub getInstance {
    my ($self, $rootCategoryInterface, $parentCategoryInterface, $node) = @_;
    die "abstract method getInstance";
}


# Java overloaded method: Perl keeps the last definition
sub getInstance {
    my ($self, $rootCategoryInterface, $parentCategoryInterface, $categoryPropertiesHashMap) = @_;
    die "abstract method getInstance";
}

use java::util::HashMap;
use org::allbinary::logic::io::path::AbPath;
use org::w3c::dom::Node;

1;

