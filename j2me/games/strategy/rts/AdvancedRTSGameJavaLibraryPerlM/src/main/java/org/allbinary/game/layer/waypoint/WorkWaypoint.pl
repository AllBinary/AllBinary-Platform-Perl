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

package org::allbinary::game::layer::waypoint::WorkWaypoint;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::layer::waypoint::Waypoint';

our $ID = 'org::allbinary::logic::math::SmallIntegerSingletonFactory'->getInstance()->getAt(25);


sub new {
    my ($class, $ownerLayer) = @_;
    my $self = $class->SUPER::new($ownerLayer, 'org::allbinary::media::audio::WorkSound'->getInstance());
        # super(...) made $self above
    return $self;
}


# throws Exception
sub visit {
    my ($self, $unitLayer) = @_;
        if ($unitLayer->getGroupInterface()->[0] != $self->{ownerLayer}->getGroupInterface()->[0]) {
            return;
        }
        my $size = $self->getConnectedWaypointList()->size();
        if ($size > 0) {
            my $occupyList = $self->{ownerLayer}->getGeographicMapCellPositionArea()->getOccupyingGeographicMapCellPositionList();
            my $outOfResources = 1;
            my $geologicalGeographicMapCellPosition = undef;
            my $geologicalResource = undef;
            for (my $index = $occupyList->size(); --$index >= 0; ) {
                $geologicalGeographicMapCellPosition = $occupyList->get($index);
                $geologicalResource = $geologicalGeographicMapCellPosition->getGeologicalResource();
                if ($geologicalResource->getTotal() >= 1) {
                    $outOfResources = 0;
                    my $maxResourceLoad = int($unitLayer->getMaxResourceLoad());
                    $geologicalResource->remove($maxResourceLoad);
                    $unitLayer->setLoad($maxResourceLoad);
                }
            }
            my $waypointInfoHudPaintable = $self->{ownerLayer}->getHudPaintable();
            if ($self->{ownerLayer} == $waypointInfoHudPaintable->getRtsLayer()) {
                $waypointInfoHudPaintable->updateSelectionInfo();
            }
            if (!$outOfResources) {
                my $unitWaypointBehavior = $unitLayer->getWaypointBehavior();
                my $rtsLayer = undef;
                while ($self->getConnectedWaypointList()->size() > 0) {
                    $rtsLayer = $self->getConnectedWaypointList()->get(0);
                    if ($rtsLayer->isDestroyed()) {
                        $self->getConnectedWaypointList()->remove($rtsLayer);
                    } else {
                        $unitWaypointBehavior->insertWaypoint(0, $rtsLayer);
                        last;
                    }
                }
            }
        }
}


sub getType {
    my ($self) = @_;
        return 2;
}

use org::allbinary::game::layer::PathFindingLayerInterface;
use org::allbinary::game::layer::RTSLayer;
use org::allbinary::game::layer::geological::resources::GeologicalGeographicMapCellPosition;
use org::allbinary::game::layer::geological::resources::GeologicalResource;
use org::allbinary::game::layer::unit::UnitLayer;
use org::allbinary::game::layer::unit::UnitWaypointBehavior;
use org::allbinary::media::audio::WorkSound;
use org::allbinary::util::BasicArrayList;
use org::allbinary::logic::math::SmallIntegerSingletonFactory;
use org::allbinary::game::layer::waypoint::Waypoint;

1;

