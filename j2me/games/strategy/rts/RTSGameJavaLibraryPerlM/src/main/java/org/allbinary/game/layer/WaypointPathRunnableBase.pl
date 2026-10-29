# 
# AllBinary Open License Version 1 
# Copyright (c) 2022 AllBinary 
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

package org::allbinary::game::layer::WaypointPathRunnableBase;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::thread::RunnableInterface','org::allbinary::thread::PriorityRunnable';


sub _init_fields {
    my ($self) = @_;
    $self->{layerDistanceUtil} = 'org::allbinary::math::LayerDistanceUtil'->getInstance();
    $self->{pathFindingLayer} = $org::allbinary::game::layer::NullPathFindingLayer::NULL_PATH_FINDING_LAYER;
    $self->{targetPathFindingLayer} = $org::allbinary::game::layer::NullPathFindingLayer::NULL_PATH_FINDING_LAYER;
    $self->{priorityP} = 2147483647;
    $self->{runningP} = 0;
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub isRunning {
    my ($self) = @_;
        return $self->{runningP};
}


sub setRunning {
    my ($self, $isRunning) = @_;
        $self->{runningP} = $isRunning;
}


# throws Exception
sub setThread {
    my ($self, $thread) = @_;
}


sub setTargetLayer {
    my ($self, $waypointLayer) = @_;
        $self->{targetPathFindingLayer} = $waypointLayer;
        $self->setPriority();
}


sub setPriority {
    my ($self) = @_;
        my $pathFindingLayer = $self->{pathFindingLayer};
        my $targetLayer = $self->{targetPathFindingLayer};
        if (defined($targetLayer)) {
            my $distance = $self->{layerDistanceUtil}->getDistance($targetLayer, $pathFindingLayer);
            my $distanceCategory = int($distance / 70);
            $self->{priorityP} = $distanceCategory;
        }
}


sub getTargetLayer {
    my ($self) = @_;
        return $self->{targetPathFindingLayer};
}


sub setUnitLayer {
    my ($self, $unitLayer) = @_;
        $self->{pathFindingLayer} = $unitLayer;
}


sub getPriority {
    my ($self) = @_;
        return $self->{priorityP};
}


sub isDone {
    my ($self) = @_;
        return 1;
}


sub run {
    my ($self) = @_;
}


sub reset {
    my ($self) = @_;
}

use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::math::LayerDistanceUtil;
use org::allbinary::thread::PriorityRunnable;
use org::allbinary::thread::RunnableInterface;
use org::allbinary::game::layer::NullPathFindingLayer;

1;

