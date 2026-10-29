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

# Java interface
package org::allbinary::game::layer::waypoint::WaypointLayerInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



# throws Exception
sub init {
    my ($self, $geographicMapCellHistory, $geographicMapCellPositionBasicArrayList) = @_;
    die "abstract method init";
}


sub getMoveOutOfBuildAreaPath {
    my ($self, $geographicMapCellPosition) = @_;
    die "abstract method getMoveOutOfBuildAreaPath";
}


# throws Exception
sub setClosestGeographicMapCellHistory {
    my ($self, $pathsList) = @_;
    die "abstract method setClosestGeographicMapCellHistory";
}


sub teleportTo {
    my ($self, $geographicMapCellPosition) = @_;
    die "abstract method teleportTo";
}


# throws Exception
sub setLoad {
    my ($self, $resource) = @_;
    die "abstract method setLoad";
}


# throws Exception
sub getSurroundingGeographicMapCellPositionList {
    my ($self) = @_;
    die "abstract method getSurroundingGeographicMapCellPositionList";
}


sub isSelected {
    my ($self) = @_;
    die "abstract method isSelected";
}


sub shouldAddWaypointFromBuilding {
    my ($self) = @_;
    die "abstract method shouldAddWaypointFromBuilding";
}


sub isShowMoreCaptionStates {
    my ($self) = @_;
    die "abstract method isShowMoreCaptionStates";
}


# throws Exception
sub trackTo {
    my ($self, $reason) = @_;
    die "abstract method trackTo";
}


# throws Exception
sub trackToDXY {
    my ($self, $dx, $dy) = @_;
    die "abstract method trackToDXY";
}


# throws Exception
sub buildingChase {
    my ($self, $allbinaryLayer, $cellPosition) = @_;
    die "abstract method buildingChase";
}


sub getTrackingEvent {
    my ($self) = @_;
    die "abstract method getTrackingEvent";
}


sub allStop {
    my ($self) = @_;
    die "abstract method allStop";
}


sub isWaypointListEmptyOrOnlyTargets {
    my ($self) = @_;
    die "abstract method isWaypointListEmptyOrOnlyTargets";
}


# throws Exception
sub getCurrentGeographicMapCellPosition {
    my ($self) = @_;
    die "abstract method getCurrentGeographicMapCellPosition";
}


# throws Exception
sub getTopLeftGeographicMapCellPosition {
    my ($self) = @_;
    die "abstract method getTopLeftGeographicMapCellPosition";
}


sub getCaptionAnimationHelper {
    my ($self) = @_;
    die "abstract method getCaptionAnimationHelper";
}


sub getWaypointBehavior {
    my ($self) = @_;
    die "abstract method getWaypointBehavior";
}


sub getWaypointLogHelper {
    my ($self) = @_;
    die "abstract method getWaypointLogHelper";
}


sub getWaypoint2LogHelper {
    my ($self) = @_;
    die "abstract method getWaypoint2LogHelper";
}


sub getWaypointRunnableLogHelper {
    my ($self) = @_;
    die "abstract method getWaypointRunnableLogHelper";
}

use org::allbinary::animation::caption::CaptionAnimationHelperBase;
use org::allbinary::game::layer::WaypointBehaviorBase;
use org::allbinary::game::tracking::TrackingEvent;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::media::graphics::geography::map::GeographicMapCellHistory;
use org::allbinary::media::graphics::geography::map::GeographicMapCellPosition;
use org::allbinary::util::BasicArrayList;

1;

