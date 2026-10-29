# 
# AllBinary Open License Version 1 
# Copyright (c) 2022 AllBinary 
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

package org::allbinary::game::behavior::topview::TopViewGameLayerBehavior;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::layer::behavior::GameLayerBehavior';


sub _init_fields {
    my ($self) = @_;
    $self->{maxGravityActionIndex} = undef;
    $self->{isJumpAction} = 1;
    $self->{isJumpOver} = 0;
    $self->{isFallingWithoutJumpAttempt} = 0;
    $self->{gravityActionIndex} = 0;
}


sub new {
    my ($class, $maxGravityActionIndex) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{maxGravityActionIndex} = $maxGravityActionIndex;
    return $self;
}


sub gravity {
    my ($self) = @_;
        if ($self->{gravityActionIndex} == 0) {
            $self->{gravityActionIndex}++;
            $self->{isFallingWithoutJumpAttempt} = 1;
        }
}


sub land {
    my ($self, $velocityProperties) = @_;
        $velocityProperties->getVelocityYBasicDecimalP()->setint(0);
        $self->landReset();
}


sub landReset {
    my ($self) = @_;
        $self->{gravityActionIndex} = 0;
        $self->{isFallingWithoutJumpAttempt} = 0;
        $self->{isJumpAction} = 1;
        $self->{isJumpOver} = 0;
}


sub up {
    my ($self, $velocityProperties, $acceleration, $jumpBehavior, $accelerationMultiplier) = @_;
        if (!$self->{isJumpOver}) {
            if ($self->{gravityActionIndex} < $self->{maxGravityActionIndex}) {
                my $acceleration2 = -$acceleration->getForward() * $accelerationMultiplier;
                $velocityProperties->getVelocityYBasicDecimalP()->addint($acceleration2);
                $velocityProperties->limitXYToForwardAndReverseMaxVelocity();
                $self->{gravityActionIndex}++;
            } else {
            }
        } else {
        }
        if ($self->{isJumpAction}) {
            $jumpBehavior->process();
            $self->{isJumpAction} = 0;
        }
}


sub inputFrames {
    my ($self, $velocityProperties) = @_;
        if ($self->{gravityActionIndex} > 0 && $velocityProperties->getVelocityYBasicDecimalP()->getUnscaled() > 0) {
            $self->{isJumpOver} = 1;
        }
}

use org::allbinary::game::layer::behavior::GameLayerBehavior;
use org::allbinary::game::physics::acceleration::BasicAccelerationProperties;
use org::allbinary::game::physics::velocity::VelocityProperties;

1;

