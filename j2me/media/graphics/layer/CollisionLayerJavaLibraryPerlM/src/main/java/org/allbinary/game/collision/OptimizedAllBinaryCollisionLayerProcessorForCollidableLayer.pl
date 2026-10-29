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

package org::allbinary::game::collision::OptimizedAllBinaryCollisionLayerProcessorForCollidableLayer;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::layer::LayerProcessor';



sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new('org::allbinary::game::collision::OptimizedAllBinaryCollisionLayerManager'->new());
        # super(...) made $self above
    return $self;
}


# throws Exception
sub processAt {
    my ($self, $allBinaryLayerManager, $layerInterface, $startIndex) = @_;
        my $collidableInterfaceCompositeInterface = $layerInterface;
        my $collidableBase = $collidableInterfaceCompositeInterface->getCollidableInferface();
        if ($collidableBase->isCollidable($collidableInterfaceCompositeInterface)) {
            my $layerManager = $self->getLayerManager();
            my $size = $layerManager->getSize();
            my $collidableInterfaceCompositeInterface2 = undef;
            my $collidableBase2 = undef;
            for (my $index = $startIndex + 1; $index < $size; $index++) {
                $collidableInterfaceCompositeInterface2 = $layerManager->getLayerAt($index);
                $collidableBase2 = $collidableInterfaceCompositeInterface2->getCollidableInferface();
                if ($collidableBase2->isCollidable($collidableInterfaceCompositeInterface) && $collidableBase->isCollision($collidableInterfaceCompositeInterface, $collidableInterfaceCompositeInterface2)) {
                    $collidableBase->collide($collidableInterfaceCompositeInterface, $collidableInterfaceCompositeInterface2);
                    $collidableBase2->collide($collidableInterfaceCompositeInterface2, $collidableInterfaceCompositeInterface);
                }
            }
        }
}


sub isProcessorLayer {
    my ($self, $layerInterface) = @_;
        if ($layerInterface->implmentsCollidableInterface()) {
            return 1;
        } else {
            return 0;
        }
}

use org::allbinary::game::layer::CollidableCompositeLayer;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::layer::AllBinaryLayerManager;
use org::allbinary::layer::LayerManager;
use org::allbinary::layer::LayerProcessor;
use org::allbinary::game::collision::OptimizedAllBinaryCollisionLayerManager;

1;

