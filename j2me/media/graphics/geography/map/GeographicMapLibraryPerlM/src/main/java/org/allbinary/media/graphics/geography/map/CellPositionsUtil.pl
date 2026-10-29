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

package org::allbinary::media::graphics::geography::map::CellPositionsUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::media::graphics::geography::map::CellPositionsUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{reusableSingleThreadedSurroundingList} = 'org::allbinary::util::BasicArrayListS'->new(8);
    $self->{surroundArray} = [[-1, -1], [0, -1], [1, -1], [-1, 1], [0, 1], [1, 1], [1, 0], [-1, 0]];
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::media::graphics::geography::map::CellPositionsUtil::instance;
}


# throws Exception
sub getAll {
    my ($self, $geographicMapInterface, $topRightGeographicMapCellPosition, $columns, $rows, $reusableList) = @_;
        $reusableList->clear();
        my $geographicMapCellPositionFactory = $geographicMapInterface->getGeographicMapCellPositionFactory();
        my $lastColumn = $topRightGeographicMapCellPosition->getColumn() + $columns;
        my $lastRow = $topRightGeographicMapCellPosition->getRow() + $rows;
        if (($columns > 1 && $lastColumn > $geographicMapInterface->getAllBinaryTiledLayer()->getColumns()) || ($rows > 1 && $lastRow > $geographicMapInterface->getAllBinaryTiledLayer()->getRows())) {
            return $reusableList;
        }
        for (my $rowIndex = 0; $rowIndex < $rows; $rowIndex++) {
            for (my $columnIndex = 0; $columnIndex < $columns; $columnIndex++) {
                my $geographicMapCellPosition = $geographicMapCellPositionFactory->getAt($topRightGeographicMapCellPosition->getColumn() + $columnIndex, $topRightGeographicMapCellPosition->getRow() + $rowIndex);
                $reusableList->add($geographicMapCellPosition);
            }
        }
        return $reusableList;
}


# throws Exception
sub getAllSurrounding {
    my ($self, $geographicMapInterface, $occupyList, $reusableList) = @_;
        $reusableList->clear();
        for (my $index = $occupyList->size() - 1; $index >= 0; $index--) {
            my $layerGeographicMapCellPosition = $occupyList->get($index);
            my $surroundingGeographicMapCellPositionList = $self->getAllSurroundingAt($geographicMapInterface, $layerGeographicMapCellPosition, $self->{reusableSingleThreadedSurroundingList});
            for (my $index2 = $surroundingGeographicMapCellPositionList->size() - 1; $index2 >= 0; $index2--) {
                my $geographicMapCellPosition = $surroundingGeographicMapCellPositionList->get($index2);
                if (!$reusableList->contains($geographicMapCellPosition) && !$occupyList->contains($geographicMapCellPosition)) {
                    $reusableList->add($geographicMapCellPosition);
                }
            }
        }
        return $reusableList;
}


# throws Exception
sub getAllSurroundingAt {
    my ($self, $geographicMapInterface, $layerGeographicMapCellPosition, $reusableSurroundingList) = @_;
        $reusableSurroundingList->clear();
        my $geographicMapCellPositionFactory = $geographicMapInterface->getGeographicMapCellPositionFactory();
        my $tiledLayer = $geographicMapInterface->getAllBinaryTiledLayer();
        my $row = 0;
        my $column = 0;
        for (my $index = 0; $index < 8; $index++) {
            $column = $layerGeographicMapCellPosition->getColumn() + $self->{surroundArray}->[$index]->[0];
            $row = $layerGeographicMapCellPosition->getRow() + $self->{surroundArray}->[$index]->[1];
            if ($tiledLayer->isOnTileLayer($column, $row)) {
                my $geographicMapCellPosition = $geographicMapCellPositionFactory->getAt($column, $row);
                $reusableSurroundingList->add($geographicMapCellPosition);
            }
        }
        return $reusableSurroundingList;
}

use org::allbinary::util::BasicArrayList;
use org::allbinary::game::layer::AllBinaryTiledLayer;
use org::allbinary::util::BasicArrayListS;

1;

