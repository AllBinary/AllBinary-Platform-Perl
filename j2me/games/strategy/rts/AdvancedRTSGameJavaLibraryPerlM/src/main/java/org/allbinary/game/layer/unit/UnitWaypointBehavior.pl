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

package org::allbinary::game::layer::unit::UnitWaypointBehavior;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::layer::WaypointBehaviorBase','org::allbinary::game::layer::waypoint::event::WaypointEventListenerInterface';

our $PATHING = "Pathing";

sub _init_fields {
    my ($self) = @_;
    $self->{commonSeps} = 'org::allbinary::string::CommonSeps'->getInstance();
    $self->{longWeaponRange} = 0;
    $self->{sensorAction} = 'org::allbinary::game::layer::SensorActionFactory'->getInstance()->{ATTACK};
    $self->{completeTimeDelayHelper} = undef;
    $self->{currentGeographicMapCellHistoryP} = undef;
    $self->{lastPathGeographicMapCellPosition} = $org::allbinary::media::graphics::geography::map::SimpleGeographicMapCellPositionFactory::NULL_GEOGRAPHIC_MAP_CELL_POSITION;
    $self->{currentPathGeographicMapCellPosition} = $org::allbinary::media::graphics::geography::map::SimpleGeographicMapCellPositionFactory::NULL_GEOGRAPHIC_MAP_CELL_POSITION;
    $self->{FAKE_WAYPOINT_LAYER} = undef;
    $self->{targetList} = undef;
    $self->{possibleTargetList} = undef;
    $self->{associatedAdvancedRTSGameLayer} = undef;
    $self->{moving} = 0;
    $self->{movingFromStopped} = 0;
    $self->{waypointPathsListP} = 'org::allbinary::util::BasicArrayListUtil'->getInstance()->getImmutableInstance();
    $self->{currentTargetDistance} = 2147483647;
    $self->{currentTargetLayerInterfaceP} = 'org::allbinary::game::layer::special::CollidableDestroyableDamageableLayer'->getNullInstance();
    $self->{trackingWaypoint} = 0;
    $self->{repeatedToLong} = 'org::allbinary::time::TimeDelayHelper'->new(22000);
}


sub new {
    my ($class, $associatedAdvancedRTSGameLayer, $fakeWaypoint) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{associatedAdvancedRTSGameLayer} = $associatedAdvancedRTSGameLayer;
        $self->{completeTimeDelayHelper} = 'org::allbinary::time::TimeDelayHelper'->new(30000);
        $self->{targetList} = 'org::allbinary::util::BasicArrayListD'->new();
        $self->{possibleTargetList} = 'org::allbinary::util::BasicArrayListD'->new();
        $self->setWaypointPathsList('org::allbinary::util::BasicArrayListUtil'->getInstance()->getImmutableInstance());
        $self->{currentGeographicMapCellHistoryP} = 'org::allbinary::media::graphics::geography::map::GeographicMapCellHistory'->new();
        $self->{FAKE_WAYPOINT_LAYER} = $fakeWaypoint;
    return $self;
}


sub initRange {
    my ($self, $weaponRange) = @_;
        $self->{longWeaponRange} = int($weaponRange / 2);
}


sub onEvent {
    my ($self, $eventObject) = @_;
        'org::allbinary::logic::communication::log::ForcedLogUtil'->log('org::allbinary::logic::util::event::EventStrings'->getInstance()->{PERFORMANCE_MESSAGE}, $self);
}


# throws Exception
sub onWaypointEvent {
    my ($self, $event) = @_;
        my $advancedRTSGameLayer = $event->getRtsLayer();
        $self->{associatedAdvancedRTSGameLayer}->{waypointLogHelperP}->onWaypointEvent($self->{associatedAdvancedRTSGameLayer}, $advancedRTSGameLayer);
        if ($self->{associatedAdvancedRTSGameLayer}->isSelected()) {
            $self->addWaypointFromUser($advancedRTSGameLayer);
        } elsif ($advancedRTSGameLayer->shouldAddWaypointFromBuilding()) {
            $self->addWaypointFromBuilding($advancedRTSGameLayer);
        }
}


