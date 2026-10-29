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

package org::allbinary::media::graphics::geography::map::GeographicMapCellPositionTracking;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{currentGeographicMapCellPosition} = $org::allbinary::media::graphics::geography::map::SimpleGeographicMapCellPositionFactory::NULL_GEOGRAPHIC_MAP_CELL_POSITION;
    $self->{previousGeographicMapCellPosition} = $org::allbinary::media::graphics::geography::map::SimpleGeographicMapCellPositionFactory::NULL_GEOGRAPHIC_MAP_CELL_POSITION;
    $self->{newGeographicMapCellPosition} = $org::allbinary::media::graphics::geography::map::SimpleGeographicMapCellPositionFactory::NULL_GEOGRAPHIC_MAP_CELL_POSITION;
    $self->{currentCellType} = $org::allbinary::media::graphics::geography::map::GeographicMapCellType::NULL_GEOGRAPHIC_MAP_CELL_TYPE;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


# throws Exception
sub getCurrentOverCellType {
    my ($self, $geographicMap) = @_;
        my $geographicMapCellPosition = $self->{currentGeographicMapCellPosition};
        if ($geographicMapCellPosition != $self->{previousGeographicMapCellPosition}) {
            $self->{currentCellType} = $geographicMap->getCellTypeAt($geographicMapCellPosition);
        }
        return $self->{currentCellType};
}


# throws Exception
sub updateStart {
    my ($self, $gameCanvasInterface, $layer) = @_;
        if ($gameCanvasInterface != $org::allbinary::media::graphics::geography::map::SimpleGeographicMapCellPositionFactory::NULL_GEOGRAPHIC_MAP_CELL_POSITION) {
            my $geographicMapCompositeInterface = $gameCanvasInterface->getLayerManager();
            my $geographicMapInterface = $geographicMapCompositeInterface->getGeographicMapInterface()->[0];
            $self->{newGeographicMapCellPosition} = $geographicMapInterface->getCellPositionAtXY($layer->getXP() + $layer->getHalfWidth(), $layer->getYP() + $layer->getHalfHeight());
            if ($self->{newGeographicMapCellPosition} != $self->{currentGeographicMapCellPosition}) {
                $self->{currentGeographicMapCellPosition} = $self->{newGeographicMapCellPosition};
                return 1;
            }
        }
        return 0;
}


sub updateEnd {
    my ($self) = @_;
        if ($self->{currentGeographicMapCellPosition} != $self->{previousGeographicMapCellPosition}) {
            $self->{previousGeographicMapCellPosition} = $self->{currentGeographicMapCellPosition};
            return 1;
        }
        return 0;
}


sub getPreviousGeographicMapCellPosition {
    my ($self) = @_;
        return $self->{previousGeographicMapCellPosition};
}


sub getCurrentGeographicMapCellPosition {
    my ($self) = @_;
        return $self->{currentGeographicMapCellPosition};
}

use org::allbinary::game::displayable::canvas::AllBinaryGameCanvasInterface;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::media::graphics::geography::map::SimpleGeographicMapCellPositionFactory;
use org::allbinary::media::graphics::geography::map::GeographicMapCellType;

1;

