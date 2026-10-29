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

package org::allbinary::media::graphics::geography::map::drop::AnyRandomDropCellPositionGenerator;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::media::graphics::geography::map::drop::BaseDropCellPositionGenerator';


sub _init_fields {
    my ($self) = @_;
    $self->{list} = 'org::allbinary::util::BasicArrayListD'->new();
    $self->{geographicMapInterface} = 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT};
}

sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
    return $self;
}


# throws Exception
sub update {
    my ($self, $allBinaryGameLayerManager, $geographicMapInterface) = @_;
        $self->{geographicMapInterface} = $geographicMapInterface;
        my $basicGeographicMapCellPositionFactory = $geographicMapInterface->getGeographicMapCellPositionFactory();
        my $randomFactory = 'org::allbinary::game::rand::MyRandomFactory'->getInstance();
        my $tiledLayer = $geographicMapInterface->getAllBinaryTiledLayer();
        my $total = $tiledLayer->getColumns() * $tiledLayer->getRows();
        my $randomColumn = 0;
        my $randomRow = 0;
        my $geographicMapCellPosition = undef;
        for (my $index = $total; --$index >= 0; ) {
            $randomColumn = $randomFactory->getAbsoluteNextInt($tiledLayer->getColumns());
            $randomRow = $randomFactory->getAbsoluteNextInt($tiledLayer->getRows());
            $geographicMapCellPosition = $basicGeographicMapCellPositionFactory->getAt($randomColumn, $randomRow);
            if ($self->isDropAllowedAt($geographicMapCellPosition)) {
                $self->{list}->add($geographicMapCellPosition);
            }
        }
}


# throws Exception
sub processTick {
    my ($self, $allBinaryLayerManager) = @_;
}

use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::game::layer::AllBinaryGameLayerManager;
use org::allbinary::game::layer::AllBinaryTiledLayer;
use org::allbinary::game::rand::MyRandomFactory;
use org::allbinary::layer::AllBinaryLayerManager;
use org::allbinary::logic::NullUtil;
use org::allbinary::media::graphics::geography::map::BasicGeographicMapCellPositionFactory;
use org::allbinary::media::graphics::geography::map::GeographicMapCellPosition;
use org::allbinary::media::graphics::geography::map::BasicGeographicMap;
use org::allbinary::media::graphics::geography::map::drop::BaseDropCellPositionGenerator;

1;

