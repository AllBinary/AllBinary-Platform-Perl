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

package org::allbinary::game::input::form::PrimaryWaypointHelper;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::game::input::form::PrimaryWaypointHelper'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{waypointLayer} = $org::allbinary::game::layer::NullPathFindingLayer::NULL_PATH_FINDING_LAYER;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::input::form::PrimaryWaypointHelper::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getWaypointLayer {
    my ($self) = @_;
        return $self->{waypointLayer};
}


sub setWaypointLayer {
    my ($self, $waypointLayer) = @_;
        $self->{waypointLayer} = $waypointLayer;
}

use org::allbinary::game::layer::NullPathFindingLayer;
use org::allbinary::game::layer::PathFindingLayerInterface;
use org::allbinary::game::layer::waypoint::WaypointLayer;

1;

