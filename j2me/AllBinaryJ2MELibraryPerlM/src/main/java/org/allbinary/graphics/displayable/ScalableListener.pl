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
package org::allbinary::graphics::displayable::ScalableListener;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub getRatio {
    my ($self, $ratio) = @_;
    die "abstract method getRatio";
}


sub getLeft {
    my ($self, $xOffset) = @_;
    die "abstract method getLeft";
}


sub getTop {
    my ($self, $yOffset) = @_;
    die "abstract method getTop";
}


sub scale {
    my ($self, $ratio) = @_;
    die "abstract method scale";
}


1;

