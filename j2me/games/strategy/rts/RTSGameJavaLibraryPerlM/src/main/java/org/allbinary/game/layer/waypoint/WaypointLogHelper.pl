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

package org::allbinary::game::layer::waypoint::WaypointLogHelper;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::game::layer::waypoint::WaypointLogHelper'->new();

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::layer::waypoint::WaypointLogHelper::instance;
}


sub onWaypointEvent {
    my ($self, $associatedAdvancedRTSGameLayer, $advancedRTSGameLayer) = @_;
}


sub addWaypointFromBuilding {
    my ($self, $associatedAdvancedRTSGameLayer, $advancedRTSGameLayer) = @_;
}


sub addWaypointFromBuildingList {
    my ($self, $associatedAdvancedRTSGameLayer, $advancedRTSGameLayer, $list) = @_;
}


sub insertWaypoint {
    my ($self, $associatedAdvancedRTSGameLayer, $index, $rtsLayer, $waypointName) = @_;
}


sub insertWaypointList {
    my ($self, $associatedAdvancedRTSGameLayer, $index, $rtsLayer, $waypointName, $list) = @_;
}


sub setRandomGeographicMapCellHistoryList {
    my ($self, $associatedAdvancedRTSGameLayer, $pathsList) = @_;
}


sub moveAwayFromBuilding {
    my ($self, $associatedAdvancedRTSGameLayer) = @_;
}


sub needToMove {
    my ($self, $associatedAdvancedRTSGameLayer, $unitWaypointBehavior) = @_;
}


sub setRandomGeographicMapCellHistory {
    my ($self, $associatedAdvancedRTSGameLayer) = @_;
}


sub setCurrentPathGeographicMapCellPosition {
    my ($self, $associatedAdvancedRTSGameLayer, $existingCurrentPathGeographicMapCellPosition, $currentPathGeographicMapCellPosition) = @_;
}


sub setNextUnvisitedPathGeographicMapCellPosition {
    my ($self, $associatedAdvancedRTSGameLayer, $existingNextUnvisitedPathGeographicMapCellPosition, $nextUnvisitedPathGeographicMapCellPosition) = @_;
}

use org::allbinary::game::layer::PathFindingLayerInterface;
use org::allbinary::game::layer::WaypointBehaviorBase;
use org::allbinary::game::layer::special::CollidableDestroyableDamageableLayer;
use org::allbinary::media::graphics::geography::map::GeographicMapCellPosition;
use org::allbinary::util::BasicArrayList;

1;

