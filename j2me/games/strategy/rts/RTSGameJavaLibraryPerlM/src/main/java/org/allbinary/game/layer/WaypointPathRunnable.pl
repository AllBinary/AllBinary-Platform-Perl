# 
# AllBinary Open License Version 1 
# Copyright (c) 2003 AllBinary 
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

package org::allbinary::game::layer::WaypointPathRunnable;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use Time::HiRes ();
use parent -norequire,'org::allbinary::game::layer::WaypointPathRunnableBase';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
    return $self;
}


sub run {
    my ($self) = @_;
        try {
            $self->{pathFindingLayer}->getWaypointRunnableLogHelper()->start($self->{pathFindingLayer});
            my $waypointBehavior = $self->{pathFindingLayer}->getWaypointBehavior();
            my $geographicMapCellPosition = $self->{pathFindingLayer}->getCurrentGeographicMapCellPosition();
            if (!defined($geographicMapCellPosition)) {
                die ("Should never be running here");
            }
            $waypointBehavior->setWaypointPathsList($self->{targetPathFindingLayer}->getWaypointBehavior()->getWaypoint()->getPathsListRunnable($geographicMapCellPosition));
            $self->{pathFindingLayer}->getWaypointRunnableLogHelper()->end($self->{pathFindingLayer});
            Time::HiRes::sleep((15 + ($self->{priorityP} * 2)) / 1000);
        } catch ($e) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            $self->{logUtil}->put($commonStrings->{EXCEPTION}, $self, $commonStrings->{RUN}, $e);
            $self->setRunning(0);
        }
}


sub isDone {
    my ($self) = @_;
        return 1;
}

use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::media::graphics::geography::map::GeographicMapCellPosition;
use org::allbinary::game::layer::WaypointPathRunnableBase;
use java::lang::Thread;

1;

