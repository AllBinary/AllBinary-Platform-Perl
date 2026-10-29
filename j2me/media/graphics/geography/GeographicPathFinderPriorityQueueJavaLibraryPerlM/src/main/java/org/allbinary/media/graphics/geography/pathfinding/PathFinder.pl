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

package org::allbinary::media::graphics::geography::pathfinding::PathFinder;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::media::graphics::geography::pathfinding::GeographicPathFinderBase';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{basicArrayListUtil} = 'org::allbinary::util::BasicArrayListUtil'->getInstance();
    $self->{mathUtil} = 'org::allbinary::logic::math::MathUtil'->getInstance();
    $self->{openPriorityQueue} = 'java::util::PriorityQueue'->new();
    $self->{closedSet} = 'java::util::HashSet'->new();
    $self->{geographicMapInterface} = 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT};
    $self->{costArray} = $org::allbinary::media::graphics::geography::pathfinding::PathFindingNodeCost::NULL_PATH_FINDING_NODE_COST_ARRAY_ARRAY;
}

sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
    return $self;
}


# throws Exception
sub init {
    my ($self, $geographicMapInterface) = @_;
        $self->{geographicMapInterface} = $geographicMapInterface;
        my $tiledLayer = $geographicMapInterface->getAllBinaryTiledLayer();
        $self->{costArray} = [map { [(undef) x ($tiledLayer->getRows())] } 1 .. ($tiledLayer->getColumns())];
        my $basicGeographicMapCellPositionFactory = $geographicMapInterface->getGeographicMapCellPositionFactory();
        my $node = undef;
        my $sizeX = scalar(@{$self->{costArray}});
        my $sizeY = scalar(@{$self->{costArray}->[0]});
        for (my $column = 0; $column < $sizeX; $column++) {
            for (my $row = 0; $row < $sizeY; $row++) {
                my $geographicMapCellType = $geographicMapInterface->getCellTypeAt($basicGeographicMapCellPositionFactory->getAt($column, $row));
                my $raceTrackGeographicMapCellType = $geographicMapCellType;
                $node = 'org::allbinary::media::graphics::geography::pathfinding::PathFindingNodeCost'->new('org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT}, $basicGeographicMapCellPositionFactory->getAt($column, $row), 'org::allbinary::media::graphics::geography::pathfinding::PathFindingNodeCostInfo'->new(int($raceTrackGeographicMapCellType->getTravelCost()), -1));
                $self->{costArray}->[$column]->[$row] = $node;
            }
        }
}


sub searchTotalPath {
    my ($self, $startPathFindingNodeList, $endPathFindingNodeList, $totalPaths) = @_;
        try {
            return $self->search($startPathFindingNodeList->get(0), $endPathFindingNodeList->get(0));
        } catch ($e) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            $self->{logUtil}->put($commonStrings->{EXCEPTION}, $self, "search", $e);
            return $self->{basicArrayListUtil}->getImmutableInstance();
        }
}


# throws Exception
sub searchTotalPathN {
    my ($self, $startPathFindingNodeList, $endPathFindingNodeList, $totalPaths, $multipassState) = @_;
        if ($multipassState->{step} == 0) {
            $multipassState->{step}++;
        } elsif ($multipassState->{step} == 1) {
            $self->searchStart($startPathFindingNodeList->get(0), $endPathFindingNodeList->get(0), $multipassState);
        } elsif ($multipassState->{step} == 2) {
            return $self->searchN($startPathFindingNodeList->get(0), $endPathFindingNodeList->get(0), $multipassState);
        }
        return $self->{basicArrayListUtil}->getImmutableInstance();
}


# throws Exception
sub search {
    my ($self, $startPathFindingNode, $endPathFindingNode) = @_;
        my $list = $self->findPath($startPathFindingNode->{geographicMapCellPosition}, $endPathFindingNode->{geographicMapCellPosition});
        my $pathList = 'org::allbinary::util::BasicArrayListD'->new();
        $pathList->add($list);
        return $pathList;
}


# throws Exception
sub searchStart {
    my ($self, $startPathFindingNode, $endPathFindingNode, $multipassState) = @_;
        $self->findPathStart($startPathFindingNode->{geographicMapCellPosition}, $endPathFindingNode->{geographicMapCellPosition}, $multipassState);
}


