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

package org::allbinary::media::graphics::geography::map::racetrack::NormalRaceTrackGeographicMapCellTypeFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::media::graphics::geography::map::racetrack::RaceTrackGeographicMapCellTypeFactory';

our $instanceC = 'org::allbinary::media::graphics::geography::map::racetrack::NormalRaceTrackGeographicMapCellTypeFactory'->new();


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::media::graphics::geography::map::racetrack::NormalRaceTrackGeographicMapCellTypeFactory::instanceC;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
        $self->{EMPTY_CELL_TYPE} = 'org::allbinary::media::graphics::geography::map::racetrack::EmptyRaceRaceTrackGeographicMapCellTypeFactory'->getInstance()->{EMPTY_CELL_TYPE};
        $self->{EASY_CELL_TYPE} = $self->{EMPTY_CELL_TYPE};
        $self->{FINISH_LINE_ROAD_CELL_TYPE} = $self->{DEFAULT_FINISH_LINE_ROAD_CELL_TYPE};
    return $self;
}

use org::allbinary::media::graphics::geography::map::racetrack::RaceTrackGeographicMapCellTypeFactory;
use org::allbinary::media::graphics::geography::map::racetrack::EmptyRaceRaceTrackGeographicMapCellTypeFactory;

1;

