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
package org::allbinary::business::category::hierarchy::CategoryHierarchyInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub getLevel {
    my ($self) = @_;
    die "abstract method getLevel";
}


sub getLevelString {
    my ($self) = @_;
    die "abstract method getLevelString";
}


sub getRoot {
    my ($self) = @_;
    die "abstract method getRoot";
}


sub getParent {
    my ($self) = @_;
    die "abstract method getParent";
}


sub setLevel {
    my ($self, $level) = @_;
    die "abstract method setLevel";
}


sub setRoot {
    my ($self, $categoryInterface) = @_;
    die "abstract method setRoot";
}


sub setParent {
    my ($self, $categoryInterface) = @_;
    die "abstract method setParent";
}

use org::allbinary::business::category::CategoryInterface;

1;