# throws Exception
sub addWaypointFromUser {
    my ($self, $advancedRTSGameLayer) = @_;
}


# throws Exception
sub addWaypointFromBuilding {
    my ($self, $advancedRTSGameLayer) = @_;
        if ($advancedRTSGameLayer == 'org::allbinary::game::input::form::PrimaryWaypointHelper'->getInstance()->getWaypointLayer() || $advancedRTSGameLayer->getParentLayer() == $self->{associatedAdvancedRTSGameLayer}->getParentLayer()) {
            if (!$self->{targetList}->contains($advancedRTSGameLayer)) {
                $self->{associatedAdvancedRTSGameLayer}->{waypointLogHelperP}->addWaypointFromBuilding($self->{associatedAdvancedRTSGameLayer}, $advancedRTSGameLayer);
                if ($advancedRTSGameLayer->isDestroyed()) {
                    die ("Trying to add a dead: " . $advancedRTSGameLayer);
                }
                $self->{targetList}->add($advancedRTSGameLayer);
                $self->{associatedAdvancedRTSGameLayer}->{waypointLogHelperP}->addWaypointFromBuildingList($self->{associatedAdvancedRTSGameLayer}, $advancedRTSGameLayer, $self->{targetList});
            }
        }
}


sub isWaypointListEmptyOrOnlyTargets {
    my ($self) = @_;
        return 0;
}


# throws Exception
sub insertWaypoint {
    my ($self, $index, $rtsLayer) = @_;
        if ($self->canInsertWaypoint($index, $rtsLayer)) {
            $self->{associatedAdvancedRTSGameLayer}->{waypointLogHelperP}->insertWaypoint($self->{associatedAdvancedRTSGameLayer}, $index, $rtsLayer, $self->getName());
            if ($rtsLayer->isDestroyed()) {
                die ("Trying to add a dead: " . $rtsLayer);
            }
            $self->{targetList}->addAt($index, $rtsLayer);
            $self->{associatedAdvancedRTSGameLayer}->{waypointLogHelperP}->insertWaypointList($self->{associatedAdvancedRTSGameLayer}, $index, $rtsLayer, $self->getName(), $self->{targetList});
            return 1;
        }
        return 0;
}


sub move {
    my ($self) = @_;
        if ($self->isMoving()) {
            $self->setMovingFromStopped(0);
        } else {
            $self->setMovingFromStopped(1);
        }
        $self->setMoving(0);
}


# throws Exception
sub setRandomGeographicMapCellHistory {
    my ($self, $pathsList) = @_;
        my $size = $pathsList->size();
        $self->{associatedAdvancedRTSGameLayer}->{waypointLogHelperP}->setRandomGeographicMapCellHistoryList($self->{associatedAdvancedRTSGameLayer}, $pathsList);
        if ($size > 0) {
            my $geographicMapCellPositionBasicArrayList = 'org::allbinary::util::BasicArrayListUtil'->getInstance()->getRandom($pathsList);
            $self->setGeographicMapCellHistoryPath($geographicMapCellPositionBasicArrayList);
        }
}


# throws Exception
sub setGeographicMapCellHistoryPath {
    my ($self, $geographicMapCellPositionBasicArrayList) = @_;
        $self->{lastPathGeographicMapCellPosition} = $org::allbinary::media::graphics::geography::map::SimpleGeographicMapCellPositionFactory::NULL_GEOGRAPHIC_MAP_CELL_POSITION;
        if ($self->{associatedAdvancedRTSGameLayer}->{showMoreCaptionStates}) {
            $self->{associatedAdvancedRTSGameLayer}->getCaptionAnimationHelper()->update($org::allbinary::game::layer::unit::UnitWaypointBehavior::PATHING, 'org::allbinary::graphics::color::BasicColorFactory'->getInstance()->{GREEN});
        }
        $self->{currentGeographicMapCellHistoryP}->init();
        $self->{associatedAdvancedRTSGameLayer}->init($self->{currentGeographicMapCellHistoryP}, $geographicMapCellPositionBasicArrayList);
        $self->setTrackingWaypoint(1);
        $self->getCompleteTimeDelayHelper()->setStartTimeTNT();
}


