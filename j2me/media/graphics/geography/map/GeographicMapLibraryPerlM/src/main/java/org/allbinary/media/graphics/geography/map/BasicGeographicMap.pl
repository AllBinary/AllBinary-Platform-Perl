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

package org::allbinary::media::graphics::geography::map::BasicGeographicMap;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::media::graphics::geography::map::SimpleGeographicMap','org::allbinary::media::graphics::geography::map::GeographicMapInterface';

our $NULL_BASIC_GEOGRAPHIC_MAP_ARRAY = [(undef) x (0)];

sub _init_fields {
    my ($self) = @_;
    $self->{mathUtil} = 'org::allbinary::logic::math::MathUtil'->getInstance();
    $self->{geographicMapCellPositionFactory} = undef;
    $self->{geographicMapCellPositionFactoryInterface} = undef;
    $self->{geographicMapCellTypeFactory} = undef;
}


sub new {
    my ($class, $id, $name, $cellTypeIdToGeographicMapCellType, $tiledLayer, $foregroundBasicColor, $backgroundBasicColor, $geographicMapCellPositionFactoryInterface, $geographicMapCellPositionBaseFactory, $geographicMapCellTypeFactory) = @_;
    my $self = $class->SUPER::new($id, $name, $cellTypeIdToGeographicMapCellType, $tiledLayer, $foregroundBasicColor, $backgroundBasicColor);
    $self->_init_fields();
        # super(...) made $self above
        $self->{geographicMapCellPositionFactoryInterface} = $geographicMapCellPositionFactoryInterface;
        $self->{geographicMapCellPositionFactory} = $geographicMapCellPositionBaseFactory->getInstance($self);
        $self->{geographicMapCellTypeFactory} = $geographicMapCellTypeFactory;
    return $self;
}


# throws Exception
sub getCellPosition {
    my ($self, $direction, $oldGeographicMapCellPosition) = @_;
        for my $switch_value ($direction) {
            if ($switch_value == 0) {
                return $self->{geographicMapCellPositionFactory}->getAt($oldGeographicMapCellPosition->getColumn() - 1, $oldGeographicMapCellPosition->getRow());
            }
            if ($switch_value == 1) {
                return $self->{geographicMapCellPositionFactory}->getAt($oldGeographicMapCellPosition->getColumn() + 1, $oldGeographicMapCellPosition->getRow());
            }
            if ($switch_value == 2) {
                return $self->{geographicMapCellPositionFactory}->getAt($oldGeographicMapCellPosition->getColumn(), $oldGeographicMapCellPosition->getRow() - 1);
            }
            if ($switch_value == 3) {
                return $self->{geographicMapCellPositionFactory}->getAt($oldGeographicMapCellPosition->getColumn(), $oldGeographicMapCellPosition->getRow() + 1);
            }
            {
                die ("Only Four Directions");
            }
        }
}


# throws Exception
sub getCellPositionNoThrow {
    my ($self, $direction, $oldGeographicMapCellPosition) = @_;
        for my $switch_value ($direction) {
            if ($switch_value == 0) {
                if ($oldGeographicMapCellPosition->getColumn() - 1 >= 0) {
                    return $self->{geographicMapCellPositionFactory}->getAt($oldGeographicMapCellPosition->getColumn() - 1, $oldGeographicMapCellPosition->getRow());
                } else {
                    return $org::allbinary::media::graphics::geography::map::SimpleGeographicMapCellPositionFactory::NULL_GEOGRAPHIC_MAP_CELL_POSITION;
                }
                # Java falls through to the next case
            }
            if ($switch_value == 1) {
                if ($oldGeographicMapCellPosition->getColumn() + 1 < $self->getAllBinaryTiledLayer()->getColumns()) {
                    return $self->{geographicMapCellPositionFactory}->getAt($oldGeographicMapCellPosition->getColumn() + 1, $oldGeographicMapCellPosition->getRow());
                } else {
                    return $org::allbinary::media::graphics::geography::map::SimpleGeographicMapCellPositionFactory::NULL_GEOGRAPHIC_MAP_CELL_POSITION;
                }
                # Java falls through to the next case
            }
            if ($switch_value == 2) {
                if ($oldGeographicMapCellPosition->getRow() - 1 >= 0) {
                    return $self->{geographicMapCellPositionFactory}->getAt($oldGeographicMapCellPosition->getColumn(), $oldGeographicMapCellPosition->getRow() - 1);
                } else {
                    return $org::allbinary::media::graphics::geography::map::SimpleGeographicMapCellPositionFactory::NULL_GEOGRAPHIC_MAP_CELL_POSITION;
                }
                # Java falls through to the next case
            }
            if ($switch_value == 3) {
                if ($oldGeographicMapCellPosition->getRow() + 1 < $self->getAllBinaryTiledLayer()->getRows()) {
                    return $self->{geographicMapCellPositionFactory}->getAt($oldGeographicMapCellPosition->getColumn(), $oldGeographicMapCellPosition->getRow() + 1);
                } else {
                    return $org::allbinary::media::graphics::geography::map::SimpleGeographicMapCellPositionFactory::NULL_GEOGRAPHIC_MAP_CELL_POSITION;
                }
                # Java falls through to the next case
            }
            {
                return $org::allbinary::media::graphics::geography::map::SimpleGeographicMapCellPositionFactory::NULL_GEOGRAPHIC_MAP_CELL_POSITION;
            }
        }
}


