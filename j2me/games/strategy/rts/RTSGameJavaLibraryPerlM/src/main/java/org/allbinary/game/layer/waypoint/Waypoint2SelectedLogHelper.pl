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

package org::allbinary::game::layer::waypoint::Waypoint2SelectedLogHelper;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::layer::waypoint::Waypoint2LogHelper';

our $instanceC = 'org::allbinary::game::layer::waypoint::Waypoint2SelectedLogHelper'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonSeps} = 'org::allbinary::string::CommonSeps'->getInstance();
    $self->{positionStrings} = 'org::allbinary::math::PositionStrings'->getInstance();
    $self->{stringUtil} = 'org::allbinary::logic::string::StringUtil'->getInstance();
    $self->{ENEMY_POSSIBLE_TARGET} = " Enemy Possible Target: ";
    $self->{CLOSE_RANGE} = "closeRange: ";
    $self->{SENSOR_RANGE} = " sensorRange: ";
    $self->{ONLY_TARGETS} = " Only Targets: ";
    $self->{SHORTER_THAN_CURRENT_TARGET_DISTANCE} = " isShorterThanCurrentTargetDistance: ";
    $self->{CURRENT_TARGET_DESTROYED} = " isCurrentTargetDestroyed: ";
    $self->{CURRENT_TARGET_NOT_AVAILABLE} = " isCurrentTargetNotAvailable: ";
    $self->{PROCESS_POSSIBLE_TARGET} = "selected: processPossibleTarget1";
}

sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::layer::waypoint::Waypoint2SelectedLogHelper::instanceC;
}


sub initRange {
    my ($self, $associatedAdvancedRTSGameLayer, $closeRange, $sensorRange) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($associatedAdvancedRTSGameLayer->getName());
        $stringBuffer->append($self->{CLOSE_RANGE});
        $stringBuffer->appendint($closeRange);
        $stringBuffer->append($self->{SENSOR_RANGE});
        $stringBuffer->appendint($sensorRange);
        $self->{logUtil}->putF($stringBuffer->toString(), $self, "selected: initRange");
}


sub processPossibleTarget {
    my ($self, $associatedAdvancedRTSGameLayer, $waypointBehaviorBase, $layerInterface, $anotherTargetDistance, $isShorterThanCurrentTargetDistance, $isCurrentTargetDestroyed) = @_;
        if ($waypointBehaviorBase->isWaypointListEmptyOrOnlyTargets() && $waypointBehaviorBase->isInSensorRange($layerInterface, $anotherTargetDistance)) {
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            $stringBuffer->append($associatedAdvancedRTSGameLayer->getName());
            $stringBuffer->append($self->{ONLY_TARGETS});
            $stringBuffer->appendboolean($waypointBehaviorBase->isWaypointListEmptyOrOnlyTargets());
            $stringBuffer->append($self->{SHORTER_THAN_CURRENT_TARGET_DISTANCE});
            $stringBuffer->appendboolean($isShorterThanCurrentTargetDistance);
            $stringBuffer->append($self->{CURRENT_TARGET_DESTROYED});
            $stringBuffer->appendboolean($isCurrentTargetDestroyed);
            $stringBuffer->append($self->{CURRENT_TARGET_NOT_AVAILABLE});
            $stringBuffer->appendboolean((!defined($waypointBehaviorBase->getCurrentTargetLayerInterface())));
            $self->{logUtil}->putF($stringBuffer->toString(), $self, $self->{PROCESS_POSSIBLE_TARGET});
        }
}


sub processSetTarget {
    my ($self, $associatedAdvancedRTSGameLayer, $waypointBehaviorBase, $layerInterface, $anotherTargetDistance) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($associatedAdvancedRTSGameLayer->getName());
        $stringBuffer->append($self->{commonSeps}->{SPACE});
        $stringBuffer->append($waypointBehaviorBase->getCurrentTargetingStateString());
        $stringBuffer->append($self->{ENEMY_POSSIBLE_TARGET});
        $stringBuffer->append($layerInterface->getName());
        $stringBuffer->append(" anotherTargetDistance: ");
        $stringBuffer->appendint($anotherTargetDistance);
        $self->{logUtil}->putF($stringBuffer->toString(), $self, "selected: processPossibleTarget2");
}


sub processPossibleTargetCloser {
    my ($self, $associatedAdvancedRTSGameLayer, $waypointBehaviorBase, $layerInterface, $anotherTargetDistance) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($associatedAdvancedRTSGameLayer->getName());
        $stringBuffer->append($self->{commonSeps}->{SPACE});
        $stringBuffer->append($waypointBehaviorBase->getCurrentTargetingStateString());
        $stringBuffer->append($self->{ENEMY_POSSIBLE_TARGET});
        $stringBuffer->append($layerInterface->getName());
        $stringBuffer->append(" anotherTargetDistance: ");
        $stringBuffer->appendint($anotherTargetDistance);
        $self->{logUtil}->putF($stringBuffer->toString(), $self, "selected: processPossibleTarget3");
}


