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

package org::allbinary::layer::AllBinaryLayerManager;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::layer::LayerManager';


sub _init_fields {
    my ($self) = @_;
    $self->{layerManagerEventHandler} = 'org::allbinary::layer::event::LayerManagerEventHandler'->getInstance();
    $self->{createLayerManagerEvent} = 'org::allbinary::layer::event::LayerManagerEvent'->new($self, $self->{layerManagerEventHandler}->{CREATE});
    $self->{deleteLayerManagerEvent} = 'org::allbinary::layer::event::LayerManagerEvent'->new($self, $self->{layerManagerEventHandler}->{DELETE});
    $self->{basicLayerProcessorArray} = [(undef) x (0)];
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new('org::allbinary::layer::LayerManagerNoDebug'->getInstance());
    $self->_init_fields();
        # super(...) made $self above
    return $self;
}


sub getLayerProcessorArray {
    my ($self) = @_;
        return $self->{basicLayerProcessorArray};
}


sub setLayerProcessorArray {
    my ($self, $layerProcessorArray) = @_;
        $self->{basicLayerProcessorArray} = $layerProcessorArray;
}


sub log {
    my ($self) = @_;
        my $size = scalar(@{$self->{basicLayerProcessorArray}});
        for (my $index = 0; $index < $size; $index++) {
            my $layerProcessorInterface = $self->{basicLayerProcessorArray}->[$index];
        }
}


# throws Exception
sub append {
    my ($self, $layerInterface) = @_;
        if (!$self->contains($layerInterface)) {
            $self->appendProcessors($layerInterface);
            $self->SUPER::append($layerInterface);
        }
}


# throws Exception
sub appendAt {
    my ($self, $layerInterface, $index) = @_;
        if (!$self->contains($layerInterface)) {
            $self->appendProcessors($layerInterface);
            $self->SUPER::appendAt($layerInterface, $index);
        }
}


# throws Exception
sub appendProcessors {
    my ($self, $layerInterface) = @_;
        $self->{createLayerManagerEvent}->setLayerInterface($layerInterface);
        $self->{layerManagerEventHandler}->fireEvent($self->{createLayerManagerEvent});
        my $layerProcessorInterface = undef;
        for (my $index = scalar(@{$self->{basicLayerProcessorArray}}); --$index >= 0; ) {
            $layerProcessorInterface = $self->{basicLayerProcessorArray}->[$index];
            if ($layerProcessorInterface->isProcessorLayer($layerInterface)) {
                $layerProcessorInterface->getLayerManager()->append($layerInterface);
            }
        }
}


# throws Exception
sub remove {
    my ($self, $layerInterface) = @_;
        $self->{deleteLayerManagerEvent}->setLayerInterface($layerInterface);
        $self->{layerManagerEventHandler}->fireDeleteEvent($self->{deleteLayerManagerEvent});
        my $layerProcessorInterface = undef;
        for (my $index = scalar(@{$self->{basicLayerProcessorArray}}); --$index >= 0; ) {
            $layerProcessorInterface = $self->{basicLayerProcessorArray}->[$index];
            $layerProcessorInterface->getLayerManager()->remove($layerInterface);
        }
        $self->SUPER::remove($layerInterface);
}


# throws Exception
sub process {
    my ($self) = @_;
        my $layerProcessorInterface = undef;
        my $size = scalar(@{$self->{basicLayerProcessorArray}});
        for (my $index = 0; $index < $size; $index++) {
            $layerProcessorInterface = $self->{basicLayerProcessorArray}->[$index];
            $layerProcessorInterface->process($self);
        }
}


# throws Exception
sub cleanup {
    my ($self) = @_;
        my $layerProcessorInterface = undef;
        my $size = scalar(@{$self->{basicLayerProcessorArray}});
        for (my $index = 0; $index < $size; $index++) {
            $layerProcessorInterface = $self->{basicLayerProcessorArray}->[$index];
            $layerProcessorInterface->getLayerManager()->cleanup();
        }
        $self->SUPER::cleanup();
}

use org::allbinary::layer::event::LayerManagerEvent;
use org::allbinary::layer::event::LayerManagerEventHandler;
use org::allbinary::layer::LayerManager;
use org::allbinary::layer::LayerManagerNoDebug;

1;

