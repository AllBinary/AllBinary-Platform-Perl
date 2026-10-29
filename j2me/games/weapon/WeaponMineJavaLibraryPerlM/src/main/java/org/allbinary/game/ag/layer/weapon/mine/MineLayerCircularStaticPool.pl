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

package org::allbinary::game::ag::layer::weapon::mine::MineLayerCircularStaticPool;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $WEAPON_LAYER_CIRCULAR_STATIC_POOL = 'org::allbinary::game::layer::weapon::WeaponLayerCircularPool'->new();

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


# throws Exception
sub init {
    my ($class, $viewPositionFactoryInterface) = @_;
        'org::allbinary::game::ag::layer::weapon::mine::MineCountedPickedUpLayerInterfaceFactory'->init();
        $org::allbinary::game::ag::layer::weapon::mine::MineLayerCircularStaticPool::WEAPON_LAYER_CIRCULAR_STATIC_POOL->initAllBinaryLayerCircularPool('org::allbinary::game::ag::layer::weapon::mine::MineLayerFactory'->new($viewPositionFactoryInterface), 20);
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::ag::layer::weapon::mine::MineLayerCircularStaticPool::WEAPON_LAYER_CIRCULAR_STATIC_POOL;
}

use org::allbinary::game::layer::weapon::WeaponLayerCircularPool;
use org::allbinary::view::ViewPositionFactoryInterface;
use org::allbinary::game::ag::layer::weapon::mine::MineCountedPickedUpLayerInterfaceFactory;
use org::allbinary::game::ag::layer::weapon::mine::MineLayerFactory;

1;

