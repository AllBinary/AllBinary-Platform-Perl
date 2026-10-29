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

package org::allbinary::game::media::graphics::geography::map::racetrack::PathFinderGraphHackVisitor;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::media::graphics::geography::map::racetrack::BasePathFinderGraphVisitor';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}


sub new {
    my ($class, $geographicMapInterface, $edgeMinimum, $minPathWeight, $maxPathWeight) = @_;
    my $self = $class->SUPER::new($geographicMapInterface, $edgeMinimum, $minPathWeight, $maxPathWeight);
    $self->_init_fields();
        # super(...) made $self above
    return $self;
}


# throws Exception
sub visit {
    my ($self, $graph, $startPathFindingNodeList, $endPathFindingNodeList) = @_;
        $self->fixStart($graph, $startPathFindingNodeList);
        $self->fixEnd($graph, $endPathFindingNodeList);
        $self->fixOverPassEdges($graph);
}


# throws Exception
sub fixStart {
    my ($self, $graph, $startPathFindingNodeList) = @_;
        my $geographicMapCellPositionFactory = $self->{geographicMapInterface}->getGeographicMapCellPositionFactory();
        my $tiledLayer = $self->{geographicMapInterface}->getAllBinaryTiledLayer();
        for (my $index = $startPathFindingNodeList->size() - 1; $index >= 0; $index--) {
            my $startPathFindingNode = $startPathFindingNodeList->get($index);
            my $geographicMapCellPosition = $startPathFindingNode->{geographicMapCellPosition};
            my $column = $geographicMapCellPosition->getColumn();
            my $row = $geographicMapCellPosition->getRow();
            my $nextRow = $row + 1;
            if ($tiledLayer->isOnTileLayer($column, $nextRow)) {
                my $geographicMapCellPositionNeighbor = $geographicMapCellPositionFactory->getAt($column, $nextRow);
                $graph->removeEdge($geographicMapCellPosition, $geographicMapCellPositionNeighbor);
            }
        }
}


# throws Exception
sub fixEnd {
    my ($self, $graph, $endPathFindingNodeList) = @_;
        my $geographicMapCellPositionFactory = $self->{geographicMapInterface}->getGeographicMapCellPositionFactory();
        my $tiledLayer = $self->{geographicMapInterface}->getAllBinaryTiledLayer();
        for (my $index = $endPathFindingNodeList->size() - 1; $index >= 0; $index--) {
            my $endPathFindingNode = $endPathFindingNodeList->get($index);
            my $geographicMapCellPosition = $endPathFindingNode->{geographicMapCellPosition};
            $graph->addVertex($geographicMapCellPosition);
            my $column = $geographicMapCellPosition->getColumn();
            my $row = $geographicMapCellPosition->getRow();
            my $nextRow = $row + 1;
            if ($tiledLayer->isOnTileLayer($column, $nextRow)) {
                my $geographicMapCellPositionNeighbor = $geographicMapCellPositionFactory->getAt($column, $nextRow);
                $graph->addEdge($geographicMapCellPosition, $geographicMapCellPositionNeighbor);
            }
        }
}


# throws Exception
sub fixOverPassEdges {
    my ($self, $graph) = @_;
        my $geographicMapCellPositionFactory = $self->{geographicMapInterface}->getGeographicMapCellPositionFactory();
        my $raceTrackGeographicMap = $self->{geographicMapInterface};
        my $CellPositionArray = $raceTrackGeographicMap->getRaceTrackData()->getOverPassGeographicMapCellPositionArray();
        for (my $index = scalar(@{$CellPositionArray}) - 1; $index >= 0; $index--) {
            my $overPassGeographicMapCellPosition = $CellPositionArray->[$index];
            $self->{logUtil}->putF("Fixing Over Pass: " . $overPassGeographicMapCellPosition->getColumn() . ", " . $overPassGeographicMapCellPosition->getRow(), $self, "fixOverPassEdges");
            my $underPassGeographicMapCellPosition = $geographicMapCellPositionFactory->getAt($overPassGeographicMapCellPosition->getColumn(), $overPassGeographicMapCellPosition->getRow());
            my $rightUnderPassGeographicMapCellPosition = $geographicMapCellPositionFactory->getAt($overPassGeographicMapCellPosition->getColumn() + 1, $overPassGeographicMapCellPosition->getRow());
            my $leftUnderPassGeographicMapCellPosition = $geographicMapCellPositionFactory->getAt($overPassGeographicMapCellPosition->getColumn() - 1, $overPassGeographicMapCellPosition->getRow());
            $graph->removeEdge($underPassGeographicMapCellPosition, $rightUnderPassGeographicMapCellPosition);
            $graph->removeEdge($underPassGeographicMapCellPosition, $leftUnderPassGeographicMapCellPosition);
            $graph->addVertex($overPassGeographicMapCellPosition);
            $graph->addEdge($overPassGeographicMapCellPosition, $rightUnderPassGeographicMapCellPosition);
            $graph->addEdge($overPassGeographicMapCellPosition, $leftUnderPassGeographicMapCellPosition);
        }
}


