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

package org::allbinary::game::layer::VehicleProperties;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{velocityProperties} = undef;
    $self->{vehicleFrictionProperties} = undef;
}


sub new {
    my ($class, $velocityProperties, $vehicleFrictionProperties) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{velocityProperties} = $velocityProperties;
        $self->{vehicleFrictionProperties} = $vehicleFrictionProperties;
    return $self;
}


sub getVehicleFrictionProperties {
    my ($self) = @_;
        return $self->{vehicleFrictionProperties};
}


sub setVehicleFrictionProperties {
    my ($self, $vehicleFrictionProperties) = @_;
        $self->{vehicleFrictionProperties} = $vehicleFrictionProperties;
}


sub getVelocityProperties {
    my ($self) = @_;
        return $self->{velocityProperties};
}

use org::allbinary::game::physics::velocity::VelocityProperties;

1;