sub setTarget {
    my ($self, $associatedAdvancedRTSGameLayer, $waypointBehaviorBase, $layerInterface, $anotherTargetDistance) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($associatedAdvancedRTSGameLayer->getName());
        $stringBuffer->append($self->{commonSeps}->{SPACE});
        $stringBuffer->append($waypointBehaviorBase->getName());
        $stringBuffer->append(" targeting: ");
        $stringBuffer->append($layerInterface->getName());
        $stringBuffer->append(" at: ");
        $stringBuffer->appendint($anotherTargetDistance);
        $stringBuffer->append(" instead of: ");
        $stringBuffer->append($waypointBehaviorBase->getCurrentTargetingStateString());
        $self->{logUtil}->putF($stringBuffer->toString(), $self, "selected: setTarget");
}


sub setTargetPath {
    my ($self, $associatedAdvancedRTSGameLayer) = @_;
        $self->{logUtil}->putF("Target Destroyed", $self, "selected: setTargetPath");
}


sub setTargetPathIgnoreNewPath {
    my ($self, $associatedAdvancedRTSGameLayer, $waypointBehaviorBase) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($associatedAdvancedRTSGameLayer->getName());
        $stringBuffer->append(" Set Path To Target: ");
        $stringBuffer->append($waypointBehaviorBase->getCurrentTargetLayerInterface()->getName());
        $stringBuffer->append($self->{commonSeps}->{SPACE});
        $stringBuffer->append($self->{stringUtil}->toString($waypointBehaviorBase->getCurrentTargetLayerInterface()));
        $self->{logUtil}->putF($stringBuffer->toString(), $self, "selected: setTargetPath");
}


sub processWaypoint {
    my ($self, $associatedAdvancedRTSGameLayer, $waypointBehaviorBase, $targetLayer, $size) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($associatedAdvancedRTSGameLayer->getName());
        $stringBuffer->append(" Size: ");
        $stringBuffer->appendint($size);
        $stringBuffer->append(" Waypoint: ");
        $stringBuffer->append($targetLayer->getName());
        $stringBuffer->append(" Target: ");
        $stringBuffer->append($self->{stringUtil}->toString($waypointBehaviorBase->getCurrentTargetLayerInterface()));
        $stringBuffer->append(" isTrackingWaypoint: ");
        $stringBuffer->appendboolean($waypointBehaviorBase->isTrackingWaypoint());
        $stringBuffer->append(" WaypointOverridesAttacking: ");
        $stringBuffer->appendboolean($waypointBehaviorBase->isWaypointOverridesAttacking());
        $self->{logUtil}->putF($stringBuffer->toString(), $self, "selected: processWaypoint");
}


sub processWaypointTracked {
    my ($self, $associatedAdvancedRTSGameLayer, $waypointBehaviorBase) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($associatedAdvancedRTSGameLayer->getName());
        $stringBuffer->append(" currentPathGeographicMapCellPosition: ");
        $stringBuffer->append($self->{stringUtil}->toString($waypointBehaviorBase->getCurrentPathGeographicMapCellPosition()));
        $stringBuffer->append(" nextUnvisitedPathGeographicMapCellPosition: ");
        $stringBuffer->append($self->{stringUtil}->toString($waypointBehaviorBase->getNextUnvisitedPathGeographicMapCellPosition()));
        $stringBuffer->append(" Tracked: ");
        $stringBuffer->append($self->{stringUtil}->toString($waypointBehaviorBase->getCurrentGeographicMapCellHistory()->getTracked()));
        $self->{logUtil}->putF($stringBuffer->toString(), $self, "selected: processWaypoint");
}


sub processWaypointTrackedVisit {
    my ($self, $associatedAdvancedRTSGameLayer, $geographicMapCellPosition) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($associatedAdvancedRTSGameLayer->getName());
        $stringBuffer->append(" Visited: ");
        $stringBuffer->append($self->{stringUtil}->toString($geographicMapCellPosition));
        $self->{logUtil}->putF($stringBuffer->toString(), $self, "selected: processWaypoint");
}


sub processWaypointTrackedWithoutProgress {
    my ($self, $associatedAdvancedRTSGameLayer, $reason) = @_;
        $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append($associatedAdvancedRTSGameLayer->getName())->append($reason)->toString(), $self, "turnTo");
}


sub wander {
    my ($self, $associatedAdvancedRTSGameLayer) = @_;
        $self->{logUtil}->putF($associatedAdvancedRTSGameLayer->getName(), $self, "wander");
}


