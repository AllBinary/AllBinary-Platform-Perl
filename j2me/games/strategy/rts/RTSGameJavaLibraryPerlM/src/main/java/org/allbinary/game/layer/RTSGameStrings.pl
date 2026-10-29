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

package org::allbinary::game::layer::RTSGameStrings;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::game::layer::RTSGameStrings'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{DRAG_TO_SPOT} = "Please Drag";
    $self->{NOT_YOURS} = "Not Yours";
    $self->{NEW_UNIT} = "New Unit";
    $self->{NEW_WAYPOINT} = "New Waypoint";
    $self->{BUILDING} = "Building";
    $self->{UPGRADE} = "Upgrading";
    $self->{DOWNGRADE} = "Downgrading";
    $self->{NO_MONEY} = "Not Enough Money";
    $self->{SPOT_TAKEN} = "Spot Taken";
    $self->{BUILDING_COLLISION} = "Building Collision";
    $self->{STRUCTURE_TO_CLOSE} = "Building To Close";
    $self->{MAP_EDGE} = "Map Edge";
    $self->{ROAD_COLLISION} = "Road Collision";
    $self->{SELECT_BUILD_SPOT} = "Select Build Spot";
    $self->{BUILD_ON_PATH} = "Not On Path";
    $self->{DRAGGABLE} = "Draggable";
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::layer::RTSGameStrings::instance;
}


1;