sub canInsertWaypoint {
    my ($self, $index, $rtsLayer) = @_;
        if ($self->{targetList}->size() > 4) {
        } elsif ($self->{targetList}->contains($rtsLayer)) {
        } else {
            return 1;
        }
        return 0;
}


# throws Exception
sub addBuildingChase {
    my ($self, $allbinaryLayer, $cellPosition) = @_;
}


# throws Exception
sub moveAwayFromBuilding {
    my ($self, $buildingLayer) = @_;
        my $geographicMapCellPosition = $self->{associatedAdvancedRTSGameLayer}->getCurrentGeographicMapCellPosition();
        my $list = $buildingLayer->{geographicMapCellPositionAreaBase}->getOccupyingGeographicMapCellPositionList();
        if ($list->contains($geographicMapCellPosition)) {
            if ($self->insertWaypoint(0, $self->{FAKE_WAYPOINT_LAYER})) {
                $self->{associatedAdvancedRTSGameLayer}->{waypointLogHelperP}->moveAwayFromBuilding($self->{associatedAdvancedRTSGameLayer});
                $self->setCurrentTargetLayerInterface($self->{FAKE_WAYPOINT_LAYER});
                my $pathsList = $buildingLayer->getMoveOutOfBuildAreaPath($geographicMapCellPosition);
                $self->{associatedAdvancedRTSGameLayer}->setClosestGeographicMapCellHistory($pathsList);
            }
        }
}


sub needToMove {
    my ($self) = @_;
        $self->{associatedAdvancedRTSGameLayer}->{waypointLogHelperP}->needToMove($self->{associatedAdvancedRTSGameLayer}, $self);
        if ($self->isTrackingWaypoint() || $self->{sensorAction} == 'org::allbinary::game::layer::SensorActionFactory'->getInstance()->{EVADE} || ($self->{currentTargetLayerInterfaceP} != 'org::allbinary::game::layer::special::CollidableDestroyableDamageableLayer'->getNullInstance() && $self->getCurrentTargetDistance() >= $self->{longWeaponRange} + $self->{currentTargetLayerInterfaceP}->getHalfHeight())) {
            $self->{repeatedToLong}->setStartTimeTNT();
            return 1;
        }
        if ($self->{repeatedToLong}->isTimeTNT()) {
            my $message = "Repeating too long: " . $self->getMovementLogicAsString();
            'org::allbinary::logic::communication::log::ForcedLogUtil'->log($message, $self->{associatedAdvancedRTSGameLayer});
        }
        return 0;
}


sub getMovementLogicAsString {
    my ($self) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append("isTrackingWaypoint: ");
        $stringBuffer->appendboolean($self->isTrackingWaypoint());
        $stringBuffer->append(" sensorAction: ");
        $stringBuffer->append($self->{sensorAction}->{name});
        $stringBuffer->append(" getCurrentTargetLayerInterface: ");
        $stringBuffer->append('org::allbinary::logic::string::StringUtil'->getInstance()->toString($self->{currentTargetLayerInterfaceP}));
        if ($self->{currentTargetLayerInterfaceP} != 'org::allbinary::game::layer::special::CollidableDestroyableDamageableLayer'->getNullInstance()) {
            $stringBuffer->append(" Target Range: ");
            $stringBuffer->appendint($self->getCurrentTargetDistance());
            $stringBuffer->append(" >= ");
            $stringBuffer->appendint(int($self->{longWeaponRange} + $self->{currentTargetLayerInterfaceP}->getHalfHeight()));
        }
        return $stringBuffer->toString();
}


sub isMovingFromStopped {
    my ($self) = @_;
        return $self->{movingFromStopped};
}


