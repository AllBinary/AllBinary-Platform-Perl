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

package org::allbinary::media::graphics::geography::map::racetrack::RaceTrackData;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{tileSetImage} = $javax::microedition::lcdui::NullImage::NULL_IMAGE;
    $self->{miniTileSetImage} = $javax::microedition::lcdui::NullImage::NULL_IMAGE;
    $self->{cellWidth} = 0;
    $self->{cellHeight} = 0;
    $self->{miniCellWidth} = 0;
    $self->{miniCellHeight} = 0;
    $self->{mapArray} = 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_INT_ARRAY_ARRAY};
    $self->{cellTypeIdToGeographicMapCellTypeArray} = 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_INT_ARRAY};
    $self->{NO_OVER_PASSES_ARRAY} = [(undef) x (0)];
    $self->{overPassGeographicMapCellPositionArray} = $self->{NO_OVER_PASSES_ARRAY};
    $self->{id} = undef;
}


sub new {
    my ($class, $id, $cellWidth, $cellHeight, $miniCellWidth, $miniCellHeight, $cellTypeIdToGeographicMapCellTypeArray, $mapArray) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{id} = $id;
        $self->{cellWidth} = $cellWidth;
        $self->{cellHeight} = $cellHeight;
        $self->{miniCellWidth} = $miniCellWidth;
        $self->{miniCellHeight} = $miniCellHeight;
        $self->{mapArray} = $mapArray;
        $self->{cellTypeIdToGeographicMapCellTypeArray} = $cellTypeIdToGeographicMapCellTypeArray;
    return $self;
}


sub setMapArray {
    my ($self, $mapArray) = @_;
        $self->{mapArray} = $mapArray;
}


sub getMapArray {
    my ($self) = @_;
        return $self->{mapArray};
}


sub setCellTypeIdToGeographicMapCellTypeArray {
    my ($self, $cellTypeIdToGeographicMapCellTypeArray) = @_;
        $self->{cellTypeIdToGeographicMapCellTypeArray} = $cellTypeIdToGeographicMapCellTypeArray;
}


sub getCellTypeIdToGeographicMapCellTypeArray {
    my ($self) = @_;
        return $self->{cellTypeIdToGeographicMapCellTypeArray};
}


sub setCellWidth {
    my ($self, $cellWidth) = @_;
        $self->{cellWidth} = $cellWidth;
}


sub getCellWidth {
    my ($self) = @_;
        return $self->{cellWidth};
}


sub setCellHeight {
    my ($self, $cellHeight) = @_;
        $self->{cellHeight} = $cellHeight;
}


sub getCellHeight {
    my ($self) = @_;
        return $self->{cellHeight};
}


sub getOverPassGeographicMapCellPositionArray {
    my ($self) = @_;
        return $self->{overPassGeographicMapCellPositionArray};
}


sub setOverPassGeographicMapCellPositionArray {
    my ($self, $overPassGeographicMapCellPositionArray) = @_;
        $self->{overPassGeographicMapCellPositionArray} = $overPassGeographicMapCellPositionArray;
}


sub getTileSetImage {
    my ($self) = @_;
        return $self->{tileSetImage};
}


sub setTileSetImage {
    my ($self, $tileSetImage) = @_;
        $self->{tileSetImage} = $tileSetImage;
}


sub getMiniTileSetImage {
    my ($self) = @_;
        return $self->{miniTileSetImage};
}


sub setMiniTileSetImage {
    my ($self, $miniTileSetImage) = @_;
        $self->{miniTileSetImage} = $miniTileSetImage;
}


sub getMiniCellWidth {
    my ($self) = @_;
        return $self->{miniCellWidth};
}


sub setMiniCellWidth {
    my ($self, $miniCellWidth) = @_;
        $self->{miniCellWidth} = $miniCellWidth;
}


sub getMiniCellHeight {
    my ($self) = @_;
        return $self->{miniCellHeight};
}


sub setMiniCellHeight {
    my ($self, $miniCellHeight) = @_;
        $self->{miniCellHeight} = $miniCellHeight;
}


sub setId {
    my ($self, $id) = @_;
        $self->{id} = $id;
}


sub getId {
    my ($self) = @_;
        return $self->{id};
}

# use javax::microedition::lcdui::Image;
# use javax::microedition::lcdui::NullImage;
use org::allbinary::graphics::CellPosition;
use org::allbinary::logic::NullUtil;

1;

