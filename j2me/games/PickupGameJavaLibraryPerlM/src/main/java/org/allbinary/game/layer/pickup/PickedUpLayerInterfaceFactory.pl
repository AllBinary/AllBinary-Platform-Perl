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

package org::allbinary::game::layer::pickup::PickedUpLayerInterfaceFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::layer::pickup::PickedUpLayerInterfaceFactoryBase';


sub _init_fields {
    my ($self) = @_;
    $self->{pickedUpLayerType} = undef;
    $self->{iconLayer} = undef;
    $self->{animationInterface} = undef;
}


sub new {
    my ($class, $pickeUpLayerType, $iconLayer, $animationInterface) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{pickedUpLayerType} = $pickeUpLayerType;
        $self->{animationInterface} = $animationInterface;
        $self->{iconLayer} = $iconLayer;
    return $self;
}


sub getIconLayer {
    my ($self) = @_;
        return $self->{iconLayer};
}


sub getAnimationInterface {
    my ($self) = @_;
        return $self->{animationInterface};
}


sub getPickedUpLayerType {
    my ($self) = @_;
        return $self->{pickedUpLayerType};
}

use org::allbinary::animation::Animation;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::game::layer::pickup::PickedUpLayerInterfaceFactoryBase;

1;

