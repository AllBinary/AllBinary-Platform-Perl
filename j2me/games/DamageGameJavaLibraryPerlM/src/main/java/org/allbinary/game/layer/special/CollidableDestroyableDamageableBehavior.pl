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

package org::allbinary::game::layer::special::CollidableDestroyableDamageableBehavior;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::collision::CollidableBaseBehavior';


sub _init_fields {
    my ($self) = @_;
    $self->{damageUtil} = 'org::allbinary::game::combat::damage::DamageUtil'->getInstance();
}


sub new {
    my ($class, $collidable) = @_;
    my $self = $class->SUPER::new($collidable);
    $self->_init_fields();
        # super(...) made $self above
    return $self;
}


sub isCollision {
    my ($self, $ownerLayer, $collisionLayer) = @_;
        if ($ownerLayer->getGroupInterface()->[0] != $collisionLayer->getGroupInterface()->[0]) {
            return $self->SUPER::isCollision($ownerLayer, $collisionLayer);
        }
        return 0;
}


# throws Exception
sub collide {
    my ($self, $ownerLayer, $collidableInterfaceCompositeInterface) = @_;
        my $ownerCollidableDestroyableDamageableLayer = $ownerLayer;
        my $collidableDestroyableDamageableLayer = $collidableInterfaceCompositeInterface;
        $ownerCollidableDestroyableDamageableLayer->damage($collidableDestroyableDamageableLayer->getDamage(0), 0);
}


sub isCollisionInterface {
    my ($self, $ownerLayer, $collidableInterfaceCompositeInterface) = @_;
        'org::allbinary::logic::communication::log::ForcedLogUtil'->log("No Longer Used", $self);
        return 0;
}


# throws Exception
sub collideInterface {
    my ($self, $ownerLayer, $collidableInterfaceCompositeInterface) = @_;
        'org::allbinary::logic::communication::log::ForcedLogUtil'->log("No Longer Used", $self);
}

use org::allbinary::game::collision::CollidableBaseBehavior;
use org::allbinary::game::collision::CollidableInterfaceCompositeInterface;
use org::allbinary::game::combat::damage::DamageUtil;
use org::allbinary::game::layer::CollidableCompositeLayer;
use org::allbinary::logic::communication::log::ForcedLogUtil;

1;

