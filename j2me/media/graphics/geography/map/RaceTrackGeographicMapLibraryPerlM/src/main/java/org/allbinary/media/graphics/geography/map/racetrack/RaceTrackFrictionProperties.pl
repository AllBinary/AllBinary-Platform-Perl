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

package org::allbinary::media::graphics::geography::map::racetrack::RaceTrackFrictionProperties;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{ROAD_FRICTION_NOMINATOR} = undef;
    $self->{GROUND_FRICTION_NOMINATOR} = undef;
}


sub new {
    my ($class, $roadFriction, $groundFriction) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{ROAD_FRICTION_NOMINATOR} = 'org::allbinary::game::physics::friction::FrictionData'->getFrictionDenominator() - $roadFriction;
        $self->{GROUND_FRICTION_NOMINATOR} = 'org::allbinary::game::physics::friction::FrictionData'->getFrictionDenominator() - $groundFriction;
    return $self;
}


sub getRoadFrictionNominator {
    my ($self) = @_;
        return $self->{ROAD_FRICTION_NOMINATOR};
}


sub getGroundFrictionNominator {
    my ($self) = @_;
        return $self->{GROUND_FRICTION_NOMINATOR};
}

use org::allbinary::game::physics::friction::FrictionData;

1;

