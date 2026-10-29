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

package org::allbinary::game::combat::CombatBaseBehavior;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $NULL_COMBAT_BEHAVIOR = 'org::allbinary::game::combat::CombatBaseBehavior'->new('org::allbinary::game::combat::damage::DamageableBaseBehavior'->getInstance(), 'org::allbinary::game::combat::destroy::DestroyableBaseBehavior'->getInstance());

sub _init_fields {
    my ($self) = @_;
    $self->{damageableBaseBehavior} = undef;
    $self->{destroyableBaseBehavior} = undef;
    $self->{readyForExplosion} = 0;
}


sub new {
    my ($class, $damageableBaseBehavior, $destroyableBaseBehavior) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{damageableBaseBehavior} = $damageableBaseBehavior;
        $self->{destroyableBaseBehavior} = $destroyableBaseBehavior;
    return $self;
}


sub getDamageableBaseBehavior {
    my ($self) = @_;
        return $self->{damageableBaseBehavior};
}


sub getDestroyableBaseBehavior {
    my ($self) = @_;
        return $self->{destroyableBaseBehavior};
}


sub isReadyForExplosion {
    my ($self) = @_;
        return $self->{readyForExplosion};
}


sub setReadyForExplosion {
    my ($self, $readyForExplosion) = @_;
        $self->{readyForExplosion} = $readyForExplosion;
}

use org::allbinary::game::combat::damage::DamageableBaseBehavior;
use org::allbinary::game::combat::destroy::DestroyableBaseBehavior;

1;

