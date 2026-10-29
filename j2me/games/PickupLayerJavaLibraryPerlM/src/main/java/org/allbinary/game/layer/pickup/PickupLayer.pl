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

package org::allbinary::game::layer::pickup::PickupLayer;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::multiplayer::layer::MultiPlayerGameLayer','org::allbinary::game::layer::pickup::PickedUpLayerInterface','org::allbinary::game::layer::pickup::PickupableInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{pickedUpLayerInterfaceFactoryInterface} = $org::allbinary::game::layer::pickup::CountedPickedUpLayerInterfaceFactory::NULL_COUNTED_PICKUP_LAYER_FACTORY;
    $self->{destroyed} = 0;
    $self->{animationInterface} = 'org::allbinary::animation::NullAnimationFactory'->getFactoryInstance()->getInstance(0);
}


sub new {
    my ($class, $name, $remoteInfo, $total, $pickedUpLayerInterfaceFactoryInterface, $animationInterface, $rectangle, $viewPosition) = @_;
    my $self = $class->SUPER::new($remoteInfo, 'org::allbinary::game::identification::BasicGroupFactory'->getInstance()->{NONE_ARRAY}, $name, $rectangle, $viewPosition);
    $self->_init_fields();
        # super(...) made $self above
        $self->setCollidableInferface('org::allbinary::game::collision::CollidableAlwaysPickupNeverCollideBehaviorFactory'->getInstance()->createBehavior());
        $self->setLayerWidth(10);
        $self->setLayerHeight(10);
        $self->init($pickedUpLayerInterfaceFactoryInterface, $animationInterface);
    return $self;
}


sub init {
    my ($self, $pickedUpLayerInterfaceFactoryInterface, $animationInterface) = @_;
        $self->{pickedUpLayerInterfaceFactoryInterface} = $pickedUpLayerInterfaceFactoryInterface;
        $self->{animationInterface} = $animationInterface;
        $self->setDestroyed(0);
}


sub initXYZ {
    my ($self, $x, $y, $z) = @_;
        $self->setPosition($x, $y, $z);
}


sub paint {
    my ($self, $graphics) = @_;
        my $viewPosition = $self->getViewPosition();
        my $viewX = $viewPosition->getX();
        my $viewY = $viewPosition->getY();
        $self->{animationInterface}->paintXY($graphics, $viewX, $viewY);
}


sub paintThreed {
    my ($self, $graphics) = @_;
        my $viewPosition = $self->getViewPosition();
        my $viewX = $viewPosition->getX();
        my $viewY = $viewPosition->getY();
        $self->{animationInterface}->paintThreedXYZ($graphics, $viewX, $viewY, 3);
}


sub getPickedUpLayerInterfaceFactoryInterface {
    my ($self) = @_;
        return $self->{pickedUpLayerInterfaceFactoryInterface};
}


sub setPickedUp {
    my ($self) = @_;
        $self->setDestroyed(1);
}


sub isDestroyed {
    my ($self) = @_;
        return $self->{destroyed};
}


sub setDestroyed {
    my ($self, $destroyed) = @_;
        $self->{destroyed} = $destroyed;
        if ($self->isDestroyed()) {
            'org::allbinary::game::combat::destroy::DestroyedLayerProcessor'->getInstance()->add($self);
        }
}


sub damage {
    my ($self, $damage, $damageType) = @_;
}


sub getDamage {
    my ($self, $damageType) = @_;
        return 0;
}


# throws Exception
sub set {
    my ($self, $gl) = @_;
        my $openGLSurfaceChangedInterface = $self->{animationInterface};
        $openGLSurfaceChangedInterface->set($gl);
}

# use javax::microedition::khronos::opengles::GL;
# use javax::microedition::lcdui::Graphics;
use org::allbinary::animation::Animation;
use org::allbinary::animation::NullAnimationFactory;
use org::allbinary::game::collision::CollidableAlwaysPickupNeverCollideBehaviorFactory;
use org::allbinary::game::combat::destroy::DestroyedLayerProcessor;
use org::allbinary::game::identification::BasicGroupFactory;
use org::allbinary::game::multiplayer::layer::MultiPlayerGameLayer;
use org::allbinary::game::multiplayer::layer::RemoteInfo;
use org::allbinary::graphics::Rectangle;
use org::allbinary::image::opengles::OpenGLSurfaceChangedInterface;
use org::allbinary::view::ViewPositionBase;
use org::allbinary::game::layer::pickup::PickedUpLayerInterface;
use org::allbinary::game::layer::pickup::PickupableInterface;
use org::allbinary::game::layer::pickup::CountedPickedUpLayerInterfaceFactory;

1;

