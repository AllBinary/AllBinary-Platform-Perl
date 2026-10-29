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
package org::allbinary::game::layer::pickup::PickedUpLayerInterfaceFactoryInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub getPickedUpLayerType {
    my ($self) = @_;
    die "abstract method getPickedUpLayerType";
}


sub getIconLayer {
    my ($self) = @_;
    die "abstract method getIconLayer";
}


sub getAnimationInterface {
    my ($self) = @_;
    die "abstract method getAnimationInterface";
}

use org::allbinary::animation::Animation;
use org::allbinary::layer::AllBinaryLayer;

1;