# throws Exception
sub fixPath {
    my ($self, $startPathFindingNodeList, $endPathFindingNodeList, $pathList) = @_;
        for (my $index = $startPathFindingNodeList->size() - 1; $index >= 0; $index--) {
            my $endPathFindingNode = $endPathFindingNodeList->get($index);
            my $startPathFindingNode = $startPathFindingNodeList->get($index);
            if ('org::allbinary::media::graphics::geography::map::BasicGeographicMapUtil'->getInstance()->isSameCellPosition($startPathFindingNode->{geographicMapCellPosition}, $endPathFindingNode->{geographicMapCellPosition})) {
                if ($pathList->remove($endPathFindingNode->{geographicMapCellPosition})) {
                    $pathList->remove($startPathFindingNode->{geographicMapCellPosition});
                    $pathList->addAt(0, $startPathFindingNode->{geographicMapCellPosition});
                }
            }
        }
        $self->removeOverPassEdges($pathList);
}


# throws Exception
sub removeOverPassEdges {
    my ($self, $pathList) = @_;
        my $geographicMapCellPositionFactory = $self->{geographicMapInterface}->getGeographicMapCellPositionFactory();
        my $raceTrackGeographicMap = $self->{geographicMapInterface};
        my $CellPositionArray = $raceTrackGeographicMap->getRaceTrackData()->getOverPassGeographicMapCellPositionArray();
        for (my $index = scalar(@{$CellPositionArray}) - 1; $index >= 0; $index--) {
            my $overPassGeographicMapCellPosition = $CellPositionArray->[$index];
            my $underPassGeographicMapCellPosition = $geographicMapCellPositionFactory->getAt($overPassGeographicMapCellPosition->getColumn(), $overPassGeographicMapCellPosition->getRow());
            my $indexOf = $pathList->indexOf($overPassGeographicMapCellPosition);
            if ($indexOf != -1) {
                $pathList->set($indexOf, $underPassGeographicMapCellPosition);
            }
        }
}


sub isValid {
    my ($self, $graphPath) = @_;
        if ($graphPath->getEdgeList()->size() > $self->{edgeMinimum} && $graphPath->getWeight() < $self->{maxPathWeight} && $graphPath->getWeight() > $self->{minPathWeight}) {
            return 1;
        } else {
            return 0;
        }
}

use org::jgrapht::GraphPath;
use org::jgrapht::graph::DefaultWeightedEdge;
use org::jgrapht::graph::SimpleWeightedGraph;
use org::allbinary::util::BasicArrayList;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::game::layer::AllBinaryTiledLayer;
use org::allbinary::graphics::CellPosition;
use org::allbinary::media::graphics::geography::map::BasicGeographicMap;
use org::allbinary::media::graphics::geography::map::BasicGeographicMapCellPositionFactory;
use org::allbinary::media::graphics::geography::map::BasicGeographicMapUtil;
use org::allbinary::media::graphics::geography::map::GeographicMapCellPosition;
use org::allbinary::media::graphics::geography::map::racetrack::RaceTrackGeographicMap;
use org::allbinary::media::graphics::geography::pathfinding::PathFindingNode;
use org::allbinary::game::media::graphics::geography::map::racetrack::BasePathFinderGraphVisitor;

1;

