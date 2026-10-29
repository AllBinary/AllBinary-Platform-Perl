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

package org::allbinary::media::graphics::geography::pathfinding::GeographicMapCellPathHistoryInfo;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{previousGeographicMapCellPosition} = $org::allbinary::media::graphics::geography::map::SimpleGeographicMapCellPositionFactory::NULL_GEOGRAPHIC_MAP_CELL_POSITION;
    $self->{previousOnPathGeographicMapCellPosition} = $org::allbinary::media::graphics::geography::map::SimpleGeographicMapCellPositionFactory::NULL_GEOGRAPHIC_MAP_CELL_POSITION;
    $self->{nextUnvisitedOnPathGeographicMapCellPosition} = $org::allbinary::media::graphics::geography::map::SimpleGeographicMapCellPositionFactory::NULL_GEOGRAPHIC_MAP_CELL_POSITION;
    $self->{nextOnPathGeographicMapCellPosition} = $org::allbinary::media::graphics::geography::map::SimpleGeographicMapCellPositionFactory::NULL_GEOGRAPHIC_MAP_CELL_POSITION;
    $self->{nextChosenOnPathGeographicMapCellPosition} = $org::allbinary::media::graphics::geography::map::SimpleGeographicMapCellPositionFactory::NULL_GEOGRAPHIC_MAP_CELL_POSITION;
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getPreviousGeographicMapCellPosition {
    my ($self) = @_;
        return $self->{previousGeographicMapCellPosition};
}


sub setPreviousGeographicMapCellPosition {
    my ($self, $previousGeographicMapCellPosition) = @_;
        $self->{previousGeographicMapCellPosition} = $previousGeographicMapCellPosition;
}


sub getPreviousOnPathGeographicMapCellPosition {
    my ($self) = @_;
        return $self->{previousOnPathGeographicMapCellPosition};
}


sub setPreviousOnPathGeographicMapCellPosition {
    my ($self, $previousOnPathGeographicMapCellPosition) = @_;
        $self->{previousOnPathGeographicMapCellPosition} = $previousOnPathGeographicMapCellPosition;
}


sub getNextUnvisitedOnPathGeographicMapCellPosition {
    my ($self) = @_;
        return $self->{nextUnvisitedOnPathGeographicMapCellPosition};
}


sub setNextUnvisitedOnPathGeographicMapCellPosition {
    my ($self, $nextUnvisitedOnPathGeographicMapCellPosition) = @_;
        $self->{nextUnvisitedOnPathGeographicMapCellPosition} = $nextUnvisitedOnPathGeographicMapCellPosition;
}


sub getNextOnPathGeographicMapCellPosition {
    my ($self) = @_;
        return $self->{nextOnPathGeographicMapCellPosition};
}


sub setNextOnPathGeographicMapCellPosition {
    my ($self, $nextOnPathGeographicMapCellPosition) = @_;
        $self->{nextOnPathGeographicMapCellPosition} = $nextOnPathGeographicMapCellPosition;
}


sub getNextChosenOnPathGeographicMapCellPosition {
    my ($self) = @_;
        return $self->{nextChosenOnPathGeographicMapCellPosition};
}


sub setNextChosenOnPathGeographicMapCellPosition {
    my ($self, $nextChosenOnPathGeographicMapCellPosition) = @_;
        $self->{nextChosenOnPathGeographicMapCellPosition} = $nextChosenOnPathGeographicMapCellPosition;
}

use org::allbinary::media::graphics::geography::map::GeographicMapCellPosition;
use org::allbinary::media::graphics::geography::map::SimpleGeographicMapCellPositionFactory;

1;

