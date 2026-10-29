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

package org::allbinary::game::media::graphics::geography::map::racetrack::PathFindingInfoFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::media::graphics::geography::map::racetrack::BasePathFindingInfoFactory';

our $instance = undef;

sub _init_fields {
    my ($self) = @_;
    $self->{MAX_DIRECTIONS} = 4;
    $self->{pathFindingInfo} = undef;
    $self->{basicGeographicMapGraph} = undef;
    $self->{basicGeographicMapPathFinder} = undef;
    $self->{pathFinderGraphVisitorFactoryInterface} = undef;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::media::graphics::geography::map::racetrack::PathFindingInfoFactory::instance;
}


sub initMax {
    my ($class, $max) = @_;
        $org::allbinary::game::media::graphics::geography::map::racetrack::PathFindingInfoFactory::instance = 'org::allbinary::game::media::graphics::geography::map::racetrack::PathFindingInfoFactory'->new('org::allbinary::game::media::graphics::geography::map::racetrack::SimplePathFinderGraphVisitorFactory'->new(1, 1, 2147483647), $max);
}


sub new {
    my ($class, $pathFinderGraphVisitorFactoryInterface, $max) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
        'org::allbinary::logic::communication::log::PreLogUtil'->put("Using Dynamic Path Finding", $self, $commonStrings->{GET_INSTANCE});
        $self->{basicGeographicMapPathFinder} = 'org::allbinary::media::graphics::geography::pathfinding::BasicGeographicMapPathFinder'->new($max);
        $self->{pathFindingInfo} = 'org::allbinary::media::graphics::geography::pathfinding::PathFindingInfo'->new('org::allbinary::media::graphics::geography::pathfinding::PathFindingNodeCostInfoFactory'->new($max), 'org::allbinary::util::BasicArrayListS'->new(1), 'org::allbinary::util::BasicArrayListS'->new(1));
        $self->{basicGeographicMapGraph} = 'org::allbinary::media::graphics::geography::pathfinding::BasicGeographicMapGraph'->new($self->{pathFindingInfo}->getPathFindingNodeCostInfoFactoryInterface());
        $self->{pathFinderGraphVisitorFactoryInterface} = $pathFinderGraphVisitorFactoryInterface;
    return $self;
}


# throws Exception
sub getInstancePathFindingInfo {
    my ($self, $geographicMapInterface, $mapArray) = @_;
        my $pathFindingInfo = 'org::allbinary::media::graphics::geography::pathfinding::PathFindingInfo'->new($self->{pathFindingInfo}->getPathFindingNodeCostInfoFactoryInterface(), 'org::allbinary::util::BasicArrayListS'->new(1), 'org::allbinary::util::BasicArrayListS'->new(1));
        'org::allbinary::media::graphics::geography::map::racetrack::RaceTrackRoadsGeographicMapCellHistoryFactory'->getInstance()->init();
        $self->init($geographicMapInterface, $pathFindingInfo, $mapArray);
        $self->{basicGeographicMapPathFinder}->init($geographicMapInterface, $self->{basicGeographicMapGraph}, $self->{pathFinderGraphVisitorFactoryInterface}->getInstance($geographicMapInterface));
        $pathFindingInfo->setPathFinder($self->{basicGeographicMapPathFinder});
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
        my $geographicMapCellPositionFactory = $geographicMapInterface->getGeographicMapCellPositionFactory();
        my $cellTypeId = $mapArray->[$cellPosition->getRow()]->[$cellPosition->getColumn()];
        my $geographicMapCellType = 'org::allbinary::media::graphics::geography::map::GeographicMapCellTypeFactory'->getInstance()->get($geographicMapInterface->getCellTypeFromMapCellTypeInt($cellTypeId));
        my $raceTrackGeographicMapCellType = $geographicMapCellType;
        my $allBinaryTiledLayer = $geographicMapInterface->getAllBinaryTiledLayer();
        my $pathFindingNodeCostInfoFactoryInterface = $pathFindingInfo->getPathFindingNodeCostInfoFactoryInterface();
        my $basicGeographicMapUtil = 'org::allbinary::media::graphics::geography::map::BasicGeographicMapUtil'->getInstance();
        my $row = 0;
        my $column = 0;
        my $goingToGeographicMapCellPosition = undef;
        my $costFromStart = 0;
        my $costToEnd = 0;
        for (my $index = 0; $index < $self->{MAX_DIRECTIONS}; $index++) {
            $row = $basicGeographicMapUtil->getBorderingRow($index, $cellPosition);
            $column = $basicGeographicMapUtil->getBorderingColumn($index, $cellPosition);
            if ($row < $allBinaryTiledLayer->getRows() && $column < $allBinaryTiledLayer->getColumns() && $row >= 0 && $column >= 0) {
                $goingToGeographicMapCellPosition = $geographicMapCellPositionFactory->getAt($column, $row);
                $costFromStart = $raceTrackGeographicMapCellType->getTravelCost();
                $costToEnd = $costFromStart;
                $pathFindingNodeCostInfoFactoryInterface->create($geographicMapInterface, $goingToGeographicMapCellPosition, $cellPosition, $costFromStart, $costToEnd);
            }
        }
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

use org::allbinary::string::CommonStrings;
use org::allbinary::logic::communication::log::PreLogUtil;
use org::allbinary::game::layer::AllBinaryTiledLayer;
use org::allbinary::media::graphics::geography::map::BasicGeographicMap;
use org::allbinary::media::graphics::geography::map::BasicGeographicMapCellPositionFactory;
use org::allbinary::media::graphics::geography::map::BasicGeographicMapUtil;
use org::allbinary::media::graphics::geography::map::GeographicMapCellPosition;
use org::allbinary::media::graphics::geography::map::GeographicMapCellType;
use org::allbinary::media::graphics::geography::map::GeographicMapCellTypeFactory;
use org::allbinary::media::graphics::geography::map::racetrack::BasePathFindingInfoFactory;
use org::allbinary::media::graphics::geography::map::racetrack::RaceTrackGeographicMapCellType;
use org::allbinary::media::graphics::geography::map::racetrack::RaceTrackRoadsGeographicMapCellHistoryFactory;
use org::allbinary::media::graphics::geography::pathfinding::PathFindingNodeCostInfoFactoryBase;
use org::allbinary::media::graphics::geography::pathfinding::BasicGeographicMapGraph;
use org::allbinary::media::graphics::geography::pathfinding::BasicGeographicMapPathFinder;
use org::allbinary::media::graphics::geography::pathfinding::PathFinderGraphVisitorFactoryBase;
use org::allbinary::media::graphics::geography::pathfinding::PathFindingInfo;
use org::allbinary::media::graphics::geography::pathfinding::PathFindingNodeCostInfoFactory;
use org::allbinary::util::BasicArrayListS;
use org::allbinary::game::media::graphics::geography::map::racetrack::SimplePathFinderGraphVisitorFactory;

1;

