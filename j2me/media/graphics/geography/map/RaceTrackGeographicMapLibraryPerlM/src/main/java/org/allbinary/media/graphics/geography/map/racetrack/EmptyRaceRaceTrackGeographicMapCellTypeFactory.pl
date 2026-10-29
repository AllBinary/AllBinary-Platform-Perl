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

package org::allbinary::media::graphics::geography::map::racetrack::EmptyRaceRaceTrackGeographicMapCellTypeFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::media::graphics::geography::map::racetrack::RaceTrackGeographicMapCellTypeFactory';

our $instanceC = 'org::allbinary::media::graphics::geography::map::racetrack::EmptyRaceRaceTrackGeographicMapCellTypeFactory'->new();


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::media::graphics::geography::map::racetrack::EmptyRaceRaceTrackGeographicMapCellTypeFactory::instanceC;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
        my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
        $self->{EMPTY_CELL_TYPE} = 'org::allbinary::media::graphics::geography::map::racetrack::RaceTrackGeographicMapCellType'->new($commonStrings->{EMPTY}, 0, 'org::allbinary::media::graphics::geography::pathfinding::PathFindingNodeCostInfoData'->getInstance()->{MAX_NODE_COST}, 1);
        $self->{EASY_CELL_TYPE} = 'org::allbinary::media::graphics::geography::map::racetrack::RaceTrackGeographicMapCellType'->new("Easy", 19, 1, 0);
        $self->{FINISH_LINE_ROAD_CELL_TYPE} = $self->{DEFAULT_FINISH_LINE_ROAD_CELL_TYPE};
    return $self;
}

use org::allbinary::string::CommonStrings;
use org::allbinary::media::graphics::geography::pathfinding::PathFindingNodeCostInfoData;
use org::allbinary::media::graphics::geography::map::racetrack::RaceTrackGeographicMapCellTypeFactory;
use org::allbinary::media::graphics::geography::map::racetrack::RaceTrackGeographicMapCellType;

1;

