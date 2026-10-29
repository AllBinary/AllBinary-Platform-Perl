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

package org::allbinary::game::layer::weapon::CollidableWeaponBehavior;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::layer::special::CollidableDestroyableDamageableBehavior';

our $NULL_COLLIDABLE_WEAPON_BEHAVIOR = 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT};

sub _init_fields {
    my ($self) = @_;
    $self->{collided} = 0;
    $self->{collisionHelper} = undef;
}


sub getNullInstance {
    my ($class) = @_;
        if ($org::allbinary::game::layer::weapon::CollidableWeaponBehavior::NULL_COLLIDABLE_WEAPON_BEHAVIOR == 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT}) {
            $org::allbinary::game::layer::weapon::CollidableWeaponBehavior::NULL_COLLIDABLE_WEAPON_BEHAVIOR = 'org::allbinary::game::layer::weapon::CollidableWeaponBehavior'->new(0);
        }
        return $org::allbinary::game::layer::weapon::CollidableWeaponBehavior::NULL_COLLIDABLE_WEAPON_BEHAVIOR;
}


sub new {
    my ($class, $collidable) = @_;
    my $self = $class->SUPER::new($collidable);
    $self->_init_fields();
        # super(...) made $self above
        $self->setCollided(0);
        $self->setCollidable(1);
        $self->{collisionHelper} = 'org::allbinary::game::collision::CollidableHelperFactory'->getInstance();
    return $self;
}


sub init {
    my ($self, $sourceLayerInterface) = @_;
        $self->setCollided(0);
        $self->{collisionHelper}->setOwnerLayerInterface($sourceLayerInterface);
}


sub isCollision {
    my ($self, $ownerLayer, $collisionLayer) = @_;
        if ($self->{collisionHelper}->isCollidable($collisionLayer)) {
            if ($ownerLayer->getGroupInterface()->[0] != $collisionLayer->getGroupInterface()->[0]) {
                return $self->SUPER::isCollision($ownerLayer, $collisionLayer);
            }
        }
        return 0;
}


# throws Exception
sub collide {
    my ($self, $ownerLayer, $collisionLayer) = @_;
        $self->SUPER::collide($ownerLayer, $collisionLayer);
        $self->{collided} = 1;
}


sub isCollisionInterface {
    my ($self, $ownerLayer, $collidableInterfaceCompositeInterface) = @_;
        if ($self->{collisionHelper}->isCollidable($collidableInterfaceCompositeInterface)) {
            my $layerInterface = $collidableInterfaceCompositeInterface;
            if ($ownerLayer->getGroupInterface()->[0] != $layerInterface->getGroupInterface()->[0]) {
                if ($self->{layerCollisionUtil}->isCollision($ownerLayer, $layerInterface)) {
                    return 1;
                }
            }
        }
        return 0;
}


# throws Exception
sub collideInterface {
    my ($self, $ownerLayer, $collidableInterfaceCompositeInterface) = @_;
        my $ownerDamageableInterface = $ownerLayer;
        my $damageableInterface = $collidableInterfaceCompositeInterface;
        $self->{damageUtil}->process($ownerDamageableInterface, $damageableInterface);
        $self->{collided} = 1;
}


sub getCollisionTypeWith {
    my ($self, $layerInterface) = @_;
        return 'org::allbinary::game::collision::CollisionTypeFactory'->getInstance()->{COLLISION};
}


sub isCollided {
    my ($self) = @_;
        return $self->{collided};
}


sub setCollided {
    my ($self, $collided) = @_;
        $self->{collided} = $collided;
}

use org::allbinary::game::collision::CollidableHelperFactory;
use org::allbinary::game::collision::CollidableInterfaceCompositeInterface;
use org::allbinary::game::collision::CollisionHelper;
use org::allbinary::game::collision::CollisionType;
use org::allbinary::game::collision::CollisionTypeFactory;
use org::allbinary::game::combat::damage::DamageableInterface;
use org::allbinary::game::layer::CollidableCompositeLayer;
use org::allbinary::game::layer::special::CollidableDestroyableDamageableBehavior;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::logic::NullUtil;

1;

