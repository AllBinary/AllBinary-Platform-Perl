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

package org::allbinary::game::ag::layer::weapon::mine::MineCountedPickedUpLayerInterfaceFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::layer::pickup::CountedPickedUpLayerInterfaceFactory';

our $pickedUpLayerInterfaceFactoryInterface = $org::allbinary::game::layer::pickup::CountedPickedUpLayerInterfaceFactory::NULL_COUNTED_PICKUP_LAYER_FACTORY;

sub _init_fields {
    my ($self) = @_;
    $self->{weaponLayerCircularStaticPool} = 'org::allbinary::game::ag::layer::weapon::mine::MineLayerCircularStaticPool'->getInstance();
    $self->{weaponProperties} = 'org::allbinary::game::combat::weapon::WeaponProperties'->new(-1, -1, 0, 8000, ((int(10) + 32768) % 65536 - 32768));
    $self->{smallIntegerSingletonFactory} = 'org::allbinary::logic::math::SmallIntegerSingletonFactory'->getInstance();
}


# throws Exception
sub init {
    my ($class) = @_;
        $org::allbinary::game::ag::layer::weapon::mine::MineCountedPickedUpLayerInterfaceFactory::pickedUpLayerInterfaceFactoryInterface = 'org::allbinary::game::ag::layer::weapon::mine::MineCountedPickedUpLayerInterfaceFactory'->new();
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new('org::allbinary::game::layer::pickup::PickedUpLayerTypeFactory'->getInstance()->{MINE}, 'org::allbinary::game::layer::pickup::IconLayerFactory'->getInstance('org::allbinary::animation::FeaturedAnimationInterfaceFactoryInterfaceFactory'->getInstance()->get('org::allbinary::game::ag::layer::weapon::mine::MineWeaponResources'->getInstance()->{DROP_ICON_RESOURCE})->getInstance(0), 10, 10), 'org::allbinary::animation::FeaturedAnimationInterfaceFactoryInterfaceFactory'->getInstance()->get('org::allbinary::game::ag::layer::weapon::mine::MineWeaponResources'->getInstance()->{DROP_RESOURCE})->getInstance(0));
    $self->_init_fields();
        # super(...) made $self above
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::ag::layer::weapon::mine::MineCountedPickedUpLayerInterfaceFactory::pickedUpLayerInterfaceFactoryInterface;
}


sub getTotal {
    my ($self) = @_;
        return 3;
}


# throws Exception
sub getNextInstance {
    my ($self, $hashtable, $x, $y, $z) = @_;
        my $sourceLayerInterface = $hashtable->get($self->{smallIntegerSingletonFactory}->getAt(0));
        my $angle = $hashtable->get($self->{smallIntegerSingletonFactory}->getAt(1));
        my $scoreableInterface = $sourceLayerInterface;
        return $self->{weaponLayerCircularStaticPool}->getInstanceWeaponLayer($sourceLayerInterface, $x, $y, $z, int(int($angle)), 0, $self->{weaponProperties}, $scoreableInterface);
}

use org::allbinary::animation::FeaturedAnimationInterfaceFactoryInterfaceFactory;
use org::allbinary::game::combat::weapon::WeaponProperties;
use org::allbinary::game::layer::pickup::CountedPickedUpLayerInterfaceFactory;
use org::allbinary::game::layer::pickup::IconLayerFactory;
use org::allbinary::game::layer::pickup::PickedUpLayerInterfaceFactoryInterface;
use org::allbinary::game::layer::pickup::PickedUpLayerTypeFactory;
use org::allbinary::game::layer::weapon::WeaponLayerCircularPool;
use org::allbinary::game::score::ScoreableInterface;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::logic::math::SmallIntegerSingletonFactory;
use org::allbinary::util::ABHashtable;
use org::allbinary::game::ag::layer::weapon::mine::MineLayerCircularStaticPool;
use org::allbinary::game::ag::layer::weapon::mine::MineWeaponResources;

1;

