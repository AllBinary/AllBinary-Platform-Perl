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

package org::allbinary::game::ag::layer::pickup::FallingPickupLayer;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::layer::pickup::PickupLayer','org::allbinary::game::tick::TickableInterface';

our $NAME = "FallingPickupLayer";


sub new {
    my ($class, $remoteInfo) = @_;
    my $self = $class->SUPER::new($org::allbinary::game::ag::layer::pickup::FallingPickupLayer::NAME, $remoteInfo, 0, $org::allbinary::game::layer::pickup::CountedPickedUpLayerInterfaceFactory::NULL_COUNTED_PICKUP_LAYER_FACTORY, 'org::allbinary::animation::NullAnimationFactory'->getFactoryInstance()->getInstance(0), 'org::allbinary::graphics::Rectangle'->new('org::allbinary::graphics::PointFactory'->getInstance()->{ZERO_ZERO}, 0, 0), 'org::allbinary::view::ViewPosition'->getInstanceD());
        # super(...) made $self above
    return $self;
}


sub processTick {
    my ($self, $allBinaryLayerManager) = @_;
        $self->setPosition($self->{x}, $self->{y} + 1, $self->{z});
}


sub implmentsTickableInterface {
    my ($self) = @_;
        return 1;
}

use org::allbinary::animation::NullAnimationFactory;
use org::allbinary::game::layer::pickup::CountedPickedUpLayerInterfaceFactory;
use org::allbinary::game::layer::pickup::PickupLayer;
use org::allbinary::game::multiplayer::layer::RemoteInfo;
use org::allbinary::game::tick::TickableInterface;
use org::allbinary::graphics::PointFactory;
use org::allbinary::graphics::Rectangle;
use org::allbinary::layer::AllBinaryLayerManager;
use org::allbinary::view::ViewPosition;

1;

