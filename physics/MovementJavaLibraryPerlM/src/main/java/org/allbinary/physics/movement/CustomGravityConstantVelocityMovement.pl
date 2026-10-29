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

package org::allbinary::physics::movement::CustomGravityConstantVelocityMovement;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::physics::movement::BasicConstantVelocityMovement';


sub _init_fields {
    my ($self) = @_;
    $self->{customGravity} = undef;
    $self->{gravityUtil} = 'org::allbinary::game::physics::acceleration::GravityUtil'->getInstance();
}


sub new {
    my ($class, $speedBasicDecimal, $customGravity) = @_;
    my $self = $class->SUPER::new($speedBasicDecimal, 'org::allbinary::game::physics::velocity::VelocityProperties'->new(int($speedBasicDecimal->getUnscaled()), int($speedBasicDecimal->getUnscaled())));
    $self->_init_fields();
        # super(...) made $self above
        $self->{customGravity} = $customGravity;
    return $self;
}


# throws Exception
sub process {
    my ($self, $layer) = @_;
        $self->SUPER::process($layer);
        $self->{gravityUtil}->process($self->getVelocityProperties(), $self->{customGravity});
        my $velocityProperties = $self->getVelocityProperties();
        $velocityProperties->limitMaxYForwardVelocity();
}

use org::allbinary::game::layer::AllBinaryGameLayer;
use org::allbinary::game::physics::acceleration::GravityUtil;
use org::allbinary::game::physics::velocity::VelocityProperties;
use org::allbinary::logic::math::BasicDecimal;
use org::allbinary::physics::movement::BasicConstantVelocityMovement;

1;

