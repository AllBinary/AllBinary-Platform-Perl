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

package org::allbinary::media::graphics::geography::map::racetrack::drop::RaceTrackRandomDropCellPositionGenerator;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::media::graphics::geography::map::racetrack::drop::RaceTrackDropCellPositionGenerator';

our $SINGLETON = 'org::allbinary::media::graphics::geography::map::racetrack::drop::RaceTrackRandomDropCellPositionGenerator'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{myRandomFactory} = 'org::allbinary::game::rand::MyRandomFactory'->getInstance();
    $self->{cellsPerRowOrColumn} = 3;
    $self->{totalCells} = $self->{cellsPerRowOrColumn} * $self->{cellsPerRowOrColumn};
    $self->{rowArray} = [0, 1, 2, 0, 1, 2, 0, 1, 2];
    $self->{columnArray} = [0, 0, 0, 1, 1, 1, 2, 2, 2];
    $self->{cellWidth} = 0;
    $self->{cellHeight} = 0;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::media::graphics::geography::map::racetrack::drop::RaceTrackRandomDropCellPositionGenerator::SINGLETON;
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
        $self->SUPER::update($allBinaryGameLayerManager, $geographicMapInterface);
        my $tiledLayer = $geographicMapInterface->getAllBinaryTiledLayer();
        $self->{cellWidth} = $tiledLayer->getCellWidth() / $self->{cellsPerRowOrColumn};
        $self->{cellHeight} = $tiledLayer->getCellHeight() / $self->{cellsPerRowOrColumn};
}


# throws Exception
sub drop {
    my ($self, $allBinaryLayerManager, $index) = @_;
        my $geographicMapCellPosition = $self->{list}->get($index);
        my $point = $geographicMapCellPosition->getPoint();
        my $randomCell = $self->{myRandomFactory}->getAbsoluteNextInt($self->{totalCells});
        my $row = $self->{rowArray}->[$randomCell];
        my $column = $self->{columnArray}->[$randomCell];
        my $x = $point->getX() + ($row * $self->{cellWidth});
        my $y = $point->getY() + ($column * $self->{cellHeight});
        my $pickedUpLayerInterfaceFactory = 'org::allbinary::game::layer::drop::DropLayerFactory'->getInstance()->getRandomInstance();
        my $tiledLayer = $self->{raceTrackGeographicMap}->getAllBinaryTiledLayer();
        my $pickupLayer = 'org::allbinary::game::layer::pickup::PickupLayerCircularStaticPool'->getInstance()->getInstanceXYZ($pickedUpLayerInterfaceFactory, $x, $y, $tiledLayer->getZP() + 3);
        $pickupLayer->setTiledLayer($tiledLayer);
        $allBinaryLayerManager->append($pickupLayer);
}

use org::allbinary::game::layer::pickup::PickedUpLayerInterfaceFactoryInterface;
use org::allbinary::game::layer::AllBinaryGameLayerManager;
use org::allbinary::game::layer::AllBinaryTiledLayer;
use org::allbinary::game::layer::drop::DropLayerFactory;
use org::allbinary::game::layer::pickup::PickupLayerCircularStaticPool;
use org::allbinary::game::layer::pickup::RaceTrackPickupLayer;
use org::allbinary::game::rand::MyRandomFactory;
use org::allbinary::graphics::GPoint;
use org::allbinary::layer::AllBinaryLayerManager;
use org::allbinary::media::graphics::geography::map::BasicGeographicMap;
use org::allbinary::media::graphics::geography::map::GeographicMapCellPosition;
use org::allbinary::media::graphics::geography::map::racetrack::drop::RaceTrackDropCellPositionGenerator;

1;

