# 
# AllBinary Open License Version 1 
# Copyright (c) 2006 AllBinary 
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

package org::allbinary::game::layer::building::event::BuildingEventHandler;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::util::event::handler::BasicEventHandler';

our $eventHandler = 'org::allbinary::game::layer::building::event::BuildingEventHandler'->new();


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::layer::building::event::BuildingEventHandler::eventHandler;
}


# throws Exception
sub process {
    my ($self, $eventObject, $eventListenerInterface) = @_;
        my $buildingEventListenerInterface = ($eventListenerInterface);
        $buildingEventListenerInterface->onBuildingEvent($eventObject);
}

use org::allbinary::game::layer::RTSLayerEvent;
use org::allbinary::logic::util::event::AllBinaryEventObject;
use org::allbinary::logic::util::event::EventListenerInterface;
use org::allbinary::logic::util::event::handler::BasicEventHandler;

1;

