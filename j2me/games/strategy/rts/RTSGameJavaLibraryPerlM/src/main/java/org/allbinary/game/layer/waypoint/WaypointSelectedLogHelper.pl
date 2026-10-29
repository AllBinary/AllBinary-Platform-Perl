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

package org::allbinary::game::layer::waypoint::WaypointSelectedLogHelper;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::layer::waypoint::WaypointLogHelper';

our $instanceC = 'org::allbinary::game::layer::waypoint::WaypointSelectedLogHelper'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonSeps} = 'org::allbinary::string::CommonSeps'->getInstance();
    $self->{stringUtil} = 'org::allbinary::logic::string::StringUtil'->getInstance();
}

sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::layer::waypoint::WaypointSelectedLogHelper::instanceC;
}


sub onWaypointEvent {
    my ($self, $associatedAdvancedRTSGameLayer, $advancedRTSGameLayer) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($associatedAdvancedRTSGameLayer->getName());
        $stringBuffer->append(" onWaypointEvent: ");
        $stringBuffer->append($advancedRTSGameLayer->getName());
        if (defined($advancedRTSGameLayer->getParentLayer())) {
            $stringBuffer->append(" With Parent: ");
            $stringBuffer->append($advancedRTSGameLayer->getParentLayer()->getName());
        }
        $self->{logUtil}->putF($stringBuffer->toString(), $self, "onWaypointEvent");
}


sub addWaypointFromBuilding {
    my ($self, $associatedAdvancedRTSGameLayer, $advancedRTSGameLayer) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($associatedAdvancedRTSGameLayer->getName());
        $stringBuffer->append(" Adding Waypoint: ");
        $stringBuffer->append($advancedRTSGameLayer->getName());
        if (defined($advancedRTSGameLayer->getParentLayer())) {
            $stringBuffer->append(" With Parent: ");
            $stringBuffer->append($advancedRTSGameLayer->getParentLayer()->getName());
        }
        $self->{logUtil}->putF($stringBuffer->toString(), $self, "selected: onWaypointEvent");
}


sub addWaypointFromBuildingList {
    my ($self, $associatedAdvancedRTSGameLayer, $advancedRTSGameLayer, $list) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($associatedAdvancedRTSGameLayer->getName());
        $stringBuffer->append(" Waypoints: ");
        $stringBuffer->append($self->{stringUtil}->toString($list));
        $self->{logUtil}->putF($stringBuffer->toString(), $self, "selected: onWaypointEvent");
}


sub insertWaypoint {
    my ($self, $associatedAdvancedRTSGameLayer, $index, $rtsLayer, $waypointName) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($associatedAdvancedRTSGameLayer->getName());
        $stringBuffer->append($self->{commonSeps}->{SPACE});
        $stringBuffer->append($waypointName);
        $stringBuffer->append(" Insert: ");
        $stringBuffer->append($rtsLayer->getName());
        $stringBuffer->append(" for Waypoint: ");
        $self->{logUtil}->putF($stringBuffer->toString(), $self, "selected: insertWaypoint");
}


sub insertWaypointList {
    my ($self, $associatedAdvancedRTSGameLayer, $index, $rtsLayer, $waypointName, $list) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($associatedAdvancedRTSGameLayer->getName());
        $stringBuffer->append($self->{commonSeps}->{SPACE});
        $stringBuffer->append($waypointName);
        $stringBuffer->append(" Insert: ");
        $stringBuffer->append($rtsLayer->getName());
        $stringBuffer->append(" Waypoints: ");
        $stringBuffer->append($self->{stringUtil}->toString($list));
        $self->{logUtil}->putF($stringBuffer->toString(), $self, "selected: insertWaypoint");
}


sub setRandomGeographicMapCellHistoryList {
    my ($self, $associatedAdvancedRTSGameLayer, $pathsList) = @_;
        my $size = $pathsList->size();
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($associatedAdvancedRTSGameLayer->getName());
        $stringBuffer->append($self->{commonSeps}->{SPACE});
        $stringBuffer->append('org::allbinary::string::CommonLabels'->getInstance()->{START});
        $stringBuffer->appendint($size);
        $stringBuffer->append(" -> ");
        $stringBuffer->append($self->{stringUtil}->toString($pathsList));
        $self->{logUtil}->putF($stringBuffer->toString(), $self, "selected: setRandomGeographicMapCellHistory");
}


sub moveAwayFromBuilding {
    my ($self, $associatedAdvancedRTSGameLayer) = @_;
        $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append($associatedAdvancedRTSGameLayer->getName())->append(" Trying to move away from building")->toString(), $self, "selected: moveAwayFromBuilding");
}


sub needToMove {
    my ($self, $associatedAdvancedRTSGameLayer, $unitWaypointBehavior) = @_;
        $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append($associatedAdvancedRTSGameLayer->getName())->append($unitWaypointBehavior->getMovementLogicAsString())->toString(), $self, "needToMove");
}


sub setRandomGeographicMapCellHistory {
    my ($self, $associatedAdvancedRTSGameLayer) = @_;
        $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append($associatedAdvancedRTSGameLayer->getName())->append(" pathsList is null")->toString(), $self, "setRandomGeographicMapCellHistory");
}


sub setCurrentPathGeographicMapCellPosition {
    my ($self, $associatedAdvancedRTSGameLayer, $existingCurrentPathGeographicMapCellPosition, $currentPathGeographicMapCellPosition) = @_;
        if (!defined($existingCurrentPathGeographicMapCellPosition)) {
            $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append($associatedAdvancedRTSGameLayer->getName())->append(" currentPathGeographicMapCellPosition: ")->append($self->{stringUtil}->toString($currentPathGeographicMapCellPosition))->toString(), $self, "setCurrentPathGeographicMapCellPosition");
        }
}


sub setNextUnvisitedPathGeographicMapCellPosition {
    my ($self, $associatedAdvancedRTSGameLayer, $existingNextUnvisitedPathGeographicMapCellPosition, $nextUnvisitedPathGeographicMapCellPosition) = @_;
        if ($existingNextUnvisitedPathGeographicMapCellPosition != $nextUnvisitedPathGeographicMapCellPosition) {
            $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append($associatedAdvancedRTSGameLayer->getName())->append(" nextUnvisitedPathGeographicMapCellPosition: ")->append($self->{stringUtil}->toString($nextUnvisitedPathGeographicMapCellPosition))->toString(), $self, "setNextUnvisitedPathGeographicMapCellPosition");
        }
}

use org::allbinary::game::layer::PathFindingLayerInterface;
use org::allbinary::game::layer::WaypointBehaviorBase;
use org::allbinary::game::layer::special::CollidableDestroyableDamageableLayer;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonLabels;
use org::allbinary::string::CommonSeps;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::media::graphics::geography::map::GeographicMapCellPosition;
use org::allbinary::util::BasicArrayList;
use org::allbinary::game::layer::waypoint::WaypointLogHelper;

1;

