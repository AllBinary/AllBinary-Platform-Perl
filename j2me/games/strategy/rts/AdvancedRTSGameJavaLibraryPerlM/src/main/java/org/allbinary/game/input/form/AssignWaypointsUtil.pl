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

package org::allbinary::game::input::form::AssignWaypointsUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::game::input::form::AssignWaypointsUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{WAYPOINT_EVENT} = 'org::allbinary::game::layer::RTSLayerEvent'->new($org::allbinary::game::layer::NullPathFindingLayer::NULL_PATH_FINDING_LAYER);
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::input::form::AssignWaypointsUtil::instance;
}


sub set {
    my ($self, $unitLayer, $ownerAdvancedRTSGameLayer) = @_;
        try {
            my $list = $ownerAdvancedRTSGameLayer->getWaypointBehavior()->getOwnedWaypointList();
            my $unitWaypointBehavior = $unitLayer->getWaypointBehavior();
            for (my $index = $list->size() - 1; $index >= 0; $index--) {
                my $waypointLayer = $list->get($index);
                $self->{WAYPOINT_EVENT}->setRtsLayer($waypointLayer);
                $unitWaypointBehavior->onWaypointEvent($self->{WAYPOINT_EVENT});
            }
            my $waypointLayer = 'org::allbinary::game::input::form::PrimaryWaypointHelper'->getInstance()->getWaypointLayer();
            if ($waypointLayer != $org::allbinary::game::layer::NullPathFindingLayer::NULL_PATH_FINDING_LAYER) {
                $self->{WAYPOINT_EVENT}->setRtsLayer($waypointLayer);
                $unitWaypointBehavior->onWaypointEvent($self->{WAYPOINT_EVENT});
            }
        } catch ($e) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            $self->{logUtil}->put($commonStrings->{EXCEPTION}, $self, "set", $e);
        }
}

use org::allbinary::game::layer::AdvancedRTSGameLayer;
use org::allbinary::game::layer::NullPathFindingLayer;
use org::allbinary::game::layer::PathFindingLayerInterface;
use org::allbinary::game::layer::RTSLayer;
use org::allbinary::game::layer::RTSLayerEvent;
use org::allbinary::game::layer::unit::UnitLayer;
use org::allbinary::game::layer::unit::UnitWaypointBehavior;
use org::allbinary::util::BasicArrayList;
use org::allbinary::string::CommonStrings;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::game::input::form::PrimaryWaypointHelper;

1;

