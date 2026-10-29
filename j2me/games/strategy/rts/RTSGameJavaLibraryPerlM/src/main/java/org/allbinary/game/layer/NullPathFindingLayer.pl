# 
# AllBinary Open License Version 1 
# Copyright (c) 2025 AllBinary 
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

package org::allbinary::game::layer::NullPathFindingLayer;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::layer::PathFindingLayerInterface';

our $NULL_PATH_FINDING_LAYER = 'org::allbinary::game::layer::NullPathFindingLayer'->new();

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getName {
    my ($self) = @_;
        die ("RuntimeException");
}


# throws Exception
sub getEndGeographicMapCellPositionList {
    my ($self) = @_;
        die ("RuntimeException");
}


sub shouldHandleStartSameAsEnd {
    my ($self) = @_;
        die ("RuntimeException");
}


sub getGeographicMapCellPositionArea {
    my ($self) = @_;
        die ("RuntimeException");
}


sub getHudPaintable {
    my ($self) = @_;
        die ("RuntimeException");
}


# throws Exception
sub handleCost {
    my ($self, $ownerLayer) = @_;
        die ("RuntimeException");
}


sub getParentLayer {
    my ($self) = @_;
        die ("RuntimeException");
}


sub getRTSLayer2LogHelper {
    my ($self) = @_;
        die ("RuntimeException");
}


# throws Exception
sub setTarget {
    my ($self, $targetGameLayer) = @_;
        die ("RuntimeException");
}


# throws Exception
sub init {
    my ($self, $geographicMapCellHistory, $geographicMapCellPositionBasicArrayList) = @_;
        die ("RuntimeException");
}


sub getMoveOutOfBuildAreaPath {
    my ($self, $geographicMapCellPosition) = @_;
        die ("RuntimeException");
}


# throws Exception
sub setClosestGeographicMapCellHistory {
    my ($self, $pathsList) = @_;
        die ("RuntimeException");
}


sub teleportTo {
    my ($self, $geographicMapCellPosition) = @_;
        die ("RuntimeException");
}


# throws Exception
sub setLoad {
    my ($self, $resource) = @_;
        die ("RuntimeException");
}


# throws Exception
sub getSurroundingGeographicMapCellPositionList {
    my ($self) = @_;
        die ("RuntimeException");
}


sub isSelected {
    my ($self) = @_;
        die ("RuntimeException");
}


sub shouldAddWaypointFromBuilding {
    my ($self) = @_;
        die ("RuntimeException");
}


sub isShowMoreCaptionStates {
    my ($self) = @_;
        die ("RuntimeException");
}


# throws Exception
sub trackTo {
    my ($self, $reason) = @_;
        die ("RuntimeException");
}


# throws Exception
sub trackToDXY {
    my ($self, $dx, $dy) = @_;
        die ("RuntimeException");
}


# throws Exception
sub buildingChase {
    my ($self, $allbinaryLayer, $cellPosition) = @_;
        die ("RuntimeException");
}


sub getTrackingEvent {
    my ($self) = @_;
        die ("RuntimeException");
}


sub allStop {
    my ($self) = @_;
        die ("RuntimeException");
}


sub isWaypointListEmptyOrOnlyTargets {
    my ($self) = @_;
        die ("RuntimeException");
}


# throws Exception
sub getCurrentGeographicMapCellPosition {
    my ($self) = @_;
        die ("RuntimeException");
}


# throws Exception
sub getTopLeftGeographicMapCellPosition {
    my ($self) = @_;
        die ("RuntimeException");
}


sub getCaptionAnimationHelper {
    my ($self) = @_;
        die ("RuntimeException");
}


sub getWaypointBehavior {
    my ($self) = @_;
        die ("RuntimeException");
}


sub getWaypointLogHelper {
    my ($self) = @_;
        die ("RuntimeException");
}


sub getWaypoint2LogHelper {
    my ($self) = @_;
        die ("RuntimeException");
}


sub getWaypointRunnableLogHelper {
    my ($self) = @_;
        die ("RuntimeException");
}


sub getGroupInterface {
    my ($self) = @_;
        die ("RuntimeException");
}


# throws Exception
sub isDestroyed {
    my ($self) = @_;
        die ("RuntimeException");
}


sub getSourceId {
    my ($self) = @_;
        die ("RuntimeException");
}

use org::allbinary::animation::caption::CaptionAnimationHelperBase;
use org::allbinary::game::identification::Group;
use org::allbinary::game::layer::waypoint::Waypoint2LogHelper;
use org::allbinary::game::layer::waypoint::WaypointLogHelper;
use org::allbinary::game::layer::waypoint::WaypointRunnableLogHelper;
use org::allbinary::game::tracking::TrackingEvent;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::media::graphics::geography::map::GeographicMapCellHistory;
use org::allbinary::media::graphics::geography::map::GeographicMapCellPosition;
use org::allbinary::util::BasicArrayList;
use org::allbinary::game::layer::PathFindingLayerInterface;

1;

