#
# AllBinary Open License Version 1
# Copyright (c) 2011 AllBinary
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

#1.4.2
package org::allbinary::game::media::graphics::geography::map::racetrack::PathFindingInfoFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::media::graphics::geography::map::racetrack::BasePathFindingInfoFactory';

our $instance = 'org::allbinary::game::media::graphics::geography::map::racetrack::PathFindingInfoFactory'->new();
our $MAX = 32768;

sub _init_fields {
    my ($self) = @_;
    $self->{pathFindingInfo} = undef;
    $self->{pathFinder} = undef;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::media::graphics::geography::map::racetrack::PathFindingInfoFactory::instance;
}


sub initMax {
    my ($class, $max) = @_;
        $org::allbinary::game::media::graphics::geography::map::racetrack::PathFindingInfoFactory::MAX = $max;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{pathFindingInfo} = 'org::allbinary::media::graphics::geography::pathfinding::PathFindingInfo'->new('org::allbinary::media::graphics::geography::pathfinding::PathFindingNodeCostInfoFactory'->new($org::allbinary::game::media::graphics::geography::map::racetrack::PathFindingInfoFactory::MAX), 'org::allbinary::util::BasicArrayListS'->new(1), 'org::allbinary::util::BasicArrayListS'->new(1));
        $self->{pathFinder} = 'org::allbinary::media::graphics::geography::pathfinding::PathFinder'->new();
    return $self;
}


# throws Exception
sub getInstancePathFindingInfo {
    my ($self, $geographicMapInterface, $mapArray) = @_;
        my $pathFindingInfo = 'org::allbinary::media::graphics::geography::pathfinding::PathFindingInfo'->new($self->{pathFindingInfo}->getPathFindingNodeCostInfoFactoryInterface(), 'org::allbinary::util::BasicArrayListS'->new(1), 'org::allbinary::util::BasicArrayListS'->new(1));
        'org::allbinary::media::graphics::geography::map::racetrack::RaceTrackRoadsGeographicMapCellHistoryFactory'->getInstance()->init();
        $self->init($geographicMapInterface, $pathFindingInfo, $mapArray);
        $self->{pathFinder}->init($geographicMapInterface);
        $pathFindingInfo->setPathFinder($self->{pathFinder});
        return $pathFindingInfo;
}


# throws Exception
sub init {
    my ($self, $geographicMapInterface, $pathFindingInfo, $mapArray) = @_;
        $self->SUPER::init($geographicMapInterface, $pathFindingInfo, $mapArray);
        $self->buildPathFindingNodes($geographicMapInterface, $pathFindingInfo, $mapArray);
}


# throws Exception
sub buildPathFindingNodesForCellPosition {
    my ($self, $geographicMapInterface, $pathFindingInfo, $mapArray, $cellPosition) = @_;
}


# throws Exception
sub buildPathFindingNodes {
    my ($self, $geographicMapInterface, $pathFindingInfo, $mapArray) = @_;
        my $geographicMapCellPositionFactory = $geographicMapInterface->getGeographicMapCellPositionFactory();
        my $allBinaryTiledLayer = $geographicMapInterface->getAllBinaryTiledLayer();
        my $totalColumns = $allBinaryTiledLayer->getColumns();
        my $totalRows = $allBinaryTiledLayer->getRows();
        for (my $column = 0; $column < $totalColumns; $column++) {
            for (my $row = 0; $row < $totalRows; $row++) {
                $self->buildPathFindingNodesForCellPosition($geographicMapInterface, $pathFindingInfo, $mapArray, $geographicMapCellPositionFactory->getAt($column, $row));
            }
        }
}

use org::allbinary::game::layer::AllBinaryTiledLayer;
use org::allbinary::media::graphics::geography::map::BasicGeographicMap;
use org::allbinary::media::graphics::geography::map::BasicGeographicMapCellPositionFactory;
use org::allbinary::media::graphics::geography::map::GeographicMapCellPosition;
use org::allbinary::media::graphics::geography::map::racetrack::BasePathFindingInfoFactory;
use org::allbinary::media::graphics::geography::map::racetrack::RaceTrackRoadsGeographicMapCellHistoryFactory;
use org::allbinary::media::graphics::geography::pathfinding::PathFinder;
use org::allbinary::media::graphics::geography::pathfinding::PathFindingInfo;
use org::allbinary::media::graphics::geography::pathfinding::PathFindingNodeCostInfoFactory;
use org::allbinary::util::BasicArrayListS;

1;

