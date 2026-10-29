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



sub new {
    my ($class, $max) = @_;
    my $self = $class->SUPER::new();
    return $self;
}


# throws Exception
sub create {
    my ($self, $geographicMapInterface, $goingToGeographicMapCellPosition, $geographicMapCellPosition, $costFromStart, $costToEnd) = @_;
}


# throws Exception
sub getTotalCost {
    my ($self, $geographicMapInterface, $comingFromGeographicMapCellPosition, $geographicMapCellPosition) = @_;
        my $geographicMapCellType = $geographicMapInterface->getCellTypeAt($comingFromGeographicMapCellPosition);
        my $geographicMapCellType2 = $geographicMapInterface->getCellTypeAt($geographicMapCellPosition);
        my $raceTrackGeographicMapCellType = $geographicMapCellType;
        my $raceTrackGeographicMapCellType2 = $geographicMapCellType2;
        return int($raceTrackGeographicMapCellType->getTravelCost()) + $raceTrackGeographicMapCellType2->getTravelCost();
}

use org::allbinary::media::graphics::geography::map::BasicGeographicMap;
use org::allbinary::media::graphics::geography::map::GeographicMapCellPosition;
use org::allbinary::media::graphics::geography::map::GeographicMapCellType;
use org::allbinary::media::graphics::geography::map::racetrack::RaceTrackGeographicMapCellType;
use org::allbinary::media::graphics::geography::pathfinding::PathFindingNodeCostInfoFactoryBase;

1;

