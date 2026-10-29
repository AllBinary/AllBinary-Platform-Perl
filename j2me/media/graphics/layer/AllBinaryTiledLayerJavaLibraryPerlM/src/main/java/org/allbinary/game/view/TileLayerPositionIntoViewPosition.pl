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

package org::allbinary::game::view::TileLayerPositionIntoViewPosition;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::view::ViewPosition';


sub _init_fields {
    my ($self) = @_;
    $self->{tiledLayer} = 'org::allbinary::layer::NullLayer'->getInstance();
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new(0, 0, 0);
    $self->_init_fields();
        # super(...) made $self above
    return $self;
}


sub getX {
    my ($self) = @_;
        return $self->SUPER::getX() - $self->{tiledLayer}->getXP();
}


sub getY {
    my ($self) = @_;
        return $self->SUPER::getY() - $self->{tiledLayer}->getYP();
}


sub getZ {
    my ($self) = @_;
        return $self->SUPER::getZ() - $self->{tiledLayer}->getZP();
}


sub setTiledLayer {
    my ($self, $tiledLayer) = @_;
        $self->{tiledLayer} = $tiledLayer;
}

use org::allbinary::game::layer::AllBinaryTiledLayer;
use org::allbinary::layer::Layer;
use org::allbinary::layer::NullLayer;
use org::allbinary::view::ViewPosition;

1;

