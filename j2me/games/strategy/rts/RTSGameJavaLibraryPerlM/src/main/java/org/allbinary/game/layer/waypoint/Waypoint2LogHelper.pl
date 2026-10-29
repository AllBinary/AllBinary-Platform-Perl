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

package org::allbinary::game::layer::waypoint::Waypoint2LogHelper;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::game::layer::waypoint::Waypoint2LogHelper'->new();

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::layer::waypoint::Waypoint2LogHelper::instance;
}


sub initRange {
    my ($self, $associatedAdvancedRTSGameLayer, $closeRange, $sensorRange) = @_;
}


sub processPossibleTarget {
    my ($self, $associatedAdvancedRTSGameLayer, $unitWaypointBehavior2, $layerInterface, $anotherTargetDistance, $isShorterThanCurrentTargetDistance, $isCurrentTargetDestroyed) = @_;
}


sub processSetTarget {
    my ($self, $associatedAdvancedRTSGameLayer, $unitWaypointBehavior2, $layerInterface, $anotherTargetDistance) = @_;
}


sub processPossibleTargetCloser {
    my ($self, $associatedAdvancedRTSGameLayer, $unitWaypointBehavior2, $layerInterface, $anotherTargetDistance) = @_;
}


sub setTarget {
    my ($self, $associatedAdvancedRTSGameLayer, $unitWaypointBehavior2, $layerInterface, $anotherTargetDistance) = @_;
}


sub setTargetPath {
    my ($self, $associatedAdvancedRTSGameLayer) = @_;
}


sub setTargetPathIgnoreNewPath {
    my ($self, $associatedAdvancedRTSGameLayer, $unitWaypointBehavior2) = @_;
}


sub processWaypoint {
    my ($self, $associatedAdvancedRTSGameLayer, $unitWaypointBehavior2, $targetLayer, $size) = @_;
}


sub processWaypointTracked {
    my ($self, $associatedAdvancedRTSGameLayer, $unitWaypointBehavior2) = @_;
}


sub processWaypointTrackedVisit {
    my ($self, $associatedAdvancedRTSGameLayer, $geographicMapCellPosition) = @_;
}


sub processWaypointTrackedWithoutProgress {
    my ($self, $associatedAdvancedRTSGameLayer, $reason) = @_;
}


sub wander {
    my ($self, $associatedAdvancedRTSGameLayer) = @_;
}


sub targetDestroyed {
    my ($self, $associatedAdvancedRTSGameLayer) = @_;
}


sub processTargeting {
    my ($self, $associatedAdvancedRTSGameLayer, $dx, $dy) = @_;
}


sub processTargetingNonWayPoint {
    my ($self, $associatedAdvancedRTSGameLayer, $dx, $dy) = @_;
}


sub removeWaypoint {
    my ($self, $associatedAdvancedRTSGameLayer, $unitWaypointBehavior2, $waypointLayer, $reason) = @_;
}


sub removeWaypointList {
    my ($self, $associatedAdvancedRTSGameLayer, $unitWaypointBehavior2, $list) = @_;
}


sub removeWaypointClear {
    my ($self, $associatedAdvancedRTSGameLayer) = @_;
}


sub clearTarget {
    my ($self, $associatedAdvancedRTSGameLayer) = @_;
}


sub addWaypointFromUser {
    my ($self, $associatedAdvancedRTSGameLayer, $advancedRTSGameLayer) = @_;
}


sub targetMovedSoRetarget {
    my ($self, $associatedAdvancedRTSGameLayer) = @_;
}

use org::allbinary::game::layer::PathFindingLayerInterface;
use org::allbinary::game::layer::WaypointBehaviorBase;
use org::allbinary::media::graphics::geography::map::GeographicMapCellPosition;
use org::allbinary::util::BasicArrayList;

1;

