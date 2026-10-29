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

package org::allbinary::game::layer::pickup::PickupBehavior;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::layer::pickup::PickupBehaviorInterface';

our $NULL_PICKUP_BEHAVIOR = 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT};

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{countedIndex} = undef;
    $self->{ownerLayerInterface} = undef;
}


sub getNullInstance {
    my ($class) = @_;
        if ($org::allbinary::game::layer::pickup::PickupBehavior::NULL_PICKUP_BEHAVIOR == 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT}) {
            $org::allbinary::game::layer::pickup::PickupBehavior::NULL_PICKUP_BEHAVIOR = 'org::allbinary::game::layer::pickup::PickupBehavior'->new('org::allbinary::game::layer::CollidableCompositeLayer'->getNullInstance(), 0);
        }
        return $org::allbinary::game::layer::pickup::PickupBehavior::NULL_PICKUP_BEHAVIOR;
}


sub new {
    my ($class, $ownerLayerInterface, $countedIndex) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{ownerLayerInterface} = $ownerLayerInterface;
        $self->{countedIndex} = $countedIndex;
    return $self;
}


sub doPickup {
    my ($self, $pickupProcessorInterface) = @_;
        try {
            my $healthInterfaceCompositeInterface = $self->{ownerLayerInterface};
            if ($healthInterfaceCompositeInterface->getHealthInterface()->isAlive()) {
                $pickupProcessorInterface->process($self->{ownerLayerInterface});
            }
        } catch ($e) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            $self->{logUtil}->put($commonStrings->{EXCEPTION}, $self, "doPickup", $e);
        }
}


sub doPickupLayer {
    my ($self, $pickupLayerInterface) = @_;
        try {
            my $pickedUpLayerInterfaceFactoryInterface = $pickupLayerInterface->getPickedUpLayerInterfaceFactoryInterface();
            my $pickedUpLayerType = $pickedUpLayerInterfaceFactoryInterface->getPickedUpLayerType();
            my $pickedUpLayerTypeFactory = 'org::allbinary::game::layer::pickup::PickedUpLayerTypeFactory'->getInstance();
            if ($pickedUpLayerType == $pickedUpLayerTypeFactory->{BEAM} || $pickedUpLayerType == $pickedUpLayerTypeFactory->{MINE} || $pickedUpLayerType == $pickedUpLayerTypeFactory->{PROJECTILE} || $pickedUpLayerType == $pickedUpLayerTypeFactory->{ENHANCEMENT}) {
                $self->add($pickedUpLayerInterfaceFactoryInterface);
            } elsif ($pickedUpLayerInterfaceFactoryInterface->getPickedUpLayerType() == $pickedUpLayerTypeFactory->{PART}) {
                my $collidableDestroyableDamageableLayer = $self->{ownerLayerInterface};
                $collidableDestroyableDamageableLayer->addPart($pickedUpLayerInterfaceFactoryInterface);
            } elsif ($pickedUpLayerType == $pickedUpLayerTypeFactory->{NONE}) {
            } else {
                my $pickupProcessorInterface = $pickedUpLayerInterfaceFactoryInterface;
                $self->doPickup($pickupProcessorInterface);
            }
            $pickupLayerInterface->setPickedUp();
        } catch ($e) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            'org::allbinary::logic::communication::log::PreLogUtil'->putOE($commonStrings->{EXCEPTION}, $self, "doPickup", $e);
        }
}


sub add {
    my ($self, $countedPickedUpLayerInterfaceFactoryInterface) = @_;
        my $partIndex = $countedPickedUpLayerInterfaceFactoryInterface->getId() + $self->{countedIndex};
        $self->addAt($countedPickedUpLayerInterfaceFactoryInterface, $partIndex);
}


sub addAt {
    my ($self, $countedPickedUpLayerInterfaceFactoryInterface, $partIndex) = @_;
        my $collidableDestroyableDamageableLayer = $self->{ownerLayerInterface};
        my $countedLayerInterfaceFactory = $collidableDestroyableDamageableLayer->getPartInterfaceArray()->[$partIndex];
        $countedLayerInterfaceFactory->setTotal($countedLayerInterfaceFactory->getTotal() + $countedPickedUpLayerInterfaceFactoryInterface->getTotal());
}


sub getFirstAvailableCountedLayerInterfaceFactory {
    my ($self, $pickedUpLayerTypeArray) = @_;
        my $collidableDestroyableDamageableLayer = $self->{ownerLayerInterface};
        my $partInterfaceArray = $collidableDestroyableDamageableLayer->getPartInterfaceArray();
        my $size = scalar(@{$partInterfaceArray});
        my $nextCountedLayerInterfaceFactory = undef;
        my $countedPickedUpLayerInterfaceFactory = undef;
        for (my $index = $self->{countedIndex}; $index < $size; $index++) {
            $nextCountedLayerInterfaceFactory = $collidableDestroyableDamageableLayer->getPartInterfaceArray()->[$index];
            $countedPickedUpLayerInterfaceFactory = $nextCountedLayerInterfaceFactory->getCountedPickedUpLayerInterfaceFactory();
            for (my $index2 = scalar(@{$pickedUpLayerTypeArray}); --$index2 >= 0; ) {
                if ($countedPickedUpLayerInterfaceFactory->getPickedUpLayerType() == $pickedUpLayerTypeArray->[$index2]) {
                    if ($nextCountedLayerInterfaceFactory->getTotal() > 0) {
                        return $nextCountedLayerInterfaceFactory;
                    }
                }
            }
        }
        return $org::allbinary::game::part::CountedLayerInterfaceFactoryPart::NULL_COUNTED_LAYER_INTERFACE_FACTORY;
}


# throws Exception
sub getCountedLayerInterfaceFactoryForSlot {
    my ($self, $slotIndex) = @_;
        my $currentSlot = 0;
        my $collidableDestroyableDamageableLayer = $self->{ownerLayerInterface};
        my $partInterfaceArray = $collidableDestroyableDamageableLayer->getPartInterfaceArray();
        my $size = scalar(@{$partInterfaceArray});
        my $nextCountedLayerInterfaceFactory = undef;
        for (my $index = $self->{countedIndex}; $index < $size; $index++) {
            $nextCountedLayerInterfaceFactory = $collidableDestroyableDamageableLayer->getPartInterfaceArray()->[$index];
            if ($nextCountedLayerInterfaceFactory->getTotal() > 0) {
                if ($currentSlot == $slotIndex) {
                    return $nextCountedLayerInterfaceFactory;
                } else {
                    $currentSlot++;
                }
            }
        }
        return $org::allbinary::game::part::CountedLayerInterfaceFactoryPart::NULL_COUNTED_LAYER_INTERFACE_FACTORY;
}


sub getCountedIndex {
    my ($self) = @_;
        return $self->{countedIndex};
}

use org::allbinary::game::health::HealthInterfaceCompositeInterface;
use org::allbinary::game::layer::CollidableCompositeLayer;
use org::allbinary::game::layer::special::CollidableDestroyableDamageableLayer;
use org::allbinary::game::part::CountedLayerInterfaceFactoryPart;
use org::allbinary::game::part::PartInterface;
use org::allbinary::logic::NullUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::communication::log::PreLogUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::game::layer::pickup::PickupBehaviorInterface;
use org::allbinary::game::layer::pickup::PickedUpLayerTypeFactory;

1;

