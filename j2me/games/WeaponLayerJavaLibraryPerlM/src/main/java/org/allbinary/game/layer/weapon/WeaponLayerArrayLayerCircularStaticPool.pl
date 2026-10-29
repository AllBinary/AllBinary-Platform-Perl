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

package org::allbinary::game::layer::weapon::WeaponLayerArrayLayerCircularStaticPool;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::game::layer::weapon::WeaponLayerArrayLayerCircularStaticPool'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{MAX} = 5;
    $self->{circularIndexUtil} = 'org::allbinary::util::CircularIndexUtil'->createInstance($self->{MAX});
    $self->{ALL_WEAPONLAYER_ARRAY} = [(undef) x (4)];
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::layer::weapon::WeaponLayerArrayLayerCircularStaticPool::instance;
}


sub init {
    my ($self) = @_;
        my $WEAPONLAYER_ARRAY = [(undef) x ($self->{MAX} * 2)];
        my $TWO_WEAPONLAYER_ARRAY = [(undef) x ($self->{MAX})];
        my $THREE_WEAPONLAYER_ARRAY = [(undef) x ($self->{MAX})];
        for (my $index = 0; $index < $self->{MAX}; $index++) {
            $WEAPONLAYER_ARRAY->[$index] = [(undef) x (1)];
            $TWO_WEAPONLAYER_ARRAY->[$index] = [(undef) x (2)];
            $THREE_WEAPONLAYER_ARRAY->[$index] = [(undef) x (3)];
        }
        $self->{ALL_WEAPONLAYER_ARRAY}->[1] = $WEAPONLAYER_ARRAY;
        $self->{ALL_WEAPONLAYER_ARRAY}->[2] = $TWO_WEAPONLAYER_ARRAY;
        $self->{ALL_WEAPONLAYER_ARRAY}->[3] = $THREE_WEAPONLAYER_ARRAY;
}


# throws Exception
sub getInstanceArray {
    my ($self, $size) = @_;
        my $weaponLayerArray = $self->{ALL_WEAPONLAYER_ARRAY}->[$size]->[$self->{circularIndexUtil}->getIndex()];
        $self->{circularIndexUtil}->next();
        return $weaponLayerArray;
}

use org::allbinary::util::CircularIndexUtil;

1;

