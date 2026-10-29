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

package org::allbinary::media::graphics::geography::pathfinding::PathFindingNodeCostInfoFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::media::graphics::geography::pathfinding::PathFindingNodeCostInfoFactoryBase';


sub _init_fields {
    my ($self) = @_;
    $self->{pathFindingNodeCostInfoAdjacencyList} = undef;
}


sub new {
    my ($class, $max) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{pathFindingNodeCostInfoAdjacencyList} = [map { [(undef) x ($max)] } 1 .. ($max)];
    return $self;
}


# throws Exception
sub create {
    my ($self, $geographicMapInterface, $goingToGeographicMapCellPosition, $geographicMapCellPosition, $costFromStart, $costToEnd) = @_;
        $self->getInstance($goingToGeographicMapCellPosition, $geographicMapCellPosition, $costFromStart, $costToEnd);
}


# throws Exception
sub getInstance {
    my ($self, $goingToGeographicMapCellPosition, $geographicMapCellPosition, $costFromStart, $costToEnd) = @_;
        my $pathFindingNodeCostInfo = $self->getInstance($goingToGeographicMapCellPosition, $geographicMapCellPosition);
        if (!defined($pathFindingNodeCostInfo)) {
            $pathFindingNodeCostInfo = 'org::allbinary::media::graphics::geography::pathfinding::PathFindingNodeCostInfo'->new($costFromStart, $costToEnd);
            $pathFindingNodeCostInfo->setCalculatedTotalCost();
            $self->{pathFindingNodeCostInfoAdjacencyList}->[$geographicMapCellPosition->getId()]->[$goingToGeographicMapCellPosition->getId()] = $pathFindingNodeCostInfo;
        } else {
            $pathFindingNodeCostInfo->setCostFromStart($costFromStart);
            $pathFindingNodeCostInfo->setCostToEnd($costToEnd);
            $pathFindingNodeCostInfo->setCalculatedTotalCost();
        }
        return $pathFindingNodeCostInfo;
}


# Java overloaded method: Perl keeps the last definition
sub getInstance {
    my ($self, $goingToFromGeographicMapCellPosition, $geographicMapCellPosition) = @_;
        return $self->{pathFindingNodeCostInfoAdjacencyList}->[$geographicMapCellPosition->getId()]->[$goingToFromGeographicMapCellPosition->getId()];
}


sub getTotalCost {
    my ($self, $geographicMapInterface, $comingFromGeographicMapCellPosition, $geographicMapCellPosition) = @_;
        return $self->getInstance($comingFromGeographicMapCellPosition, $geographicMapCellPosition)->{totalCostP};
}

use org::allbinary::media::graphics::geography::map::BasicGeographicMap;
use org::allbinary::media::graphics::geography::map::GeographicMapCellPosition;
use org::allbinary::media::graphics::geography::pathfinding::PathFindingNodeCostInfoFactoryBase;
use org::allbinary::media::graphics::geography::pathfinding::PathFindingNodeCostInfo;

1;

