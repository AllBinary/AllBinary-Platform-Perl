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

package org::allbinary::game::layer::pickup::RaceTrackPickupLayer;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::layer::pickup::PickupLayer';

our $NAME = "RaceTrackPickupLayer";

sub _init_fields {
    my ($self) = @_;
    $self->{viewPositionEventHandler} = 'org::allbinary::view::event::ViewPositionEventHandler'->getInstance();
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new($NAME, $org::allbinary::game::multiplayer::layer::RemoteInfo::REMOTE_INFO, 0, $org::allbinary::game::layer::pickup::CountedPickedUpLayerInterfaceFactory::NULL_COUNTED_PICKUP_LAYER_FACTORY, 'org::allbinary::animation::NullAnimationFactory'->getFactoryInstance()->getInstance(0), 'org::allbinary::graphics::Rectangle'->new('org::allbinary::graphics::PointFactory'->getInstance()->{ZERO_ZERO}, 0, 0), 'org::allbinary::game::view::TileLayerPositionIntoViewPosition'->new());
    $self->_init_fields();
        # super(...) made $self above
    return $self;
}


sub setTiledLayer {
    my ($self, $tiledLayer) = @_;
        my $viewPosition = $self->getViewPosition();
        $viewPosition->setTiledLayer($tiledLayer);
        $self->{viewPositionEventHandler}->addListener($self);
}


sub setDestroyed {
    my ($self, $destroyed) = @_;
        $self->SUPER::setDestroyed($destroyed);
        if ($self->isDestroyed()) {
            $self->{viewPositionEventHandler}->removeListener($self);
        }
}

use org::allbinary::animation::NullAnimationFactory;
use org::allbinary::game::identification::BasicGroupFactory;
use org::allbinary::game::layer::AllBinaryTiledLayer;
use org::allbinary::game::multiplayer::layer::RemoteInfo;
use org::allbinary::game::view::TileLayerPositionIntoViewPosition;
use org::allbinary::graphics::PointFactory;
use org::allbinary::graphics::Rectangle;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::view::ViewPosition;
use org::allbinary::view::event::ViewPositionEventHandler;
use org::allbinary::game::layer::pickup::PickupLayer;
use org::allbinary::game::layer::pickup::CountedPickedUpLayerInterfaceFactory;

1;

