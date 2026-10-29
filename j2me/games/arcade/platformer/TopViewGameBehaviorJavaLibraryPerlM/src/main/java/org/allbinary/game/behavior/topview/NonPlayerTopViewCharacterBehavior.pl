# 
# AllBinary Open License Version 1 
# Copyright (c) 2022 AllBinary 
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

package org::allbinary::game::behavior::topview::NonPlayerTopViewCharacterBehavior;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::behavior::topview::TopViewCharacterBehavior';


sub _init_fields {
    my ($self) = @_;
    $self->{geographicMapBehavior} = 'org::allbinary::media::graphics::geography::map::MultiGeographicMapBehavior'->new();
    $self->{CLIFF} = 'org::allbinary::game::terrain::BasicTerrainInfo'->new('org::allbinary::math::AngleFactory'->getInstance()->{DOWN});
}

sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
    return $self;
}


# throws Exception
sub terrainEvent {
    my ($self, $layer, $direction, $x, $y, $geographicMapInterfaceArray, $geographicMapCellTypeArray, $geographicMapCellPosition) = @_;
        my $maxColumns = $geographicMapInterfaceArray->[0]->getAllBinaryTiledLayer()->getColumns();
        if ($geographicMapCellPosition->getColumn() > 0 && $geographicMapCellPosition->getColumn() < $maxColumns) {
            my $nextTerrainGeographicMapCellPosition = $org::allbinary::media::graphics::geography::map::SimpleGeographicMapCellPositionFactory::NULL_GEOGRAPHIC_MAP_CELL_POSITION;
            my $geographicMapCellPositionFactory = $geographicMapInterfaceArray->[0]->getGeographicMapCellPositionFactory();
            if ($direction == 'org::allbinary::direction::DirectionFactory'->getInstance()->{LEFT}) {
                $nextTerrainGeographicMapCellPosition = $geographicMapCellPositionFactory->getAt($geographicMapCellPosition->getColumn() - 1, $geographicMapCellPosition->getRow());
            } elsif ($direction == 'org::allbinary::direction::DirectionFactory'->getInstance()->{RIGHT}) {
                $nextTerrainGeographicMapCellPosition = $geographicMapCellPositionFactory->getAt($geographicMapCellPosition->getColumn() + 1, $geographicMapCellPosition->getRow());
            }
            $self->{geographicMapBehavior}->getCellTypeAt($geographicMapInterfaceArray, $geographicMapCellTypeArray, $nextTerrainGeographicMapCellPosition);
            my $hasSolidBlock = $self->hasSolidBlock($geographicMapInterfaceArray, $geographicMapCellTypeArray);
            if (!$hasSolidBlock) {
                my $terrainEvent = 'org::allbinary::game::terrain::TerrainEventCircularStaticPool'->getInstance()->getNext($self->{CLIFF});
                'org::allbinary::game::terrain::TerrainEventHandler'->getInstance($layer)->fireEvent($terrainEvent);
            }
        }
}


sub terrainMove {
    my ($self, $layer, $geographicMapInterfaceArray, $x, $y) = @_;
        $layer->moveDXY($x, $y);
}

use org::allbinary::media::graphics::geography::map::MultiGeographicMapBehavior;
use org::allbinary::direction::Direction;
use org::allbinary::direction::DirectionFactory;
use org::allbinary::game::terrain::BasicTerrainInfo;
use org::allbinary::game::terrain::TerrainEvent;
use org::allbinary::game::terrain::TerrainEventCircularStaticPool;
use org::allbinary::game::terrain::TerrainEventHandler;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::math::AngleFactory;
use org::allbinary::media::graphics::geography::map::BasicGeographicMap;
use org::allbinary::media::graphics::geography::map::BasicGeographicMapCellPositionFactory;
use org::allbinary::media::graphics::geography::map::GeographicMapCellPosition;
use org::allbinary::media::graphics::geography::map::GeographicMapCellType;
use org::allbinary::media::graphics::geography::map::SimpleGeographicMapCellPositionFactory;
use org::allbinary::game::behavior::topview::TopViewCharacterBehavior;

1;

