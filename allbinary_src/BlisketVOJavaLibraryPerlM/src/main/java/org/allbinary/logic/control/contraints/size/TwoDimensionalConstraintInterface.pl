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
package org::allbinary::logic::control::contraints::size::TwoDimensionalConstraintInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub getHeight {
    my ($self) = @_;
    die "abstract method getHeight";
}


sub getWidth {
    my ($self) = @_;
    die "abstract method getWidth";
}


sub setHeight {
    my ($self, $heightSizeConstraintInterface) = @_;
    die "abstract method setHeight";
}


sub setWidth {
    my ($self, $widthSizeConstraintInterface) = @_;
    die "abstract method setWidth";
}


1;

