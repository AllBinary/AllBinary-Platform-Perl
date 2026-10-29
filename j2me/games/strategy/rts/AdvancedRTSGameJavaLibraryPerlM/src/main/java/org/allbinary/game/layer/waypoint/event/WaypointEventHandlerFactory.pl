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

package org::allbinary::game::layer::waypoint::event::WaypointEventHandlerFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $eventHandlerArray = ['org::allbinary::game::layer::waypoint::event::WaypointEventHandler'->new(), 'org::allbinary::game::layer::waypoint::event::WaypointEventHandler'->new(), 'org::allbinary::game::layer::waypoint::event::WaypointEventHandler'->new(), 'org::allbinary::game::layer::waypoint::event::WaypointEventHandler'->new(), 'org::allbinary::game::layer::waypoint::event::WaypointEventHandler'->new(), 'org::allbinary::game::layer::waypoint::event::WaypointEventHandler'->new(), 'org::allbinary::game::layer::waypoint::event::WaypointEventHandler'->new(), 'org::allbinary::game::layer::waypoint::event::WaypointEventHandler'->new(), 'org::allbinary::game::layer::waypoint::event::WaypointEventHandler'->new(), 'org::allbinary::game::layer::waypoint::event::WaypointEventHandler'->new()];

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class, $groupInterface) = @_;
        return $org::allbinary::game::layer::waypoint::event::WaypointEventHandlerFactory::eventHandlerArray->[int($groupInterface->getGroupId())];
}


sub removeAll {
    my ($class) = @_;
        for (my $index = scalar(@{$org::allbinary::game::layer::waypoint::event::WaypointEventHandlerFactory::eventHandlerArray}) - 1; $index >= 0; $index--) {
            $org::allbinary::game::layer::waypoint::event::WaypointEventHandlerFactory::eventHandlerArray->[$index]->removeAllListeners();
        }
}

use org::allbinary::game::identification::Group;
use org::allbinary::game::layer::waypoint::event::WaypointEventHandler;

1;

