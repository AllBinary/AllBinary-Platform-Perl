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

package org::allbinary::physics::movement::DelayedConstantVelocityMovement;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::physics::movement::BasicConstantVelocityMovement';


sub _init_fields {
    my ($self) = @_;
    $self->{timeDelayHelper} = 'org::allbinary::time::TimeDelayHelper'->new(60);
}


sub new {
    my ($class, $basicDecimal, $velocityProperties) = @_;
    my $self = $class->SUPER::new($basicDecimal, $velocityProperties);
    $self->_init_fields();
        # super(...) made $self above
    return $self;
}


sub init {
    my ($self, $speedBasicDecimal, $angle, $otherAngle) = @_;
}


# throws Exception
sub process {
    my ($self, $layer) = @_;
        if ($self->{timeDelayHelper}->isTime('org::allbinary::time::GameTickTimeDelayHelperFactory'->getInstance()->{startTime})) {
            $self->SUPER::process($layer);
        }
}

use org::allbinary::game::layer::AllBinaryGameLayer;
use org::allbinary::game::physics::velocity::BasicVelocityProperties;
use org::allbinary::logic::math::BasicDecimal;
use org::allbinary::time::GameTickTimeDelayHelperFactory;
use org::allbinary::time::TimeDelayHelper;
use org::allbinary::physics::movement::BasicConstantVelocityMovement;

1;

