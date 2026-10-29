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

package org::allbinary::game::layer::waypoint::WaypointBase;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::util::event::EventListenerInterface';

our $NULL_WAYPOINT_BASE = 'org::allbinary::game::layer::waypoint::WaypointBase'->new('org::allbinary::media::audio::NoSound'->getInstance());

sub _init_fields {
    my ($self) = @_;
    $self->{connectedWaypointList} = 'org::allbinary::util::BasicArrayListD'->new();
    $self->{sound} = undef;
    $self->{allBinaryGameLayerManagerP} = 'org::allbinary::game::layer::AllBinaryGameLayerManager'->getNullInstance();
}


sub new {
    my ($class, $sound) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{sound} = $sound;
    return $self;
}


sub getSound {
    my ($self) = @_;
        return $self->{sound};
}


# throws Exception
sub setAllBinaryGameLayerManager {
    my ($self, $allBinaryGameLayerManager) = @_;
        $self->{allBinaryGameLayerManagerP} = $allBinaryGameLayerManager;
}


sub getConnectedWaypointList {
    my ($self) = @_;
        return $self->{connectedWaypointList};
}


sub onEvent {
    my ($self, $eventObject) = @_;
        'org::allbinary::logic::communication::log::ForcedLogUtil'->log('org::allbinary::logic::util::event::EventStrings'->getInstance()->{PERFORMANCE_MESSAGE}, $self);
}


# throws Exception
sub getPathFindingInfo {
    my ($self, $geographicMapCellPosition) = @_;
        die ("RuntimeException");
}


# throws Exception
sub getPathsList {
    my ($self, $geographicMapCellPosition, $pathFindingInfo, $multipassState) = @_;
        die ("RuntimeException");
}


# throws Exception
sub getPathsListRunnable {
    my ($self, $geographicMapCellPosition) = @_;
        die ("RuntimeException");
}


# throws Exception
sub getPathsListFromCacheOnly {
    my ($self, $geographicMapCellPosition) = @_;
        die ("RuntimeException");
}


# throws Exception
sub visit {
    my ($self, $unitLayer) = @_;
}


sub reset {
    my ($self) = @_;
}


sub getType {
    my ($self) = @_;
        return 0;
}

use org::allbinary::game::layer::AllBinaryGameLayerManager;
use org::allbinary::game::layer::PathFindingLayerInterface;
use org::allbinary::logic::communication::log::ForcedLogUtil;
use org::allbinary::logic::util::event::AllBinaryEventObject;
use org::allbinary::logic::util::event::EventListenerInterface;
use org::allbinary::logic::util::event::EventStrings;
use org::allbinary::media::audio::NoSound;
use org::allbinary::media::audio::Sound;
use org::allbinary::media::graphics::geography::map::GeographicMapCellPosition;
use org::allbinary::media::graphics::geography::pathfinding::MultipassState;
use org::allbinary::media::graphics::geography::pathfinding::PathFindingInfo;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;

1;