# throws Exception
sub searchN {
    my ($self, $startPathFindingNode, $endPathFindingNode, $multipassState) = @_;
        my $list = $self->findPathEnd($startPathFindingNode->{geographicMapCellPosition}, $endPathFindingNode->{geographicMapCellPosition}, $multipassState);
        if (!defined($list)) {
            return $self->{basicArrayListUtil}->getImmutableInstance();
        }
        my $pathList = 'org::allbinary::util::BasicArrayListD'->new();
        $pathList->add($list);
        $multipassState->{iteration} = 0;
        $multipassState->{step} = 0;
        return $pathList;
}


# throws Exception
sub findPath {
    my ($self, $start, $target) = @_;
        $self->{openPriorityQueue}->clear();
        $self->{closedSet}->clear();
        my $discoveryCalculation = 0;
        my $node = undef;
        my $targetColumn = $target->getColumn();
        my $targetRow = $target->getRow();
        my $sizeX = scalar(@{$self->{costArray}});
        my $sizeY = scalar(@{$self->{costArray}->[0]});
        for (my $column = 0; $column < $sizeX; $column++) {
            for (my $row = 0; $row < $sizeY; $row++) {
                $discoveryCalculation = int($self->{mathUtil}->abs($column - $targetColumn)) + $self->{mathUtil}->abs($row - $targetRow);
                $node = $self->{costArray}->[$column]->[$row];
                $node->{pathFindingNodeCostInfoP}->{totalCostP} = 0;
                $node->{pathFindingNodeCostInfoP}->{costToEndP} = $discoveryCalculation;
            }
        }
        my $startNode = $self->{costArray}->[$start->getColumn()]->[$start->getRow()];
        $self->{openPriorityQueue}->add($startNode);
        my $geographicMapInterface = $self->{geographicMapInterface};
        my $basicGeographicMapCellPositionFactory = $geographicMapInterface->getGeographicMapCellPositionFactory();
        my $allBinaryTiledLayer = $geographicMapInterface->getAllBinaryTiledLayer();
        my $targetNode = $self->{costArray}->[$target->getColumn()]->[$target->getRow()];
        my $current = undef;
        while (1) {
            $current = $self->{openPriorityQueue}->poll();
            $self->{closedSet}->add($current);
            if ($current->equals($targetNode)) {
                return $self->extractPath($start, $current);
            }
            my $neighbor = undef;
            my $neighborInfo = undef;
            my $calculatedCost = 0;
            for (my $column = $current->{geographicMapCellPosition}->getColumn() - 1; $column < $current->{geographicMapCellPosition}->getColumn() + 2; $column++) {
                for (my $row = $current->{geographicMapCellPosition}->getRow() - 1; $row < $current->{geographicMapCellPosition}->getRow() + 2; $row++) {
                    if ($column > 0 && $row > 0 && $column < $allBinaryTiledLayer->getColumns() && $row < $allBinaryTiledLayer->getRows() && $geographicMapInterface->isOnMap($basicGeographicMapCellPositionFactory->getAt($column, $row))) {
                        $neighbor = $self->{costArray}->[$column]->[$row];
                        if ($self->{closedSet}->contains($neighbor)) {
                            next;
                        }
                        $neighborInfo = $neighbor->{pathFindingNodeCostInfoP};
                        $calculatedCost = $neighborInfo->{costToEndP} + $neighborInfo->{costFromStartP} + $current->{pathFindingNodeCostInfoP}->{totalCostP};
                        if ($calculatedCost < $neighborInfo->{totalCostP} || !$self->{openPriorityQueue}->contains($neighbor)) {
                            $neighborInfo->{totalCostP} = $calculatedCost;
                            $neighbor->{parent} = $current;
                            if (!$self->{openPriorityQueue}->contains($neighbor)) {
                                if ($geographicMapInterface->isOfFourDirections($current->{geographicMapCellPosition}, $neighbor->{geographicMapCellPosition})) {
                                    $self->{openPriorityQueue}->add($neighbor);
                                }
                            }
                        }
                    }
                }
            }
            last unless (!$self->{openPriorityQueue}->isEmpty());
        }
        die ("RuntimeException");
}


# throws Exception
sub findPathStart {
    my ($self, $start, $target, $multipassState) = @_;
        $self->{openPriorityQueue}->clear();
        $self->{closedSet}->clear();
        my $discoveryCalculation = 0;
        my $node = undef;
        my $targetColumn = $target->getColumn();
        my $targetRow = $target->getRow();
        my $sizeX = scalar(@{$self->{costArray}});
        my $sizeY = scalar(@{$self->{costArray}->[0]});
        for (my $column = 0; $column < $sizeX; $column++) {
            for (my $row = 0; $row < $sizeY; $row++) {
                $discoveryCalculation = int($self->{mathUtil}->abs($column - $targetColumn)) + $self->{mathUtil}->abs($row - $targetRow);
                $node = $self->{costArray}->[$column]->[$row];
                $node->{pathFindingNodeCostInfoP}->{totalCostP} = 0;
                $node->{pathFindingNodeCostInfoP}->{costToEndP} = $discoveryCalculation;
            }
        }
        my $startNode = $self->{costArray}->[$start->getColumn()]->[$start->getRow()];
        $self->{openPriorityQueue}->add($startNode);
        $multipassState->{step}++;
}


