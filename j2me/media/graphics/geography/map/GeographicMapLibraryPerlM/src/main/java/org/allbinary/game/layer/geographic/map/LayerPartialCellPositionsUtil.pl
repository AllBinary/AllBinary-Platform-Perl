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

package org::allbinary::game::layer::geographic::map::LayerPartialCellPositionsUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::game::layer::geographic::map::LayerPartialCellPositionsUtil'->new();

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


# throws Exception
sub getAll {
    my ($self, $geographicMapInterface, $layerInterface, $reusableList) = @_;
        $reusableList->clear();
        my $topLeftGeographicMapCellPosition = $geographicMapInterface->getCellPositionAtXYNoThrow($layerInterface->getXP(), $layerInterface->getYP());
        my $topRightGeographicMapCellPosition = $geographicMapInterface->getCellPositionAtXYNoThrow($layerInterface->getXP() + $layerInterface->getWidth(), $layerInterface->getYP());
        my $bottomLeftGeographicMapCellPosition = $geographicMapInterface->getCellPositionAtXYNoThrow($layerInterface->getXP(), $layerInterface->getYP() + $layerInterface->getHeight());
        my $bottomRightGeographicMapCellPosition = $geographicMapInterface->getCellPositionAtXYNoThrow($layerInterface->getXP() + $layerInterface->getWidth(), $layerInterface->getYP() + $layerInterface->getHeight());
        if ($topLeftGeographicMapCellPosition != $org::allbinary::media::graphics::geography::map::SimpleGeographicMapCellPositionFactory::NULL_GEOGRAPHIC_MAP_CELL_POSITION) {
            $reusableList->add($topLeftGeographicMapCellPosition);
        }
        if ($topRightGeographicMapCellPosition != $org::allbinary::media::graphics::geography::map::SimpleGeographicMapCellPositionFactory::NULL_GEOGRAPHIC_MAP_CELL_POSITION && $topLeftGeographicMapCellPosition != $topRightGeographicMapCellPosition) {
            $reusableList->add($topRightGeographicMapCellPosition);
        }
        if ($bottomLeftGeographicMapCellPosition != $org::allbinary::media::graphics::geography::map::SimpleGeographicMapCellPositionFactory::NULL_GEOGRAPHIC_MAP_CELL_POSITION && !$reusableList->contains($bottomLeftGeographicMapCellPosition)) {
            $reusableList->add($bottomLeftGeographicMapCellPosition);
        }
        if ($bottomRightGeographicMapCellPosition != $org::allbinary::media::graphics::geography::map::SimpleGeographicMapCellPositionFactory::NULL_GEOGRAPHIC_MAP_CELL_POSITION && !$reusableList->contains($bottomRightGeographicMapCellPosition)) {
            $reusableList->add($bottomRightGeographicMapCellPosition);
        }
        return $reusableList;
}


# throws Exception
sub getAllDXY {
    my ($self, $geographicMapInterface, $layerInterface, $dx, $dy, $reusableList) = @_;
        $reusableList->clear();
        my $topLeftGeographicMapCellPosition = $geographicMapInterface->getCellPositionAtXYNoThrow($layerInterface->getXP() + $dx, $layerInterface->getYP() + $dy);
        my $topRightGeographicMapCellPosition = $geographicMapInterface->getCellPositionAtXYNoThrow($layerInterface->getXP() + $layerInterface->getWidth() + $dx, $layerInterface->getYP() + $dy);
        my $bottomLeftGeographicMapCellPosition = $geographicMapInterface->getCellPositionAtXYNoThrow($layerInterface->getXP() + $dx, $layerInterface->getYP() + $layerInterface->getHeight() + $dy);
        my $bottomRightGeographicMapCellPosition = $geographicMapInterface->getCellPositionAtXYNoThrow($layerInterface->getXP() + $layerInterface->getWidth() + $dx, $layerInterface->getYP() + $layerInterface->getHeight() + $dy);
        if ($topLeftGeographicMapCellPosition != $org::allbinary::media::graphics::geography::map::SimpleGeographicMapCellPositionFactory::NULL_GEOGRAPHIC_MAP_CELL_POSITION) {
            $reusableList->add($topLeftGeographicMapCellPosition);
        }
        if ($topRightGeographicMapCellPosition != $org::allbinary::media::graphics::geography::map::SimpleGeographicMapCellPositionFactory::NULL_GEOGRAPHIC_MAP_CELL_POSITION && $topLeftGeographicMapCellPosition != $topRightGeographicMapCellPosition) {
            $reusableList->add($topRightGeographicMapCellPosition);
        }
        if ($bottomLeftGeographicMapCellPosition != $org::allbinary::media::graphics::geography::map::SimpleGeographicMapCellPositionFactory::NULL_GEOGRAPHIC_MAP_CELL_POSITION && !$reusableList->contains($bottomLeftGeographicMapCellPosition)) {
            $reusableList->add($bottomLeftGeographicMapCellPosition);
        }
        if ($bottomRightGeographicMapCellPosition != $org::allbinary::media::graphics::geography::map::SimpleGeographicMapCellPositionFactory::NULL_GEOGRAPHIC_MAP_CELL_POSITION && !$reusableList->contains($bottomRightGeographicMapCellPosition)) {
            $reusableList->add($bottomRightGeographicMapCellPosition);
        }
        return $reusableList;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::layer::geographic::map::LayerPartialCellPositionsUtil::instance;
}

use org::allbinary::util::BasicArrayList;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::media::graphics::geography::map::BasicGeographicMap;
use org::allbinary::media::graphics::geography::map::GeographicMapCellPosition;
use org::allbinary::media::graphics::geography::map::SimpleGeographicMapCellPositionFactory;

1;

