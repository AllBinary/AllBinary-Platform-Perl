# 
# AllBinary Open License Version 1 
# Copyright (c) 2025 AllBinary 
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

package org::allbinary::game::layer::pickup::PickedUpLayerInterfaceFactoryBase;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::layer::pickup::PickedUpLayerInterfaceFactoryInterface';

our $NULL_PICKED_UP_LAYER_FACTORY_BASE = 'org::allbinary::game::layer::pickup::PickedUpLayerInterfaceFactoryBase'->new();

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getIconLayer {
    my ($self) = @_;
        die ("RuntimeException");
}


sub getAnimationInterface {
    my ($self) = @_;
        die ("RuntimeException");
}


sub getPickedUpLayerType {
    my ($self) = @_;
        die ("RuntimeException");
}

use org::allbinary::animation::Animation;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::game::layer::pickup::PickedUpLayerInterfaceFactoryInterface;

1;

