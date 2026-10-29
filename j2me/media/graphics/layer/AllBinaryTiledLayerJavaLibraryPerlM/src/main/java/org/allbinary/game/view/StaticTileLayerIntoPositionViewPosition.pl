# 
# AllBinary Open License Version 1 
# Copyright (c) 2006 AllBinary 
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

package org::allbinary::game::view::StaticTileLayerIntoPositionViewPosition;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::view::ViewPosition';

our $tiledLayer = 'org::allbinary::layer::NullLayer'->getInstance();
our $layer = $org::allbinary::layer::AllBinaryLayer::NULL_ALLBINARY_LAYER;


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new(0, 0, 0);
        # super(...) made $self above
    return $self;
}


sub getX {
    my ($self) = @_;
        return $self->SUPER::getX() - $org::allbinary::game::view::StaticTileLayerIntoPositionViewPosition::tiledLayer->getXP();
}


sub getY {
    my ($self) = @_;
        return $self->SUPER::getY() - $org::allbinary::game::view::StaticTileLayerIntoPositionViewPosition::tiledLayer->getYP();
}


sub getZ {
    my ($self) = @_;
        return $self->SUPER::getZ() - $org::allbinary::game::view::StaticTileLayerIntoPositionViewPosition::tiledLayer->getZP();
}


sub setTiledLayer {
    my ($class, $tiledLayer) = @_;
        $org::allbinary::game::view::StaticTileLayerIntoPositionViewPosition::tiledLayer = $tiledLayer;
}

use org::allbinary::game::layer::AllBinaryTiledLayer;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::layer::Layer;
use org::allbinary::layer::NullLayer;
use org::allbinary::view::ViewPosition;

1;

