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

package org::allbinary::game::ag::layer::weapon::mine::MineLayer;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::layer::weapon::SimpleWeaponLayer';

our $NAME = "MineLayer";

sub _init_fields {
    my ($self) = @_;
    $self->{viewPositionEventHandler} = 'org::allbinary::view::event::ViewPositionEventHandler'->getInstance();
}


sub new {
    my ($class, $viewPosition) = @_;
    my $self = $class->SUPER::new($org::allbinary::game::ag::layer::weapon::mine::MineLayer::NAME, $org::allbinary::game::multiplayer::layer::RemoteInfo::REMOTE_INFO, -1, 'org::allbinary::physics::movement::NoMovementFactory'->getInstance()->getMovmentInstance(), 'org::allbinary::animation::FeaturedAnimationInterfaceFactoryInterfaceFactory'->getInstance()->get('org::allbinary::game::ag::layer::weapon::mine::MineWeaponResources'->getInstance()->{RESOURCE})->getInstance(0), 'org::allbinary::game::layer::weapon::SimpleWeaponLayer'->createDestroyed(), 'org::allbinary::graphics::Rectangle'->new('org::allbinary::graphics::PointFactory'->getInstance()->{ZERO_ZERO}, 10, 10), $viewPosition);
    $self->_init_fields();
        # super(...) made $self above
    return $self;
}


sub initXYZ {
    my ($self, $x, $y, $z) = @_;
        $self->setPosition($x + 5, $y + 5, $z);
        $self->{viewPositionEventHandler}->addListener($self);
        'org::allbinary::media::audio::SecondaryPlayerQueueFactory'->getInstance()->add('org::allbinary::ag::weapon::media::audio::DropWeaponSound'->getInstance());
}


sub damage {
    my ($self, $damage, $damageType) = @_;
        $self->{totalDamage} = $self->getInitDamage() + 1;
}


sub getDamage {
    my ($self, $damageType) = @_;
        $self->SUPER::getDamage($damageType);
        return $self->getInitDamage();
}


sub setDestroyed {
    my ($self, $destroyed) = @_;
        $self->SUPER::setDestroyed($destroyed);
        if ($self->isDestroyed()) {
            $self->{viewPositionEventHandler}->removeListener($self);
        }
}

use org::allbinary::ag::weapon::media::audio::DropWeaponSound;
use org::allbinary::animation::FeaturedAnimationInterfaceFactoryInterfaceFactory;
use org::allbinary::game::layer::weapon::SimpleWeaponLayer;
use org::allbinary::game::multiplayer::layer::RemoteInfo;
use org::allbinary::graphics::PointFactory;
use org::allbinary::graphics::Rectangle;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::media::audio::SecondaryPlayerQueueFactory;
use org::allbinary::physics::movement::NoMovementFactory;
use org::allbinary::view::ViewPositionBase;
use org::allbinary::view::event::ViewPositionEventHandler;
use org::allbinary::game::ag::layer::weapon::mine::MineWeaponResources;

1;

