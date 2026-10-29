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

package org::allbinary::game::collision::layer::CollidableInterfaceLayerProcessor;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::layer::LayerProcessor';



sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new('org::allbinary::game::collision::layer::CollidableInterfaceLayerManager'->new());
        # super(...) made $self above
    return $self;
}


# throws Exception
sub processAt {
    my ($self, $allBinaryLayerManager, $layerInterface, $index) = @_;
        my $collidableInterfaceCompositeInterface = $layerInterface;
        if ($collidableInterfaceCompositeInterface->getCollidableInferface()->isCollidable($collidableInterfaceCompositeInterface)) {
            'org::allbinary::game::collision::layer::AllBinaryCollisionManager'->getInstance()->process($self->getLayerManager(), $collidableInterfaceCompositeInterface, $index);
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

use org::allbinary::game::collision::CollidableInterfaceCompositeInterface;
use org::allbinary::game::layer::CollidableCompositeLayer;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::layer::AllBinaryLayerManager;
use org::allbinary::layer::LayerProcessor;
use org::allbinary::game::collision::layer::CollidableInterfaceLayerManager;
use org::allbinary::game::collision::layer::AllBinaryCollisionManager;

1;

