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
use parent -norequire,'java::lang::Object';

tie our $instance, 'java::lang::LazyStatic', sub { 'org::allbinary::game::layer::weapon::WeaponLayerArrayLayerCircularStaticPool'->new() };

sub _init_fields {
    my ($self) = @_;
    $self->{MAX} = 5;
    $self->{circularIndexUtil} = 'org::allbinary::util::CircularIndexUtil'->createInstance($self->{MAX});
    $self->{WEAPONLAYER_ARRAY} = undef;
    $self->{TWO_WEAPONLAYER_ARRAY} = undef;
    $self->{THREE_WEAPONLAYER_ARRAY} = undef;
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    _init_fields($self);
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
        $self->{WEAPONLAYER_ARRAY} = $WEAPONLAYER_ARRAY;
        $self->{TWO_WEAPONLAYER_ARRAY} = $TWO_WEAPONLAYER_ARRAY;
        $self->{THREE_WEAPONLAYER_ARRAY} = $THREE_WEAPONLAYER_ARRAY;
}


sub getWeaponLayerArrays {
    my ($self, $size) = @_;
        if ($size == 1) {
            return $self->{WEAPONLAYER_ARRAY};
        } elsif ($size == 2) {
            return $self->{TWO_WEAPONLAYER_ARRAY};
        } elsif ($size == 3) {
            return $self->{THREE_WEAPONLAYER_ARRAY};
        }
        die ("RuntimeException");
}


# throws Exception
sub getInstanceArray {
    my ($self, $size) = @_;
        my $weaponLayerArray = $self->getWeaponLayerArrays($size)->[$self->{circularIndexUtil}->getIndex()];
        $self->{circularIndexUtil}->next();
        return $weaponLayerArray;
}

use java::lang::Object ();
use java::lang::LazyStatic ();
use org::allbinary::util::CircularIndexUtil ();

1;

