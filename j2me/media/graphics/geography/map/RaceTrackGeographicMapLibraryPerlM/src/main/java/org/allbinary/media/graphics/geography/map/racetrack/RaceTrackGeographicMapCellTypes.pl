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

package org::allbinary::media::graphics::geography::map::racetrack::RaceTrackGeographicMapCellTypes;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::media::graphics::geography::map::racetrack::RaceTrackGeographicMapCellTypes'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{BOTTOM_LEFT_TURN_ROAD_CELL_TYPE} = undef;
    $self->{BOTTOM_RIGHT_TURN_ROAD_CELL_TYPE} = undef;
    $self->{TOP_LEFT_TURN_ROAD_CELL_TYPE} = undef;
    $self->{TOP_RIGHT_TURN_ROAD_CELL_TYPE} = undef;
    $self->{HORIZONTAL_STRAIGHT_ROAD_CELL_TYPE} = undef;
    $self->{VERTICAL_STRAIGHT_ROAD_CELL_TYPE} = undef;
    $self->{START_LINE_ROAD_CELL_TYPE} = undef;
    $self->{DEFAULT_FINISH_LINE_ROAD_CELL_TYPE} = undef;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::media::graphics::geography::map::racetrack::RaceTrackGeographicMapCellTypes::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{BOTTOM_LEFT_TURN_ROAD_CELL_TYPE} = 'org::allbinary::media::graphics::geography::map::racetrack::RaceTrackGeographicMapCellType'->new("Bottom Left Turn", 1, 1, 0);
        $self->{BOTTOM_RIGHT_TURN_ROAD_CELL_TYPE} = 'org::allbinary::media::graphics::geography::map::racetrack::RaceTrackGeographicMapCellType'->new("Bottom Right Turn", 2, 1, 0);
        $self->{TOP_LEFT_TURN_ROAD_CELL_TYPE} = 'org::allbinary::media::graphics::geography::map::racetrack::RaceTrackGeographicMapCellType'->new("Top Left Turn", 3, 1, 0);
        $self->{TOP_RIGHT_TURN_ROAD_CELL_TYPE} = 'org::allbinary::media::graphics::geography::map::racetrack::RaceTrackGeographicMapCellType'->new("Top Right Turne", 4, 1, 0);
        $self->{HORIZONTAL_STRAIGHT_ROAD_CELL_TYPE} = 'org::allbinary::media::graphics::geography::map::racetrack::RaceTrackGeographicMapCellType'->new("Horizontal Straight", 5, 1, 0);
        $self->{VERTICAL_STRAIGHT_ROAD_CELL_TYPE} = 'org::allbinary::media::graphics::geography::map::racetrack::RaceTrackGeographicMapCellType'->new("Vertical Straight", 6, 1, 0);
        $self->{START_LINE_ROAD_CELL_TYPE} = 'org::allbinary::media::graphics::geography::map::racetrack::RaceTrackGeographicMapCellType'->new("Start Line", 7, 1, 0);
        $self->{DEFAULT_FINISH_LINE_ROAD_CELL_TYPE} = 'org::allbinary::media::graphics::geography::map::racetrack::RaceTrackGeographicMapCellType'->new("Finish Line", 8, 1, 0);
    return $self;
}

use org::allbinary::media::graphics::geography::map::racetrack::RaceTrackGeographicMapCellType;

1;