# throws Exception
sub findPathEnd {
    my ($self, $start, $target, $multipassState) = @_;
        my $geographicMapInterface = $self->{geographicMapInterface};
        my $basicGeographicMapCellPositionFactory = $geographicMapInterface->getGeographicMapCellPositionFactory();
        my $allBinaryTiledLayer = $geographicMapInterface->getAllBinaryTiledLayer();
        my $targetNode = $self->{costArray}->[$target->getColumn()]->[$target->getRow()];
        my $current = undef;
        my $total = 0;
        while (1) {
            $current = $self->{openPriorityQueue}->poll();
            $self->{closedSet}->add($current);
            if ($current->equals($targetNode)) {
                return $self->extractPath($start, $current);
            }
            my $neighbor = undef;
            my $neighborInfo = undef;
            my $calculatedCost = 0;
            for (my $column = $current->{geographicMapCellPosition}->getColumn() - 1; $column < $current->{geographicMapCellPosition}->getColumn() + 2; $column++) {
                for (my $row = $current->{geographicMapCellPosition}->getRow() - 1; $row < $current->{geographicMapCellPosition}->getRow() + 2; $row++) {
                    if ($column > 0 && $row > 0 && $column < $allBinaryTiledLayer->getColumns() && $row < $allBinaryTiledLayer->getRows() && $geographicMapInterface->isOnMap($basicGeographicMapCellPositionFactory->getAt($column, $row))) {
                        $neighbor = $self->{costArray}->[$column]->[$row];
                        if ($self->{closedSet}->contains($neighbor)) {
                            next;
                        }
                        $neighborInfo = $neighbor->{pathFindingNodeCostInfoP};
                        $calculatedCost = $neighborInfo->{costToEndP} + $neighborInfo->{costFromStartP} + $current->{pathFindingNodeCostInfoP}->{totalCostP};
                        if ($calculatedCost < $neighborInfo->{totalCostP} || !$self->{openPriorityQueue}->contains($neighbor)) {
                            $neighborInfo->{totalCostP} = $calculatedCost;
                            $neighbor->{parent} = $current;
                            if (!$self->{openPriorityQueue}->contains($neighbor)) {
                                if ($geographicMapInterface->isOfFourDirections($current->{geographicMapCellPosition}, $neighbor->{geographicMapCellPosition})) {
                                    $self->{openPriorityQueue}->add($neighbor);
                                }
                            }
                        }
                    }
                }
            }
            $total++;
            if ($total > 10) {
                return $self->{basicArrayListUtil}->getImmutableInstance();
            }
            last unless (!$self->{openPriorityQueue}->isEmpty());
        }
        die ("RuntimeException");
}


sub extractPath {
    my ($self, $start, $current) = @_;
        my $path = 'org::allbinary::util::BasicArrayListD'->new();
        while ($current->{parent} != 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT}) {
            $path->add($current->{geographicMapCellPosition});
            $current = $current->{parent};
        }
        $path->add($start);
        $self->{basicArrayListUtil}->reverse($path);
        return $path;
}

# use java::util::HashSet;
# use java::util::PriorityQueue;
use org::allbinary::game::layer::AllBinaryTiledLayer;
use org::allbinary::logic::NullUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::math::MathUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::media::graphics::geography::map::BasicGeographicMap;
use org::allbinary::media::graphics::geography::map::BasicGeographicMapCellPositionFactory;
use org::allbinary::media::graphics::geography::map::GeographicMapCellPosition;
use org::allbinary::media::graphics::geography::map::GeographicMapCellType;
use org::allbinary::media::graphics::geography::map::racetrack::RaceTrackGeographicMapCellType;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::util::BasicArrayListUtil;
use org::allbinary::media::graphics::geography::pathfinding::GeographicPathFinderBase;
use org::allbinary::media::graphics::geography::pathfinding::PathFindingNodeCost;
use org::allbinary::media::graphics::geography::pathfinding::PathFindingNodeCostInfo;

1;

