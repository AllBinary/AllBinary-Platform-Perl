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

package org::allbinary::layer::LayerProcessor;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::layer::LayerProcessorInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{layerManager} = undef;
}


sub new {
    my ($class, $layerManager) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{layerManager} = $layerManager;
    return $self;
}


# throws Exception
sub processAt {
    my ($self, $allBinaryLayerManager, $layerInterface, $index) = @_;
        die ($self->{commonStrings}->{NOT_IMPLEMENTED});
}


# throws Exception
sub isProcessorLayer {
    my ($self, $layerInterface) = @_;
        die ($self->{commonStrings}->{NOT_IMPLEMENTED});
}


sub getLayerManager {
    my ($self) = @_;
        return $self->{layerManager};
}


# throws Exception
sub process {
    my ($self, $allBinaryLayerManager) = @_;
        my $layerManager = $self->getLayerManager();
        my $size = $layerManager->getSize();
        for (my $index = 0; $index < $size; $index++) {
            $self->processAt($allBinaryLayerManager, $layerManager->getLayerAt($index), $index);
        }
}

use org::allbinary::string::CommonStrings;
use org::allbinary::layer::LayerProcessorInterface;

1;

