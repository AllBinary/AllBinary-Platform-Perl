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

package org::allbinary::game::collision::layer::AllBinaryCollisionManager;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $allBinaryCollisionManager = 'org::allbinary::game::collision::layer::AllBinaryCollisionManager'->new();


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::collision::layer::AllBinaryCollisionManager::allBinaryCollisionManager;
}


# throws Exception
sub process {
    my ($self, $layerManager, $collidableInterfaceCompositeInterface, $startIndex) = @_;
        my $size = $layerManager->getSize();
        for (my $index = $startIndex + 1; $index < $size; $index++) {
            my $collidableInterfaceCompositeInterface2 = $layerManager->getLayerAt($index);
            $self->collide($layerManager, $collidableInterfaceCompositeInterface, $collidableInterfaceCompositeInterface2);
        }
}


# throws Exception
sub collide {
    my ($self, $layerManager, $collidableInterfaceCompositeInterface, $collidableInterfaceCompositeInterface2) = @_;
        my $collidableBase2 = $collidableInterfaceCompositeInterface2->getCollidableInferface();
        my $collidableBase = $collidableInterfaceCompositeInterface->getCollidableInferface();
        if ($collidableBase2->isCollidable($collidableInterfaceCompositeInterface)) {
            if ($collidableBase->isCollisionInterface($collidableInterfaceCompositeInterface, $collidableInterfaceCompositeInterface2)) {
                $collidableBase->collideInterface($collidableInterfaceCompositeInterface, $collidableInterfaceCompositeInterface2);
                $collidableBase2->collideInterface($collidableInterfaceCompositeInterface, $collidableInterfaceCompositeInterface);
            }
        }
}

use org::allbinary::game::collision::CollidableBaseBehavior;
use org::allbinary::game::collision::CollidableInterfaceCompositeInterface;
use org::allbinary::game::layer::CollidableCompositeLayer;
use org::allbinary::layer::LayerManager;

1;

