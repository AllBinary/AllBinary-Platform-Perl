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

package org::allbinary::layer::SingleLayerLayerProcessor;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::layer::LayerProcessor';



sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new('org::allbinary::layer::SingleLayerLayerManager'->new());
        # super(...) made $self above
    return $self;
}


# throws Exception
sub process {
    my ($self, $allBinaryLayerManager) = @_;
        my $layerManager = $self->getLayerManager();
        $self->processAt($allBinaryLayerManager, $layerManager->getLayerAt(0), 0);
}

use org::allbinary::layer::LayerProcessor;
use org::allbinary::layer::SingleLayerLayerManager;

1;

