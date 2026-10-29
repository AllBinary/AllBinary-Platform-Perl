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

package org::allbinary::game::ag::layer::pickup::life::LifeLayerCircularStaticPool;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::layer::AllBinaryLayerCircularPool';



sub new {
    my ($class, $allbinaryLayerFactoryInterface, $total) = @_;
    my $self = $class->SUPER::new();
        $self->SUPER::initAllBinaryLayerCircularPool($allbinaryLayerFactoryInterface, $total);
    return $self;
}


# throws Exception
sub visit {
    my ($self, $sourceLayerInterface) = @_;
        my $lifeLayer = $self->getNextInstance();
        my $lifeInterfaceCompositeInterface = $sourceLayerInterface;
        my $lifeInterface = $lifeInterfaceCompositeInterface->getLifeInterface();
        $lifeLayer->visit($lifeInterface);
}

use org::allbinary::game::ag::life::Life;
use org::allbinary::game::ag::life::LifeInterfaceCompositeInterface;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::layer::AllBinaryLayerCircularPool;
use org::allbinary::layer::AllBinaryLayerFactoryInterface;

1;

