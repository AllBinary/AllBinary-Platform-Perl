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

package org::allbinary::game::layer::special::CollidableCharacterNoDamageBehavior;
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


# throws Exception
sub collide {
    my ($self, $ownerLayer, $collidableInterfaceCompositeInterface) = @_;
        my $collisionTypeFactory = 'org::allbinary::game::collision::CollisionTypeFactory'->getInstance();
        my $collisionType = $collidableInterfaceCompositeInterface->getCollidableInferface()->getCollisionTypeWith($ownerLayer);
        if ($collisionType == $collisionTypeFactory->{PICKUP}) {
            my $collidableDestroyableDamageableLayer = $ownerLayer;
            $collidableDestroyableDamageableLayer->getPickupBehavior()->doPickupLayer($collidableInterfaceCompositeInterface);
        } else {
        }
}


# throws Exception
sub collideInterface {
    my ($self, $ownerLayer, $collidableInterfaceCompositeInterface) = @_;
        'org::allbinary::logic::communication::log::ForcedLogUtil'->log($self->{commonStrings}->{NOT_IMPLEMENTED}, $self);
}

use org::allbinary::game::collision::CollidableInterfaceCompositeInterface;
use org::allbinary::game::collision::CollisionType;
use org::allbinary::game::collision::CollisionTypeFactory;
use org::allbinary::game::layer::CollidableCompositeLayer;
use org::allbinary::game::layer::pickup::PickedUpLayerInterface;
use org::allbinary::logic::communication::log::ForcedLogUtil;
use org::allbinary::game::layer::special::CollidableDestroyableDamageableBehavior;

1;