sub targetDestroyed {
    my ($self, $associatedAdvancedRTSGameLayer) = @_;
        $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append($associatedAdvancedRTSGameLayer->getName())->append(" Target Destroyed")->toString(), $self, "selected: processTargeting");
}


sub processTargeting {
    my ($self, $associatedAdvancedRTSGameLayer, $dx, $dy) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($associatedAdvancedRTSGameLayer->getName());
        $stringBuffer->append($self->{commonSeps}->{SPACE});
        $stringBuffer->append($self->{positionStrings}->{DX_LABEL});
        $stringBuffer->appendint($dx);
        $stringBuffer->append($self->{commonSeps}->{SPACE});
        $stringBuffer->append($self->{positionStrings}->{DY_LABEL});
        $stringBuffer->appendint($dy);
        $self->{logUtil}->putF($stringBuffer->toString(), $self, "selected: processTargeting");
}


sub processTargetingNonWayPoint {
    my ($self, $associatedAdvancedRTSGameLayer, $dx, $dy) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($associatedAdvancedRTSGameLayer->getName());
        $stringBuffer->append(" Targeting Non Waypoint ");
        $stringBuffer->append($self->{positionStrings}->{DX_LABEL});
        $stringBuffer->appendint($dx);
        $stringBuffer->append($self->{commonSeps}->{SPACE});
        $stringBuffer->append($self->{positionStrings}->{DY_LABEL});
        $stringBuffer->appendint($dy);
        $self->{logUtil}->putF($stringBuffer->toString(), $self, "selected: processTargeting");
}


sub removeWaypoint {
    my ($self, $associatedAdvancedRTSGameLayer, $unitWaypointBehavior2, $waypointLayer, $reason) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($associatedAdvancedRTSGameLayer->getName());
        $stringBuffer->append($self->{commonSeps}->{SPACE});
        $stringBuffer->append($unitWaypointBehavior2->getName());
        $stringBuffer->append(" remove: ");
        $stringBuffer->append($waypointLayer->getName());
        $stringBuffer->append(" because: ");
        $stringBuffer->append($reason);
        $self->{logUtil}->putF($stringBuffer->toString(), $self, "selected: removeWaypoint");
}


sub removeWaypointList {
    my ($self, $associatedAdvancedRTSGameLayer, $unitWaypointBehavior2, $list) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($associatedAdvancedRTSGameLayer->getName());
        $stringBuffer->append($self->{commonSeps}->{SPACE});
        $stringBuffer->append($unitWaypointBehavior2->getName());
        $stringBuffer->append(" Waypoints: ");
        $stringBuffer->append($self->{stringUtil}->toString($list));
        $self->{logUtil}->putF($stringBuffer->toString(), $self, "selected: removeWaypoint");
}


sub removeWaypointClear {
    my ($self, $associatedAdvancedRTSGameLayer) = @_;
        $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append($associatedAdvancedRTSGameLayer->getName())->append(" Clearing removed waypoint")->toString(), $self, "selected: removeWaypoint");
}


sub clearTarget {
    my ($self, $associatedAdvancedRTSGameLayer) = @_;
        $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append($associatedAdvancedRTSGameLayer->getName())->append(" Cleared Target")->toString(), $self, "selected: clearTarget");
}


sub addWaypointFromUser {
    my ($self, $associatedAdvancedRTSGameLayer, $advancedRTSGameLayer) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($associatedAdvancedRTSGameLayer->getName());
        $stringBuffer->append(" Adding Waypoint to Selected: ");
        $stringBuffer->append($advancedRTSGameLayer->getName());
        if (defined($advancedRTSGameLayer->getParentLayer())) {
            $stringBuffer->append(" With Parent: ");
            $stringBuffer->append($advancedRTSGameLayer->getParentLayer()->getName());
        }
        $self->{logUtil}->putF($stringBuffer->toString(), $self, "selected: onWaypointEvent");
}


sub targetMovedSoRetarget {
    my ($self, $associatedAdvancedRTSGameLayer) = @_;
        $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append($associatedAdvancedRTSGameLayer->getName())->append(" - target moved so retargeting")->toString(), $self, "turnTo");
}

use org::allbinary::game::layer::PathFindingLayerInterface;
use org::allbinary::game::layer::WaypointBehaviorBase;
use org::allbinary::game::layer::special::CollidableDestroyableDamageableLayer;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonSeps;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::math::PositionStrings;
use org::allbinary::media::graphics::geography::map::GeographicMapCellPosition;
use org::allbinary::util::BasicArrayList;
use org::allbinary::game::layer::waypoint::Waypoint2LogHelper;

1;

