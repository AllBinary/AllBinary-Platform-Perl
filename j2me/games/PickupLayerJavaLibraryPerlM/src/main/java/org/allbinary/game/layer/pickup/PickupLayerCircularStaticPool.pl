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

package org::allbinary::game::layer::pickup::PickupLayerCircularStaticPool;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::layer::AllBinaryLayerCircularPool';

our $SINGLETON = 'org::allbinary::game::layer::pickup::PickupLayerCircularStaticPool'->new();


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::layer::pickup::PickupLayerCircularStaticPool::SINGLETON;
}


# throws Exception
sub getInstanceXYZ {
    my ($self, $pickedUpLayerInterfaceFactoryInterface, $x, $y, $z) = @_;
        my $pickupLayer = $self->getNextInstance();
        $pickupLayer->initXYZ($x, $y, $z);
        $pickupLayer->init($pickedUpLayerInterfaceFactoryInterface, $pickedUpLayerInterfaceFactoryInterface->getAnimationInterface());
        return $pickupLayer;
}

use org::allbinary::layer::AllBinaryLayerCircularPool;

1;

