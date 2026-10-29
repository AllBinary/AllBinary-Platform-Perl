# 
# AllBinary Open License Version 1 
# Copyright (c) 2025 AllBinary 
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

package org::allbinary::media::graphics::geography::map::racetrack::NullRaceTrackGeographicMap;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::media::graphics::geography::map::racetrack::RaceTrackGeographicMapInterface';

our $NULL_RACE_TRACK_GEOGRAPHIC_MAP = 'org::allbinary::media::graphics::geography::map::racetrack::NullRaceTrackGeographicMap'->new();

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getId {
    my ($self) = @_;
        die ("RuntimeException");
}


sub getName {
    my ($self) = @_;
        die ("RuntimeException");
}


sub reset {
    my ($self) = @_;
        die ("RuntimeException");
}


sub getAllBinaryTiledLayer {
    my ($self) = @_;
        die ("RuntimeException");
}


# throws Exception
sub getCellPositionsAt {
    my ($self, $layer, $currentCellPositionArray, $cellPositionArray) = @_;
        die ("RuntimeException");
}


# throws Exception
sub getCellPositionAtXY {
    my ($self, $x, $y) = @_;
        die ("RuntimeException");
}


# throws Exception
sub getCellPositionAtXYNoThrow {
    my ($self, $x, $y) = @_;
        die ("RuntimeException");
}


sub getCellTypeFromMapCellTypeInt {
    my ($self, $cellTypeId) = @_;
        die ("RuntimeException");
}


# throws Exception
sub getCellTypeAtXY {
    my ($self, $x, $y) = @_;
        die ("RuntimeException");
}


# throws Exception
sub getCellTypeAt {
    my ($self, $geographicMapCellPosition) = @_;
        die ("RuntimeException");
}


sub getGeographicMapCellPositionFactory {
    my ($self) = @_;
        die ("RuntimeException");
}


sub getGeographicMapCellPositionFactoryInterface {
    my ($self) = @_;
        die ("RuntimeException");
}


sub getForegroundBasicColor {
    my ($self) = @_;
        die ("RuntimeException");
}


sub getBackgroundBasicColor {
    my ($self) = @_;
        die ("RuntimeException");
}


sub getRaceTrackInfo {
    my ($self) = @_;
        die ("RuntimeException");
}


sub setRaceTrackInfo {
    my ($self, $aRaceTrackInfo) = @_;
        die ("RuntimeException");
}


sub getRaceTrackData {
    my ($self) = @_;
        die ("RuntimeException");
}


sub setRaceTrackData {
    my ($self, $raceTrackData) = @_;
        die ("RuntimeException");
}

use org::allbinary::game::layer::AllBinaryTiledLayer;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::layer::Layer;
use org::allbinary::media::graphics::geography::map::BasicGeographicMapCellPositionFactory;
use org::allbinary::media::graphics::geography::map::GeographicMapCellPosition;
use org::allbinary::media::graphics::geography::map::GeographicMapCellPositionFactoryInterface;
use org::allbinary::media::graphics::geography::map::GeographicMapCellType;
use org::allbinary::media::graphics::geography::map::racetrack::RaceTrackGeographicMapInterface;

1;