# throws Exception
sub isOfFourDirections {
    my ($self, $oldGeographicMapCellPosition, $newGeographicMapCellPosition) = @_;
        for (my $index = 0; $index < 4; $index++) {
            if ($newGeographicMapCellPosition == $self->getCellPositionNoThrow($index, $oldGeographicMapCellPosition)) {
                return 1;
            }
        }
        return 0;
}


# throws Exception
sub getCellPositionAtXY {
    my ($self, $x, $y) = @_;
        my $allBinaryTiledLayer = $self->getAllBinaryTiledLayer();
        my $i_column = $self->{mathUtil}->abs($x / $allBinaryTiledLayer->getCellHeight());
        my $i_row = $self->{mathUtil}->abs($y / $allBinaryTiledLayer->getCellWidth());
        return $self->{geographicMapCellPositionFactory}->getAt($i_column, $i_row);
}


sub getCellPositionAtXYNoThrow {
    my ($self, $x, $y) = @_;
        my $allBinaryTiledLayer = $self->getAllBinaryTiledLayer();
        my $i_column = $self->{mathUtil}->abs($x / $allBinaryTiledLayer->getCellHeight());
        my $i_row = $self->{mathUtil}->abs($y / $allBinaryTiledLayer->getCellWidth());
        if ($allBinaryTiledLayer->getColumns() > $i_column && $allBinaryTiledLayer->getRows() > $i_row) {
            try {
                return $self->{geographicMapCellPositionFactory}->getAt($i_column, $i_row);
            } catch ($e) {
                return $org::allbinary::media::graphics::geography::map::SimpleGeographicMapCellPositionFactory::NULL_GEOGRAPHIC_MAP_CELL_POSITION;
            }
        } else {
            return $org::allbinary::media::graphics::geography::map::SimpleGeographicMapCellPositionFactory::NULL_GEOGRAPHIC_MAP_CELL_POSITION;
        }
}


# throws Exception
sub isOnMap {
    my ($self, $geographicMapCellPosition) = @_;
        my $allBinaryTiledLayer = $self->getAllBinaryTiledLayer();
        my $i_column = $geographicMapCellPosition->getColumn();
        my $i_row = $geographicMapCellPosition->getRow();
        if ($allBinaryTiledLayer->getColumns() > $i_column && $allBinaryTiledLayer->getRows() > $i_row) {
            return 1;
        } else {
            return 0;
        }
}


# throws Exception
sub getCellPositionAtNoThrow {
    my ($self, $x, $y, $x2, $y2, $geographicMapCellPositionList) = @_;
        $geographicMapCellPositionList->clear();
        my $allBinaryTiledLayer = $self->getAllBinaryTiledLayer();
        my $i_columnMin = $self->{mathUtil}->abs($x / $allBinaryTiledLayer->getCellHeight());
        my $i_rowMin = $self->{mathUtil}->abs($y / $allBinaryTiledLayer->getCellWidth());
        my $i_columnMax = $self->{mathUtil}->abs($x2 / $allBinaryTiledLayer->getCellHeight()) + 1;
        my $i_rowMax = $self->{mathUtil}->abs($y2 / $allBinaryTiledLayer->getCellWidth()) + 1;
        for (my $columnIndex = $i_columnMin; $columnIndex < $i_columnMax; $columnIndex++) {
            for (my $rowIndex = $i_rowMin; $rowIndex < $i_rowMax; $rowIndex++) {
                if ($allBinaryTiledLayer->getColumns() > $columnIndex && $allBinaryTiledLayer->getRows() > $rowIndex) {
                    $geographicMapCellPositionList->add($self->{geographicMapCellPositionFactory}->getAt($columnIndex, $rowIndex));
                }
            }
        }
        return $geographicMapCellPositionList;
}


# throws Exception
sub getCellPositionsAt {
    my ($self, $layer, $currentCellPositionArray, $cellPositionArray) = @_;
        my $hasChanged = 0;
        my $size = scalar(@{$cellPositionArray});
        my $size2 = scalar(@{$cellPositionArray->[0]});
        my $xPortion = $layer->getXP() / ($size - 1);
        my $yPortion = $layer->getYP() / ($size - 1);
        for (my $index = 0; $index < $size; $index++) {
            for (my $index2 = 0; $index2 < $size2; $index2++) {
                my $x = $xPortion * $index;
                my $y = $yPortion * $index;
                $cellPositionArray->[$index]->[$index2] = $self->getCellPositionAtXY($x, $y);
                if ($currentCellPositionArray->[$index]->[$index2] != $cellPositionArray->[$index]->[$index2]) {
                    $hasChanged = 1;
                }
            }
        }
        return $hasChanged;
}


# throws Exception
sub getCellTypeAtXY {
    my ($self, $x, $y) = @_;
        my $cellPosition = $self->getCellPositionAtXY($x, $y);
        return $self->getCellTypeAt($cellPosition);
}


sub getGeographicMapCellPositionFactory {
    my ($self) = @_;
        return $self->{geographicMapCellPositionFactory};
}


sub getGeographicMapCellPositionFactoryInterface {
    my ($self) = @_;
        return $self->{geographicMapCellPositionFactoryInterface};
}


sub getGeographicMapCellTypeFactory {
    my ($self) = @_;
        return $self->{geographicMapCellTypeFactory};
}

use org::allbinary::game::layer::AllBinaryTiledLayer;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::layer::Layer;
use org::allbinary::logic::math::MathUtil;
use org::allbinary::util::BasicArrayList;
use org::allbinary::media::graphics::geography::map::SimpleGeographicMap;
use org::allbinary::media::graphics::geography::map::GeographicMapInterface;
use org::allbinary::media::graphics::geography::map::SimpleGeographicMapCellPositionFactory;

1;

