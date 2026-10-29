# 
# AllBinary Open License Version 1 
# Copyright (c) 2003 AllBinary 
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

package org::allbinary::game::layer::CollidableRTSBehavior;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::layer::special::CollidableDestroyableDamageableBehavior';



sub new {
    my ($class, $collidable) = @_;
    my $self = $class->SUPER::new($collidable);
        # super(...) made $self above
    return $self;
}


sub isCollision {
    my ($self, $ownerLayer, $collidableInterfaceCompositeInterface) = @_;
        my $collisionTypeFactory = 'org::allbinary::game::collision::CollisionTypeFactory'->getInstance();
        my $collisionType = $collidableInterfaceCompositeInterface->getCollidableInferface()->getCollisionTypeWith($ownerLayer);
        if ($collisionType == $collisionTypeFactory->{PICKUP}) {
        } elsif ($collisionType == $collisionTypeFactory->{COLLISION}) {
            return $self->SUPER::isCollision($ownerLayer, $collidableInterfaceCompositeInterface);
        } else {
            if ($collidableInterfaceCompositeInterface->getX2() <= $ownerLayer->getXP() || $collidableInterfaceCompositeInterface->getY2() <= $ownerLayer->getYP() || $collidableInterfaceCompositeInterface->getYP() >= $ownerLayer->getY2() || $collidableInterfaceCompositeInterface->getXP() >= $ownerLayer->getX2()) {
                return 0;
            } else {
                return 1;
            }
        }
        return 0;
}


# throws Exception
sub collide {
    my ($self, $ownerLayer, $collidableInterfaceCompositeInterface) = @_;
        my $collisionTypeFactory = 'org::allbinary::game::collision::CollisionTypeFactory'->getInstance();
        my $collisionType = $collidableInterfaceCompositeInterface->getCollidableInferface()->getCollisionTypeWith($ownerLayer);
        if ($collisionType == $collisionTypeFactory->{PICKUP}) {
        } elsif ($collisionType == $collisionTypeFactory->{COLLISION}) {
            $self->SUPER::collide($ownerLayer, $collidableInterfaceCompositeInterface);
        } else {
            $self->collideNone($ownerLayer, $collidableInterfaceCompositeInterface);
        }
}


# throws Exception
sub collideNone {
    my ($self, $ownerLayer, $collidableInterface) = @_;
}

use org::allbinary::game::collision::CollisionType;
use org::allbinary::game::collision::CollisionTypeFactory;
use org::allbinary::game::layer::special::CollidableDestroyableDamageableBehavior;

1;