sub setMovingFromStopped {
    my ($self, $movingFromStopped) = @_;
        $self->{movingFromStopped} = $movingFromStopped;
}


sub setWaypointPathsList {
    my ($self, $waypointPathsList) = @_;
        $self->{waypointPathsListP} = $waypointPathsList;
}


sub getWaypointPathsList {
    my ($self) = @_;
        return $self->{waypointPathsListP};
}


sub isMoving {
    my ($self) = @_;
        return $self->{moving};
}


sub setMoving {
    my ($self, $moving) = @_;
        $self->{moving} = $moving;
}


sub isTrackingWaypoint {
    my ($self) = @_;
        return $self->{trackingWaypoint};
}


sub getPossibleTargetList {
    my ($self) = @_;
        return $self->{possibleTargetList};
}


sub setLastPathGeographicMapCellPosition {
    my ($self, $lastPathGeographicMapCellPosition) = @_;
        $self->{lastPathGeographicMapCellPosition} = $lastPathGeographicMapCellPosition;
}


sub getLastPathGeographicMapCellPosition {
    my ($self) = @_;
        return $self->{lastPathGeographicMapCellPosition};
}


sub setCurrentPathGeographicMapCellPosition {
    my ($self, $currentPathGeographicMapCellPosition) = @_;
        $self->{currentPathGeographicMapCellPosition} = $currentPathGeographicMapCellPosition;
}


sub getCurrentPathGeographicMapCellPosition {
    my ($self) = @_;
        return $self->{currentPathGeographicMapCellPosition};
}


sub setSensorAction {
    my ($self, $sensorAction) = @_;
        $self->{sensorAction} = $sensorAction;
}


sub getSensorAction {
    my ($self) = @_;
        return $self->{sensorAction};
}


sub setCurrentTargetLayerInterface {
    my ($self, $currentTargetLayerInterface) = @_;
        $self->{currentTargetLayerInterfaceP} = $currentTargetLayerInterface;
}


sub getCurrentTargetLayerInterface {
    my ($self) = @_;
        return $self->{currentTargetLayerInterfaceP};
}


sub setCurrentTargetDistance {
    my ($self, $currentTargetDistance) = @_;
        $self->{currentTargetDistance} = $currentTargetDistance;
}


sub getCurrentTargetDistance {
    my ($self) = @_;
        return $self->{currentTargetDistance};
}


sub getCompleteTimeDelayHelper {
    my ($self) = @_;
        return $self->{completeTimeDelayHelper};
}


sub getCurrentGeographicMapCellHistory {
    my ($self) = @_;
        return $self->{currentGeographicMapCellHistoryP};
}


sub setTrackingWaypoint {
    my ($self, $trackingWaypoint) = @_;
        $self->{trackingWaypoint} = $trackingWaypoint;
}

use org::allbinary::game::input::form::PrimaryWaypointHelper;
use org::allbinary::game::layer::AdvancedRTSGameLayer;
use org::allbinary::game::layer::RTSLayerEvent;
use org::allbinary::game::layer::SensorAction;
use org::allbinary::game::layer::SensorActionFactory;
use org::allbinary::game::layer::WaypointBehaviorBase;
use org::allbinary::game::layer::building::BuildingLayer;
use org::allbinary::game::layer::special::CollidableDestroyableDamageableLayer;
use org::allbinary::game::layer::waypoint::event::WaypointEventListenerInterface;
use org::allbinary::graphics::color::BasicColorFactory;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::logic::communication::log::ForcedLogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::util::event::AllBinaryEventObject;
use org::allbinary::logic::util::event::EventStrings;
use org::allbinary::media::graphics::geography::map::GeographicMapCellHistory;
use org::allbinary::media::graphics::geography::map::GeographicMapCellPosition;
use org::allbinary::media::graphics::geography::map::SimpleGeographicMapCellPositionFactory;
use org::allbinary::string::CommonSeps;
use org::allbinary::time::TimeDelayHelper;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::util::BasicArrayListUtil;

1;

