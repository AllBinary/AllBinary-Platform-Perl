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

package org::allbinary::game::physics::velocity::VelocityProperties;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::physics::velocity::BasicVelocityProperties','org::allbinary::game::physics::velocity::VelocityInterface';

our $NULL_VELOCITY_PROPERTIES = 'org::allbinary::game::physics::velocity::VelocityProperties'->new(0, 0);

sub _init_fields {
    my ($self) = @_;
    $self->{maxForwardVelocity} = 0;
    $self->{maxReverseVelocity} = 0;
}


sub new {
    my ($class, $maxForwardVelocity, $maxReverseVelocity) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->setMaxForwardVelocity($maxForwardVelocity);
        $self->setMaxReverseVelocity($maxReverseVelocity);
    return $self;
}


sub getMaxForwardVelocity {
    my ($self) = @_;
        return $self->{maxForwardVelocity};
}


sub setMaxForwardVelocity {
    my ($self, $maxForwardVelocity) = @_;
        $self->{maxForwardVelocity} = $maxForwardVelocity;
}


sub getMaxReverseVelocity {
    my ($self) = @_;
        return $self->{maxReverseVelocity};
}


sub setMaxReverseVelocity {
    my ($self, $maxReverseVelocity) = @_;
        $self->{maxReverseVelocity} = $maxReverseVelocity;
}


sub limitMaxXYForwardVelocity {
    my ($self) = @_;
        $self->limitMaxXYVelocity($self->getMaxForwardVelocity());
}


sub limitMaxXYReverseVelocity {
    my ($self) = @_;
        $self->limitMaxXYVelocity($self->getMaxReverseVelocity());
}


sub limitMaxYForwardVelocity {
    my ($self) = @_;
        $self->limitMaxYVelocity($self->getMaxForwardVelocity());
}


sub limitMaxYReverseVelocity {
    my ($self) = @_;
        $self->limitMaxYVelocity($self->getMaxReverseVelocity());
}


sub limitMaxXForwardVelocity {
    my ($self) = @_;
        $self->limitMaxXVelocity($self->getMaxForwardVelocity());
}


sub limitMaxXReverseVelocity {
    my ($self) = @_;
        $self->limitMaxXVelocity($self->getMaxReverseVelocity());
}


sub isOverXYMaxForwardVelocity {
    my ($self) = @_;
        return $self->isOverXYMaxVelocity($self->getMaxForwardVelocity());
}


sub isOverXYMaxReverseVelocity {
    my ($self) = @_;
        return $self->isOverXYMaxVelocity($self->getMaxReverseVelocity());
}


sub limitXYToForwardAndReverseMaxVelocity {
    my ($self) = @_;
        $self->limitMaxXYForwardVelocity();
        $self->limitMaxXYReverseVelocity();
}


sub limitMaxXYVelocity {
    my ($self, $maxVelocity) = @_;
        $self->limitMaxXVelocity($maxVelocity);
        $self->limitMaxYVelocity($maxVelocity);
}


sub limitMaxPositiveYVelocity {
    my ($self, $maxVelocity) = @_;
        if ($self->{velocityYBasicDecimal}->getUnscaled() > $maxVelocity) {
            $self->{velocityYBasicDecimal}->setint($maxVelocity);
        }
}


sub limitMaxNegativeYVelocity {
    my ($self, $maxVelocity) = @_;
        if ($self->{velocityYBasicDecimal}->getUnscaled() < -$maxVelocity) {
            $self->{velocityYBasicDecimal}->setint(-$maxVelocity);
        }
}


sub limitMaxYVelocity {
    my ($self, $maxVelocity) = @_;
        $self->limitMaxPositiveYVelocity($maxVelocity);
        $self->limitMaxNegativeYVelocity($maxVelocity);
}


sub limitMaxXVelocity {
    my ($self, $maxVelocity) = @_;
        if ($self->{velocityXBasicDecimal}->getUnscaled() > $maxVelocity) {
            $self->{velocityXBasicDecimal}->setint($maxVelocity);
        }
        if ($self->{velocityXBasicDecimal}->getUnscaled() < -$maxVelocity) {
            $self->{velocityXBasicDecimal}->setint(-$maxVelocity);
        }
}


sub isOverXYMaxVelocity {
    my ($self, $maxVelocity) = @_;
        if ($self->{velocityXBasicDecimal}->getUnscaled() > $maxVelocity) {
            return 1;
        }
        if ($self->{velocityXBasicDecimal}->getUnscaled() < -$maxVelocity) {
            return 1;
        }
        if ($self->{velocityYBasicDecimal}->getUnscaled() > $maxVelocity) {
            return 1;
        }
        if ($self->{velocityYBasicDecimal}->getUnscaled() < -$maxVelocity) {
            return 1;
        }
        return 0;
}


sub setVelocityi {
    my ($self, $magnitude, $angle, $otherAngle) = @_;
        $self->SUPER::setVelocityi($magnitude, $angle, $otherAngle);
        $self->limitXYToForwardAndReverseMaxVelocity();
}


sub addVelocityi {
    my ($self, $magnitude, $angle, $otherAngle) = @_;
        $self->SUPER::addVelocityi($magnitude, $angle, $otherAngle);
        $self->limitXYToForwardAndReverseMaxVelocity();
}

use org::allbinary::game::physics::velocity::BasicVelocityProperties;
use org::allbinary::game::physics::velocity::VelocityInterface;

1;

