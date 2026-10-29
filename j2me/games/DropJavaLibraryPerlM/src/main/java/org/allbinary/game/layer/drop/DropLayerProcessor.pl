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

package org::allbinary::game::layer::drop::DropLayerProcessor;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::layer::BasicLayerProcessor';

our $LAYER_PROCESSOR = 'org::allbinary::game::layer::drop::DropLayerProcessor'->new();


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::layer::drop::DropLayerProcessor::LAYER_PROCESSOR;
}


# throws Exception
sub process {
    my ($self, $allBinaryLayerManager) = @_;
        my $list = $self->getList();
        my $size = $list->size();
        my $layerInterface = undef;
        my $dropLayerInterface = undef;
        for (my $index = 0; $index < $size; $index++) {
            $layerInterface = $list->{objectArray}->[$index];
            $dropLayerInterface = $layerInterface;
            $layerInterface = $dropLayerInterface->getDroppedLayer();
            $allBinaryLayerManager->append($layerInterface);
        }
        $list->clear();
}

use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::layer::AllBinaryLayerManager;
use org::allbinary::layer::BasicLayerProcessor;
use org::allbinary::util::BasicArrayList;

1;

