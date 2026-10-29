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

package org::allbinary::media::graphics::geography::map::BasicGeographicMapUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::media::graphics::geography::map::BasicGeographicMapUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::media::graphics::geography::map::BasicGeographicMapUtil::instance;
}


# throws Exception
sub getBorderingRow {
    my ($self, $direction, $oldGeographicMapCellPosition) = @_;
        my $LOCATION_CHANGE = 1;
        for my $switch_value ($direction) {
            if ($switch_value == 0) {
                return $oldGeographicMapCellPosition->getRow();
            }
            if ($switch_value == 1) {
                return $oldGeographicMapCellPosition->getRow();
            }
            if ($switch_value == 2) {
                return $oldGeographicMapCellPosition->getRow() + $LOCATION_CHANGE;
            }
            if ($switch_value == 3) {
                return $oldGeographicMapCellPosition->getRow() - $LOCATION_CHANGE;
            }
            {
                die ("Only Four Directions");
            }
        }
}


# throws Exception
sub getBorderingColumn {
    my ($self, $direction, $oldGeographicMapCellPosition) = @_;
        my $LOCATION_CHANGE = 1;
        for my $switch_value ($direction) {
            if ($switch_value == 0) {
                return $oldGeographicMapCellPosition->getColumn() - $LOCATION_CHANGE;
            }
            if ($switch_value == 1) {
                return $oldGeographicMapCellPosition->getColumn() + $LOCATION_CHANGE;
            }
            if ($switch_value == 2) {
                return $oldGeographicMapCellPosition->getColumn();
            }
            if ($switch_value == 3) {
                return $oldGeographicMapCellPosition->getColumn();
            }
            {
                die ("Only Four Directions");
            }
        }
}


# throws Exception
sub isSameCellPosition {
    my ($self, $fromGeographicMapCellPosition, $toGeographicMapCellPosition) = @_;
        my $fromColumn = $fromGeographicMapCellPosition->getColumn();
        my $fromRow = $fromGeographicMapCellPosition->getRow();
        my $goColumn = $toGeographicMapCellPosition->getColumn();
        my $goRow = $toGeographicMapCellPosition->getRow();
        if ($fromColumn == $goColumn && $fromRow == $goRow) {
            return 1;
        } else {
            return 0;
        }
}


sub createAllBinaryTiledLayerArray {
    my ($self, $geographicMapInterfaceArray) = @_;
        my $tiledLayerArray = [(undef) x (scalar(@{$geographicMapInterfaceArray}))];
        return $self->getAllBinaryTiledLayerArray($geographicMapInterfaceArray, $tiledLayerArray, 0);
}


sub getAllBinaryTiledLayerArray {
    my ($self, $geographicMapInterfaceArray, $tiledLayerArray, $startIndex) = @_;
        my $geographicMapInterface = undef;
        my $size = scalar(@{$geographicMapInterfaceArray});
        my $count = 0;
        for (my $index = $size + $startIndex; --$index >= $startIndex; ) {
            $geographicMapInterface = $geographicMapInterfaceArray->[$index];
            $tiledLayerArray->[$count++] = $geographicMapInterface->getAllBinaryTiledLayer();
        }
        return $tiledLayerArray;
}


sub move {
    my ($self, $geographicMapInterfaceArray, $dx, $dy) = @_;
        my $geographicMapInterface = undef;
        my $size = scalar(@{$geographicMapInterfaceArray});
        for (my $index = $size; --$index >= 0; ) {
            $geographicMapInterface = $geographicMapInterfaceArray->[$index];
            $geographicMapInterface->getAllBinaryTiledLayer()->moveDXY($dx, $dy);
        }
}


sub setPosition {
    my ($self, $geographicMapInterfaceArray, $x, $y) = @_;
        my $geographicMapInterface = undef;
        my $size = scalar(@{$geographicMapInterfaceArray});
        for (my $index = $size; --$index >= 0; ) {
            $geographicMapInterface = $geographicMapInterfaceArray->[$index];
            $geographicMapInterface->getAllBinaryTiledLayer()->setPosition($x, $y, $geographicMapInterface->getAllBinaryTiledLayer()->getZP());
        }
}

use org::allbinary::layer::Layer;
use org::allbinary::logic::communication::log::LogUtil;

1;

