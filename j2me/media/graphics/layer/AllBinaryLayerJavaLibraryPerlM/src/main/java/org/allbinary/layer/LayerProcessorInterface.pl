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

# Java interface
package org::allbinary::layer::LayerProcessorInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::layer::BasicLayerProcessorInterface';



sub getLayerManager {
    my ($self) = @_;
    die "abstract method getLayerManager";
}


# throws Exception
sub processAt {
    my ($self, $allBinaryLayerManager, $layerInterface, $index) = @_;
    die "abstract method processAt";
}


# throws Exception
sub isProcessorLayer {
    my ($self, $layerInterface) = @_;
    die "abstract method isProcessorLayer";
}

use org::allbinary::layer::BasicLayerProcessorInterface;

1;

