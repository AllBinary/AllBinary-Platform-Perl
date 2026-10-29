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

package org::allbinary::media::graphics::geography::map::racetrack::RaceTrackStartPointUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


# throws Exception
sub get {
    my ($class, $geographicMapInterface, $pathFindingInfo, $index) = @_;
        my $list = $pathFindingInfo->getStartPathFindingNodeList();
        my $startPathFindingNode = $list->get($index);
        my $geographicMapCellPosition = $startPathFindingNode->{geographicMapCellPosition};
        my $point = $geographicMapCellPosition->getPoint();
        return 'org::allbinary::graphics::PointFactory'->getInstance()->createXY($point->getX(), $point->getY() + $geographicMapInterface->getAllBinaryTiledLayer()->getHalfCellHeight());
}

use org::allbinary::util::BasicArrayList;
use org::allbinary::graphics::GPoint;
use org::allbinary::graphics::PointFactory;
use org::allbinary::media::graphics::geography::map::BasicGeographicMap;
use org::allbinary::media::graphics::geography::map::GeographicMapCellPosition;
use org::allbinary::media::graphics::geography::pathfinding::PathFindingInfo;
use org::allbinary::media::graphics::geography::pathfinding::PathFindingNode;

1;

