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
package org::allbinary::bounds::BoundsVisitorInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub getX {
    my ($self) = @_;
    die "abstract method getX";
}


sub getY {
    my ($self) = @_;
    die "abstract method getY";
}


sub maxX {
    my ($self) = @_;
    die "abstract method maxX";
}


sub maxY {
    my ($self) = @_;
    die "abstract method maxY";
}


sub minX {
    my ($self) = @_;
    die "abstract method minX";
}


sub minY {
    my ($self) = @_;
    die "abstract method minY";
}


1;

