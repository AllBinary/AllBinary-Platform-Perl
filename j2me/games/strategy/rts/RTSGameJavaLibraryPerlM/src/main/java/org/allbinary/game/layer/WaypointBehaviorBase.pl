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

package org::allbinary::game::layer::WaypointBehaviorBase;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::tick::TickableInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{ownedWaypointList} = undef;
    $self->{waypointOverridesAttacking} = 1;
    $self->{waypoint} = $org::allbinary::game::layer::waypoint::WaypointBase::NULL_WAYPOINT_BASE;
    $self->{steeringVisitorList} = 'org::allbinary::util::BasicArrayListD'->new();
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{ownedWaypointList} = 'org::allbinary::util::BasicArrayListS'->new(1);
    return $self;
}


sub getName {
    my ($self) = @_;
        return ref($self);
}


sub isRunning {
    my ($self) = @_;
        return 0;
}


# throws Exception
sub processTick {
    my ($self, $allBinaryLayerManager) = @_;
}


sub getOwnedWaypointList {
    my ($self) = @_;
        return $self->{ownedWaypointList};
}


sub getWaypoint {
    my ($self) = @_;
        return $self->{waypoint};
}


sub setWaypoint {
    my ($self, $waypoint) = @_;
        $self->{waypoint} = $waypoint;
}


sub getSteeringVisitorList {
    my ($self) = @_;
        return $self->{steeringVisitorList};
}


sub getMovementLogicAsString {
    my ($self) = @_;
        die ("RuntimeException");
}


sub isWaypointListEmptyOrOnlyTargets {
    my ($self) = @_;
        die ("RuntimeException");
}


sub isInSensorRange {
    my ($self, $layerInterface, $targetDistance) = @_;
        die ("RuntimeException");
}


sub getCurrentTargetLayerInterface {
    my ($self) = @_;
        die ("RuntimeException");
}


sub getCurrentTargetingStateString {
    my ($self) = @_;
        die ("RuntimeException");
}


sub isTrackingWaypoint {
    my ($self) = @_;
        die ("RuntimeException");
}


sub getCurrentPathGeographicMapCellPosition {
    my ($self) = @_;
        die ("RuntimeException");
}


sub getCurrentGeographicMapCellHistory {
    my ($self) = @_;
        die ("RuntimeException");
}


sub isWaypointOverridesAttacking {
    my ($self) = @_;
        return $self->{waypointOverridesAttacking};
}


sub getNextUnvisitedPathGeographicMapCellPosition {
    my ($self) = @_;
        die ("RuntimeException");
}


sub needToMove {
    my ($self) = @_;
        die ("RuntimeException");
}


sub setWaypointPathsList {
    my ($self, $waypointPathsList) = @_;
        die ("RuntimeException");
}


sub getWaypointPathsList {
    my ($self) = @_;
        die ("RuntimeException");
}


# throws Exception
sub setTarget {
    my ($self, $layerInterface) = @_;
        die ("RuntimeException");
}


# throws Exception
sub setTargetWithDistance {
    my ($self, $layerInterface, $anotherTargetDistance) = @_;
        die ("RuntimeException");
}


# throws Exception
sub clearTarget {
    my ($self) = @_;
        die ("RuntimeException");
}


# throws Exception
sub updatePathOnTargetMove {
    my ($self, $reason) = @_;
}

use org::allbinary::game::layer::special::CollidableDestroyableDamageableLayer;
use org::allbinary::game::layer::waypoint::WaypointBase;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::game::tick::TickableInterface;
use org::allbinary::layer::AllBinaryLayerManager;
use org::allbinary::media::graphics::geography::map::GeographicMapCellHistory;
use org::allbinary::media::graphics::geography::map::GeographicMapCellPosition;
use org::allbinary::util::BasicArrayListS;

1;

