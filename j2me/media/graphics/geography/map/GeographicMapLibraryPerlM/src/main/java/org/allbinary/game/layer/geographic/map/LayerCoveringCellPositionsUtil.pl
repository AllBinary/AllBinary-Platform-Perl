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

package org::allbinary::game::layer::geographic::map::LayerCoveringCellPositionsUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::game::layer::geographic::map::LayerCoveringCellPositionsUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{cellPositionsUtil} = 'org::allbinary::media::graphics::geography::map::CellPositionsUtil'->getInstance();
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::layer::geographic::map::LayerCoveringCellPositionsUtil::instance;
}


# throws Exception
sub getAllXY {
    my ($self, $geographicMapInterface, $layerInterface, $x, $y, $reusableList) = @_;
        my $topLeftGeographicMapCellPosition = $geographicMapInterface->getCellPositionAtXY($x, $y);
        return $self->getAll($geographicMapInterface, $topLeftGeographicMapCellPosition, $layerInterface, $reusableList);
}


# throws Exception
sub getAll {
    my ($self, $geographicMapInterface, $topLeftGeographicMapCellPosition, $layerInterface, $reusableList) = @_;
        $reusableList->clear();
        my $columns = $layerInterface->getWidth() / $geographicMapInterface->getAllBinaryTiledLayer()->getCellWidth();
        my $rows = $layerInterface->getHeight() / $geographicMapInterface->getAllBinaryTiledLayer()->getCellHeight();
        if ($columns == 0) {
            $columns = 1;
        }
        if ($rows == 0) {
            $rows = 1;
        }
        return $self->{cellPositionsUtil}->getAll($geographicMapInterface, $topLeftGeographicMapCellPosition, $columns, $rows, $reusableList);
}

use org::allbinary::util::BasicArrayList;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::media::graphics::geography::map::BasicGeographicMap;
use org::allbinary::media::graphics::geography::map::CellPositionsUtil;
use org::allbinary::media::graphics::geography::map::GeographicMapCellPosition;

1;

