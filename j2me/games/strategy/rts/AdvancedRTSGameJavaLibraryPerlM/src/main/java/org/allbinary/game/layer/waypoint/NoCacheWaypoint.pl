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

package org::allbinary::game::layer::waypoint::NoCacheWaypoint;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::layer::waypoint::WaypointBase','org::allbinary::game::layer::building::event::BuildingEventListenerInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{ownerLayer} = undef;
}


sub new {
    my ($class, $ownerLayer, $sound) = @_;
    my $self = $class->SUPER::new($sound);
    $self->_init_fields();
        # super(...) made $self above
        $self->{ownerLayer} = $ownerLayer;
    return $self;
}


# throws Exception
sub setAllBinaryGameLayerManager {
    my ($self, $allBinaryGameLayerManager) = @_;
        $self->SUPER::setAllBinaryGameLayerManager($allBinaryGameLayerManager);
}


sub releaseCachedPaths {
    my ($self) = @_;
}


# throws Exception
sub getPathsListFromCacheOnly {
    my ($self, $geographicMapCellPosition) = @_;
        return 'org::allbinary::util::BasicArrayListUtil'->getInstance()->getImmutableInstance();
}


# throws Exception
sub getPathsListRunnable {
    my ($self, $geographicMapCellPosition) = @_;
        return $self->createPaths($geographicMapCellPosition);
}


# throws Exception
sub getEndGeographicMapCellPosition {
    my ($self, $startGeographicMapCellPosition) = @_;
        my $endList = $self->{ownerLayer}->getEndGeographicMapCellPositionList();
        my $endGeographicMapCellPosition = 'org::allbinary::util::BasicArrayListUtil'->getInstance()->getRandom($endList);
        if ($startGeographicMapCellPosition == $endGeographicMapCellPosition) {
            for (my $index = $endList->size() - 1; $index >= 0; $index--) {
                $endGeographicMapCellPosition = $endList->get($index);
                if ($startGeographicMapCellPosition != $endGeographicMapCellPosition) {
                    last;
                }
            }
        }
        return $endGeographicMapCellPosition;
}


# throws Exception
sub createPaths {
    my ($self, $startGeographicMapCellPosition) = @_;
        my $endGeographicMapCellPosition = $self->getEndGeographicMapCellPosition($startGeographicMapCellPosition);
        if (!defined($endGeographicMapCellPosition)) {
            return 'org::allbinary::util::BasicArrayListUtil'->getInstance()->getImmutableInstance();
        }
        if ($startGeographicMapCellPosition == $endGeographicMapCellPosition) {
            if ($self->{ownerLayer}->shouldHandleStartSameAsEnd()) {
                return 'org::allbinary::util::BasicArrayListUtil'->getInstance()->getImmutableInstance();
            } else {
                die ("Start should not be End: " . $endGeographicMapCellPosition);
            }
        }
        my $geographicMapCompositeInterface = $self->{allBinaryGameLayerManagerP};
        my $geographicMapInterface = $geographicMapCompositeInterface->getGeographicMapInterface()->[0];
        my $raceTrackGeographicMap = $geographicMapInterface;
        my $raceTrackGeographicMapCellTypeFactory = $raceTrackGeographicMap->getGeographicMapCellTypeFactory();
        my $customMapGenerator = $raceTrackGeographicMap->getCustomMapGenerator();
        $customMapGenerator->copyMapIntoCustomMap();
        my $customMapArray = $customMapGenerator->getCustomMapArray();
        $customMapArray->[$startGeographicMapCellPosition->getRow()]->[$startGeographicMapCellPosition->getColumn()] = $raceTrackGeographicMapCellTypeFactory->getStartType();
        $customMapArray->[$endGeographicMapCellPosition->getRow()]->[$endGeographicMapCellPosition->getColumn()] = $raceTrackGeographicMapCellTypeFactory->getEndType();
        my $pathFindingInfo = 'org::allbinary::game::media::graphics::geography::map::racetrack::PathFindingInfoFactory'->getInstance()->getInstancePathFindingInfo($raceTrackGeographicMap, $customMapArray);
        my $list = 'org::allbinary::media::graphics::geography::pathfinding::PathGenerator'->getInstance()->getInstanceNoCache($geographicMapInterface, $pathFindingInfo, 2);
        if ($list->size() < 1) {
            die ("Path may have been cleared by clearing caching");
        }
        return $list;
}


sub onEvent {
    my ($self, $eventObject) = @_;
        'org::allbinary::logic::communication::log::ForcedLogUtil'->log('org::allbinary::logic::util::event::EventStrings'->getInstance()->{PERFORMANCE_MESSAGE}, $self);
}


# throws Exception
sub onBuildingEvent {
    my ($self, $event) = @_;
}


sub reset {
    my ($self) = @_;
        $self->getConnectedWaypointList()->clear();
}


# throws Exception
sub visit {
    my ($self, $unitLayer) = @_;
        if ($unitLayer->getGroupInterface()->[0] != $self->{ownerLayer}->getGroupInterface()->[0]) {
            return;
        }
        my $size = $self->getConnectedWaypointList()->size();
        if ($size > 0) {
            my $unitWaypointBehavior = $unitLayer->getWaypointBehavior();
            while ($self->getConnectedWaypointList()->size() > 0) {
                my $rtsLayer = $self->getConnectedWaypointList()->get(0);
                if ($rtsLayer->isDestroyed()) {
                    $self->getConnectedWaypointList()->remove($rtsLayer);
                } else {
                    $unitLayer->handleCost($self->{ownerLayer});
                    $unitWaypointBehavior->insertWaypoint(0, $rtsLayer);
                    last;
                }
            }
        }
}

use org::allbinary::game::layer::AllBinaryGameLayerManager;
use org::allbinary::game::layer::PathFindingLayerInterface;
use org::allbinary::game::layer::RTSLayerEvent;
use org::allbinary::game::layer::building::event::BuildingEventListenerInterface;
use org::allbinary::game::layer::special::CollidableDestroyableDamageableLayer;
use org::allbinary::game::layer::unit::UnitWaypointBehavior;
use org::allbinary::game::media::graphics::geography::map::racetrack::PathFindingInfoFactory;
use org::allbinary::logic::communication::log::ForcedLogUtil;
use org::allbinary::logic::util::event::AllBinaryEventObject;
use org::allbinary::logic::util::event::EventStrings;
use org::allbinary::media::audio::Sound;
use org::allbinary::media::graphics::geography::map::BasicGeographicMap;
use org::allbinary::media::graphics::geography::map::GeographicMapCellPosition;
use org::allbinary::media::graphics::geography::map::GeographicMapCellTypeFactory;
use org::allbinary::media::graphics::geography::map::GeographicMapCompositeInterface;
use org::allbinary::media::graphics::geography::map::racetrack::CustomMapGenerator;
use org::allbinary::media::graphics::geography::map::racetrack::RaceTrackGeographicMap;
use org::allbinary::media::graphics::geography::pathfinding::PathFindingInfo;
use org::allbinary::media::graphics::geography::pathfinding::PathGenerator;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListUtil;
use org::allbinary::game::layer::waypoint::WaypointBase;

1;

