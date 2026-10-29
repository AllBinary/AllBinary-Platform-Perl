# 
# AllBinary Open License Version 1 
# Copyright (c) 2006 AllBinary 
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

package org::allbinary::game::behavior::topview::CharacterFrictionProperties;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::physics::FrictionProperties';


sub _init_fields {
    my ($self) = @_;
    $self->{WATER_FRICTION_NOMINATOR} = undef;
    $self->{AIR_FRICTION_NOMINATOR} = undef;
    $self->{COLLISION_FRICTION_NOMINATOR} = undef;
}


sub new {
    my ($class, $airFriction, $waterFriction, $collisionFriction) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{AIR_FRICTION_NOMINATOR} = 'org::allbinary::game::physics::friction::FrictionData'->getFrictionDenominator() - $airFriction;
        $self->{COLLISION_FRICTION_NOMINATOR} = 'org::allbinary::game::physics::friction::FrictionData'->getFrictionDenominator() - $collisionFriction;
        $self->{WATER_FRICTION_NOMINATOR} = 'org::allbinary::game::physics::friction::FrictionData'->getFrictionDenominator() - $waterFriction;
    return $self;
}


sub getWATER_FRICTION_NOMINATOR {
    my ($self) = @_;
        return $self->{WATER_FRICTION_NOMINATOR};
}


sub getAIR_FRICTION_NOMINATOR {
    my ($self) = @_;
        return $self->{AIR_FRICTION_NOMINATOR};
}


sub getCOLLISION_FRICTION_NOMINATOR {
    my ($self) = @_;
        return $self->{COLLISION_FRICTION_NOMINATOR};
}

use org::allbinary::game::physics::FrictionProperties;
use org::allbinary::game::physics::friction::FrictionData;

1;

