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

# Java interface
package org::allbinary::media::graphics::geography::map::GeographicMapInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub getId {
    my ($self) = @_;
    die "abstract method getId";
}


sub getName {
    my ($self) = @_;
    die "abstract method getName";
}


sub reset {
    my ($self) = @_;
    die "abstract method reset";
}


sub getAllBinaryTiledLayer {
    my ($self) = @_;
    die "abstract method getAllBinaryTiledLayer";
}


# throws Exception
sub getCellPositionsAt {
    my ($self, $layer, $currentCellPositionArray, $cellPositionArray) = @_;
    die "abstract method getCellPositionsAt";
}


# throws Exception
sub getCellPositionAtXY {
    my ($self, $x, $y) = @_;
    die "abstract method getCellPositionAtXY";
}


# throws Exception
sub getCellPositionAtXYNoThrow {
    my ($self, $x, $y) = @_;
    die "abstract method getCellPositionAtXYNoThrow";
}


sub getCellTypeFromMapCellTypeInt {
    my ($self, $cellTypeId) = @_;
    die "abstract method getCellTypeFromMapCellTypeInt";
}


# throws Exception
sub getCellTypeAtXY {
    my ($self, $x, $y) = @_;
    die "abstract method getCellTypeAtXY";
}


# throws Exception
sub getCellTypeAt {
    my ($self, $geographicMapCellPosition) = @_;
    die "abstract method getCellTypeAt";
}


sub getGeographicMapCellPositionFactory {
    my ($self) = @_;
    die "abstract method getGeographicMapCellPositionFactory";
}


sub getGeographicMapCellPositionFactoryInterface {
    my ($self) = @_;
    die "abstract method getGeographicMapCellPositionFactoryInterface";
}


sub getForegroundBasicColor {
    my ($self) = @_;
    die "abstract method getForegroundBasicColor";
}


sub getBackgroundBasicColor {
    my ($self) = @_;
    die "abstract method getBackgroundBasicColor";
}

use org::allbinary::game::layer::AllBinaryTiledLayer;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::layer::Layer;

1;

