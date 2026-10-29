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

package org::allbinary::media::graphics::geography::map::racetrack::RaceTrackGeographicMapCellTypeFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::media::graphics::geography::map::GeographicMapCellTypeFactory';

our $instanceC = 'org::allbinary::media::graphics::geography::map::racetrack::RaceTrackGeographicMapCellTypeFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{EMPTY_CELL_TYPE} = 'org::allbinary::media::graphics::geography::map::GeographicMapCellType'->new(0, -1);
    $self->{EASY_CELL_TYPE} = $self->{EMPTY_CELL_TYPE};
    $self->{BOTTOM_LEFT_TURN_ROAD_CELL_TYPE} = undef;
    $self->{BOTTOM_RIGHT_TURN_ROAD_CELL_TYPE} = undef;
    $self->{TOP_LEFT_TURN_ROAD_CELL_TYPE} = undef;
    $self->{TOP_RIGHT_TURN_ROAD_CELL_TYPE} = undef;
    $self->{HORIZONTAL_STRAIGHT_ROAD_CELL_TYPE} = undef;
    $self->{VERTICAL_STRAIGHT_ROAD_CELL_TYPE} = undef;
    $self->{START_LINE_ROAD_CELL_TYPE} = undef;
    $self->{DEFAULT_FINISH_LINE_ROAD_CELL_TYPE} = undef;
    $self->{FINISH_LINE_ROAD_CELL_TYPE} = $org::allbinary::media::graphics::geography::map::GeographicMapCellType::NULL_GEOGRAPHIC_MAP_CELL_TYPE;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::media::graphics::geography::map::racetrack::RaceTrackGeographicMapCellTypeFactory::instanceC;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        my $raceTrackGeographicMapCellTypes = 'org::allbinary::media::graphics::geography::map::racetrack::RaceTrackGeographicMapCellTypes'->getInstance();
        $self->{BOTTOM_LEFT_TURN_ROAD_CELL_TYPE} = $raceTrackGeographicMapCellTypes->{BOTTOM_LEFT_TURN_ROAD_CELL_TYPE};
        $self->{BOTTOM_RIGHT_TURN_ROAD_CELL_TYPE} = $raceTrackGeographicMapCellTypes->{BOTTOM_RIGHT_TURN_ROAD_CELL_TYPE};
        $self->{TOP_LEFT_TURN_ROAD_CELL_TYPE} = $raceTrackGeographicMapCellTypes->{TOP_LEFT_TURN_ROAD_CELL_TYPE};
        $self->{TOP_RIGHT_TURN_ROAD_CELL_TYPE} = $raceTrackGeographicMapCellTypes->{TOP_RIGHT_TURN_ROAD_CELL_TYPE};
        $self->{HORIZONTAL_STRAIGHT_ROAD_CELL_TYPE} = $raceTrackGeographicMapCellTypes->{HORIZONTAL_STRAIGHT_ROAD_CELL_TYPE};
        $self->{VERTICAL_STRAIGHT_ROAD_CELL_TYPE} = $raceTrackGeographicMapCellTypes->{VERTICAL_STRAIGHT_ROAD_CELL_TYPE};
        $self->{START_LINE_ROAD_CELL_TYPE} = $raceTrackGeographicMapCellTypes->{START_LINE_ROAD_CELL_TYPE};
        $self->{DEFAULT_FINISH_LINE_ROAD_CELL_TYPE} = $raceTrackGeographicMapCellTypes->{DEFAULT_FINISH_LINE_ROAD_CELL_TYPE};
    return $self;
}


sub getStartType {
    my ($self) = @_;
        return $self->{START_LINE_ROAD_CELL_TYPE}->getType();
}


sub getEndType {
    my ($self) = @_;
        return $self->{FINISH_LINE_ROAD_CELL_TYPE}->getType();
}


sub getEmptyType {
    my ($self) = @_;
        return $self->{EMPTY_CELL_TYPE}->getType();
}


sub isPath {
    my ($self, $cellType) = @_;
        if ($cellType != $self->{EMPTY_CELL_TYPE} && $cellType != $self->{EASY_CELL_TYPE}) {
            return 1;
        }
        return 0;
}

use org::allbinary::media::graphics::geography::map::GeographicMapCellType;
use org::allbinary::media::graphics::geography::map::GeographicMapCellTypeFactory;
use org::allbinary::media::graphics::geography::map::racetrack::RaceTrackGeographicMapCellTypes;

1;

