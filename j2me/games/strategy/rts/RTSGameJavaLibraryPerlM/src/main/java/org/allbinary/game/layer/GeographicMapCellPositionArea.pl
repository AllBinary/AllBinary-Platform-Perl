# 
# AllBinary Open License Version 1 
# Copyright (c) 2003 AllBinary 
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

package org::allbinary::game::layer::GeographicMapCellPositionArea;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::layer::GeographicMapCellPositionAreaBase';


sub _init_fields {
    my ($self) = @_;
    $self->{cellPositionsUtil} = 'org::allbinary::media::graphics::geography::map::CellPositionsUtil'->getInstance();
    $self->{layerCoveringCellPositionsUtil} = 'org::allbinary::game::layer::geographic::map::LayerCoveringCellPositionsUtil'->getInstance();
    $self->{reusableOccupyingGeographicMapCellPositionList} = 'org::allbinary::util::BasicArrayListS'->new(4);
    $self->{reusableSurroundingGeographicMapCellPositionList} = 'org::allbinary::util::BasicArrayListS'->new(12);
    $self->{surroundingCircularIndexUtil} = 'org::allbinary::util::CircularIndexUtil'->createInstance(0);
    $self->{layerInterface} = undef;
    $self->{LIST} = 'org::allbinary::util::BasicArrayListUtil'->getInstance()->getImmutableInstance();
    $self->{occupyingGeographicMapCellPositionList} = $self->{LIST};
    $self->{surroundingGeographicMapCellPositionList} = $self->{LIST};
}


sub new {
    my ($class, $layerInterface) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{layerInterface} = $layerInterface;
    return $self;
}


# throws Exception
sub update {
    my ($self, $geographicMapInterface) = @_;
        $self->{occupyingGeographicMapCellPositionList} = $self->{layerCoveringCellPositionsUtil}->getAllXY($geographicMapInterface, $self->{layerInterface}, $self->{layerInterface}->getXP(), $self->{layerInterface}->getYP(), $self->{reusableOccupyingGeographicMapCellPositionList});
        $self->{surroundingGeographicMapCellPositionList} = $self->{cellPositionsUtil}->getAllSurrounding($geographicMapInterface, $self->{occupyingGeographicMapCellPositionList}, $self->{reusableSurroundingGeographicMapCellPositionList});
        $self->{surroundingCircularIndexUtil}->setSize($self->{surroundingGeographicMapCellPositionList}->size());
}


sub getOccupyingGeographicMapCellPositionList {
    my ($self) = @_;
        return $self->{occupyingGeographicMapCellPositionList};
}


sub getSurroundingGeographicMapCellPositionList {
    my ($self) = @_;
        return $self->{surroundingGeographicMapCellPositionList};
}


sub getNextSurroundingGeographicMapCellPosition {
    my ($self) = @_;
        my $geographicMapCellPosition = $self->{surroundingGeographicMapCellPositionList}->get($self->{surroundingCircularIndexUtil}->getIndex());
        $self->{surroundingCircularIndexUtil}->next();
        return $geographicMapCellPosition;
}

use org::allbinary::util::BasicArrayList;
use org::allbinary::util::CircularIndexUtil;
use org::allbinary::game::layer::geographic::map::LayerCoveringCellPositionsUtil;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::media::graphics::geography::map::BasicGeographicMap;
use org::allbinary::media::graphics::geography::map::CellPositionsUtil;
use org::allbinary::media::graphics::geography::map::GeographicMapCellPosition;
use org::allbinary::util::BasicArrayListS;
use org::allbinary::util::BasicArrayListUtil;
use org::allbinary::game::layer::GeographicMapCellPositionAreaBase;

1;

