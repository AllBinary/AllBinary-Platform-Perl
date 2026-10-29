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

package org::allbinary::game::ag::layer::pickup::points::Points20kPickedUpLayerInterfaceFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::layer::pickup::PickedUpLayerInterfaceFactory','org::allbinary::game::layer::pickup::PickupProcessorInterface';

our $pickedUpLayerInterfaceFactoryInterface = $org::allbinary::game::layer::pickup::CountedPickedUpLayerInterfaceFactory::NULL_COUNTED_PICKUP_LAYER_FACTORY;

sub _init_fields {
    my ($self) = @_;
    $self->{pool} = 'org::allbinary::game::ag::layer::pickup::points::PointsLayerCircularStaticPool'->new('org::allbinary::game::ag::layer::pickup::points::PointsLayerFactory'->new('org::allbinary::game::configuration::GameConfigurationUtil'->getInstance()->getCompetitionValue() * 20000), 1);
}


# throws Exception
sub init {
    my ($class) = @_;
        $org::allbinary::game::ag::layer::pickup::points::Points20kPickedUpLayerInterfaceFactory::pickedUpLayerInterfaceFactoryInterface = 'org::allbinary::game::ag::layer::pickup::points::Points20kPickedUpLayerInterfaceFactory'->new();
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new('org::allbinary::game::layer::pickup::PickedUpLayerTypeFactory'->getInstance()->{POINTS}, 'org::allbinary::game::layer::pickup::IconLayerFactory'->getInstance('org::allbinary::animation::FeaturedAnimationInterfaceFactoryInterfaceFactory'->getInstance()->get('org::allbinary::game::ag::layer::pickup::points::PointsResources'->getInstance()->{RESOURCE_2})->getInstance(0), 10, 10), 'org::allbinary::animation::FeaturedAnimationInterfaceFactoryInterfaceFactory'->getInstance()->get('org::allbinary::game::ag::layer::pickup::points::PointsResources'->getInstance()->{RESOURCE_2})->getInstance(0));
    $self->_init_fields();
        # super(...) made $self above
    return $self;
}


sub getTotal {
    my ($self) = @_;
        return 1;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::ag::layer::pickup::points::Points20kPickedUpLayerInterfaceFactory::pickedUpLayerInterfaceFactoryInterface;
}


# throws Exception
sub process {
    my ($self, $sourceLayerInterface) = @_;
        $self->{pool}->visit($sourceLayerInterface);
}

use org::allbinary::animation::FeaturedAnimationInterfaceFactoryInterfaceFactory;
use org::allbinary::game::configuration::GameConfigurationUtil;
use org::allbinary::game::layer::pickup::CountedPickedUpLayerInterfaceFactory;
use org::allbinary::game::layer::pickup::IconLayerFactory;
use org::allbinary::game::layer::pickup::PickedUpLayerInterfaceFactory;
use org::allbinary::game::layer::pickup::PickedUpLayerInterfaceFactoryInterface;
use org::allbinary::game::layer::pickup::PickedUpLayerTypeFactory;
use org::allbinary::game::layer::pickup::PickupProcessorInterface;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::game::ag::layer::pickup::points::PointsLayerCircularStaticPool;
use org::allbinary::game::ag::layer::pickup::points::PointsLayerFactory;
use org::allbinary::game::ag::layer::pickup::points::PointsResources;

1;

