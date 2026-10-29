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

package org::allbinary::media::graphics::geography::map::racetrack::CustomMapGenerator;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::media::graphics::geography::map::racetrack::CustomMapGeneratorBase';


sub _init_fields {
    my ($self) = @_;
    $self->{customMapArray} = undef;
    $self->{raceTrackGeographicMap} = undef;
    $self->{geographicMapCellTypeFactory} = undef;
    $self->{dropCellPositionHistory} = 'org::allbinary::media::graphics::geography::map::drop::DropCellPositionHistory'->getInstance();
}


sub new {
    my ($class, $raceTrackGeographicMap) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{raceTrackGeographicMap} = $raceTrackGeographicMap;
        $self->{geographicMapCellTypeFactory} = $self->{raceTrackGeographicMap}->getGeographicMapCellTypeFactory();
        my $mapArray = $raceTrackGeographicMap->getRaceTrackData()->getMapArray();
        my $size2 = scalar(@{$mapArray->[0]});
        $self->{customMapArray} = [map { [(0) x ($size2)] } 1 .. (scalar(@{$mapArray}))];
        if (scalar(@{$mapArray}) != scalar(@{$self->{customMapArray}}) || scalar(@{$mapArray->[0]}) != scalar(@{$self->{customMapArray}->[0]})) {
            die ("Array Incorrect");
        }
    return $self;
}


# throws Exception
sub copyMapIntoCustomMap {
    my ($self) = @_;
        my $mapArray = $self->{raceTrackGeographicMap}->getRaceTrackData()->getMapArray();
        my $startIndex2 = scalar(@{$mapArray->[0]}) - 1;
        for (my $index = scalar(@{$mapArray}) - 1; $index >= 0; $index--) {
            for (my $index2 = $startIndex2; $index2 >= 0; $index2--) {
                $self->{customMapArray}->[$index]->[$index2] = $self->getCustomType($index2, $index, $mapArray->[$index]->[$index2]);
            }
        }
}


# throws Exception
sub getCustomType {
    my ($self, $column, $row, $currentType) = @_;
        my $emptyType = $self->{geographicMapCellTypeFactory}->getEmptyType();
        my $geographicMapCellPositionFactory = $self->{raceTrackGeographicMap}->getGeographicMapCellPositionFactory();
        my $cellPosition = $geographicMapCellPositionFactory->getAt($column, $row);
        if ($self->{dropCellPositionHistory}->isCellPositionWithDrop($cellPosition)) {
            my $layer = $self->{dropCellPositionHistory}->getLayerInterface($cellPosition);
            if ($layer == $org::allbinary::layer::AllBinaryLayer::NULL_ALLBINARY_LAYER) {
                return $emptyType;
            }
            my $rtsLayer = $layer;
            if (!($rtsLayer->getType() == 'org::allbinary::game::layer::waypoint::WaypointLayer'->getStaticType())) {
                return $emptyType;
            }
        }
        return $currentType;
}


sub getCustomMapArray {
    my ($self) = @_;
        return $self->{customMapArray};
}

use org::allbinary::game::layer::AdvancedRTSGameLayer;
use org::allbinary::game::layer::waypoint::WaypointLayer;
use org::allbinary::graphics::CellPosition;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::media::graphics::geography::map::BasicGeographicMapCellPositionFactory;
use org::allbinary::media::graphics::geography::map::GeographicMapCellTypeFactory;
use org::allbinary::media::graphics::geography::map::drop::DropCellPositionHistory;
use org::allbinary::media::graphics::geography::map::racetrack::CustomMapGeneratorBase;

1;

