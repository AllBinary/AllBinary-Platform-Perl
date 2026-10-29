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

package org::allbinary::game::layer::CollidableVehicleBehavior;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use POSIX ();
use parent -norequire,'org::allbinary::game::layer::special::CollidableDestroyableDamageableBehavior';


sub _init_fields {
    my ($self) = @_;
    $self->{totalImpactVelocity} = 0;
    $self->{halfImpactVelocityX} = 0;
    $self->{halfImpactVelocityY} = 0;
}


sub new {
    my ($class, $collidable) = @_;
    my $self = $class->SUPER::new($collidable);
    $self->_init_fields();
        # super(...) made $self above
    return $self;
}


# throws Exception
sub collide {
    my ($self, $ownerLayer, $collidableInterfaceCompositeInterface) = @_;
        my $collisionTypeFactory = 'org::allbinary::game::collision::CollisionTypeFactory'->getInstance();
        my $collisionType = $collidableInterfaceCompositeInterface->getCollidableInferface()->getCollisionTypeWith($ownerLayer);
        if ($collisionType == $collisionTypeFactory->{PICKUP}) {
            my $collidableDestroyableDamageableLayer = ($ownerLayer);
            $collidableDestroyableDamageableLayer->getPickupBehavior()->doPickupLayer($collidableInterfaceCompositeInterface);
        } elsif ($collisionType == $collisionTypeFactory->{COLLISION}) {
            $self->SUPER::collide($ownerLayer, $collidableInterfaceCompositeInterface);
        } else {
            $self->collideVehicle($ownerLayer, $collidableInterfaceCompositeInterface);
        }
}


sub collideInterface {
    my ($self, $ownerLayer, $collidableInterfaceCompositeInterface) = @_;
        'org::allbinary::logic::communication::log::ForcedLogUtil'->log("Don't Use Interface Version It Is Slower", $self);
}


sub collideVehicle {
    my ($self, $ownerLayer, $vehiclePropertiesCompositeInterface) = @_;
        my $ownerVehicleLayerInterface = ($ownerLayer);
        my $ownerVehicleProperties = $ownerVehicleLayerInterface->getVehicleProperties();
        my $vehicleProperties = $vehiclePropertiesCompositeInterface->getVehicleProperties();
        my $impactVelocityX = $ownerVehicleProperties->getVelocityProperties()->getVelocityXBasicDecimalP()->getUnscaled() - $vehicleProperties->getVelocityProperties()->getVelocityXBasicDecimalP()->getUnscaled();
        my $impactVelocityY = $ownerVehicleProperties->getVelocityProperties()->getVelocityYBasicDecimalP()->getUnscaled() - $vehicleProperties->getVelocityProperties()->getVelocityYBasicDecimalP()->getUnscaled();
        if ($impactVelocityX != 0) {
            $self->{halfImpactVelocityX} = (POSIX::floor(($impactVelocityX) / (2 ** (1))));
            $ownerVehicleProperties->getVelocityProperties()->getVelocityXBasicDecimalP()->addlong($self->{halfImpactVelocityX});
            $vehicleProperties->getVelocityProperties()->getVelocityXBasicDecimalP()->addlong($self->{halfImpactVelocityX});
        } else {
        }
        if ($impactVelocityY != 0) {
            $self->{halfImpactVelocityY} = (POSIX::floor(($impactVelocityY) / (2 ** (1))));
            $ownerVehicleProperties->getVelocityProperties()->getVelocityYBasicDecimalP()->addlong($self->{halfImpactVelocityY});
            $vehicleProperties->getVelocityProperties()->getVelocityXBasicDecimalP()->addlong($self->{halfImpactVelocityY});
        } else {
        }
        $self->collideFriction($ownerVehicleLayerInterface);
        $self->collideFriction($vehiclePropertiesCompositeInterface);
        $self->{totalImpactVelocity} = $impactVelocityX + $impactVelocityY;
}


sub collideFriction {
    my ($self, $vehiclePropertiesCompositeInterface) = @_;
        my $vehicleFrictionProperties = $vehiclePropertiesCompositeInterface->getVehicleProperties()->getVehicleFrictionProperties();
        $vehiclePropertiesCompositeInterface->getVehicleProperties()->getVehicleFrictionProperties()->friction($vehiclePropertiesCompositeInterface->getVehicleProperties()->getVelocityProperties(), $vehicleFrictionProperties->getCrashFrictionNominator());
}

use org::allbinary::game::layer::pickup::PickedUpLayerInterface;
use org::allbinary::logic::communication::log::ForcedLogUtil;
use org::allbinary::game::collision::CollidableInterfaceCompositeInterface;
use org::allbinary::game::collision::CollisionType;
use org::allbinary::game::collision::CollisionTypeFactory;
use org::allbinary::game::layer::special::CollidableDestroyableDamageableBehavior;
use org::allbinary::game::layer::special::CollidableDestroyableDamageableLayer;

1;

