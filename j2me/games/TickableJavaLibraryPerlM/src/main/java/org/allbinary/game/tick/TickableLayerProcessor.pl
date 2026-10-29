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

package org::allbinary::game::tick::TickableLayerProcessor;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::layer::LayerProcessor';



sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new('org::allbinary::game::tick::TickableLayerManager'->new());
        # super(...) made $self above
    return $self;
}


# throws Exception
sub processAt {
    my ($self, $allBinaryLayerManager, $layerInterface, $index) = @_;
        my $tickableInterface = $layerInterface;
        $tickableInterface->processTick($allBinaryLayerManager);
}


sub isProcessorLayer {
    my ($self, $layerInterface) = @_;
        if ($layerInterface->implmentsTickableInterface()) {
            return 1;
        } else {
            return 0;
        }
}

use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::layer::AllBinaryLayerManager;
use org::allbinary::layer::LayerProcessor;
use org::allbinary::game::tick::TickableLayerManager;

1;

