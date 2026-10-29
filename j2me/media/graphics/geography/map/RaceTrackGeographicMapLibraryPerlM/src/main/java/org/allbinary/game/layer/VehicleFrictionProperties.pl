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

package org::allbinary::game::layer::VehicleFrictionProperties;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::physics::FrictionProperties';


sub _init_fields {
    my ($self) = @_;
    $self->{TIRE_FRICTION_NOMINATOR} = undef;
    $self->{BRAKE_FRICTION_NOMINATOR} = undef;
    $self->{AIR_FRICTION_NOMINATOR} = undef;
    $self->{CRASH_FRICTION_NOMINATOR} = undef;
}


sub new {
    my ($class, $tireFriction, $brakeFriction, $airFriction, $crashFriction) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{TIRE_FRICTION_NOMINATOR} = 'org::allbinary::game::physics::friction::FrictionData'->getFrictionDenominator() - $tireFriction;
        $self->{BRAKE_FRICTION_NOMINATOR} = 'org::allbinary::game::physics::friction::FrictionData'->getFrictionDenominator() - $brakeFriction;
        $self->{AIR_FRICTION_NOMINATOR} = 'org::allbinary::game::physics::friction::FrictionData'->getFrictionDenominator() - $airFriction;
        $self->{CRASH_FRICTION_NOMINATOR} = 'org::allbinary::game::physics::friction::FrictionData'->getFrictionDenominator() - $crashFriction;
    return $self;
}


sub getTireFrictionNominator {
    my ($self) = @_;
        return $self->{TIRE_FRICTION_NOMINATOR};
}


sub getBrakeFrictionNominator {
    my ($self) = @_;
        return $self->{BRAKE_FRICTION_NOMINATOR};
}


sub getAirFrictionNominator {
    my ($self) = @_;
        return $self->{AIR_FRICTION_NOMINATOR};
}


sub getCrashFrictionNominator {
    my ($self) = @_;
        return $self->{CRASH_FRICTION_NOMINATOR};
}

use org::allbinary::game::physics::FrictionProperties;
use org::allbinary::game::physics::friction::FrictionData;

1;

