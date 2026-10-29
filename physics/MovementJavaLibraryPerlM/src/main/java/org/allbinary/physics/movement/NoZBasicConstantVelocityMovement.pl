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

package org::allbinary::physics::movement::NoZBasicConstantVelocityMovement;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::physics::movement::Movement','org::allbinary::game::physics::velocity::VelocityInterfaceCompositeInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{velocityProperties} = undef;
    $self->{speedBasicDecimal} = $org::allbinary::logic::math::BasicDecimal::ZERO_BIGDECIMAL;
    $self->{axisMathVectorUtil} = 'org::allbinary::logic::math::vector::AxisMathVectorUtil'->getInstance();
}


sub new {
    my ($class, $basicDecimal, $velocityProperties) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->setSpeedBasicDecimal($basicDecimal);
        $self->{velocityProperties} = $velocityProperties;
    return $self;
}


sub init {
    my ($self, $speedBasicDecimal, $angle, $otherAngle) = @_;
        $self->{speedBasicDecimal} = $speedBasicDecimal;
        my $angleFactory = 'org::allbinary::math::AngleFactory'->getInstance();
        $self->{velocityProperties}->setVelocityWithBigDecimal($speedBasicDecimal, $angleFactory->getAt($angle), $angleFactory->getAt($otherAngle));
}


sub moveOutsideRadius {
    my ($self, $layer, $radius, $angle, $otherAngle) = @_;
        my $scaleFactorValue = $self->{speedBasicDecimal}->getScaledFactorValue();
        my $xVector = int(($self->{axisMathVectorUtil}->calculateX($radius, $angle) / $scaleFactorValue));
        my $yVector = int(($self->{axisMathVectorUtil}->calculateY($radius, $angle) / $scaleFactorValue));
        $layer->moveDXYZ($xVector, $yVector, 0);
}


# throws Exception
sub process {
    my ($self, $layer) = @_;
        $layer->moveDXYZ($self->{velocityProperties}->getVelocityXBasicDecimalP()->getScaled(), $self->{velocityProperties}->getVelocityYBasicDecimalP()->getScaled(), 0);
}


sub toString {
    my ($self) = @_;
        return $self->{velocityProperties}->toString();
}


sub stop {
    my ($self) = @_;
        $self->{velocityProperties}->zero();
}


sub getVelocityProperties {
    my ($self) = @_;
        return $self->{velocityProperties};
}


sub setVelocityProperties {
    my ($self, $velocityProperties) = @_;
        $self->{velocityProperties} = $velocityProperties;
}


sub setSpeedBasicDecimal {
    my ($self, $speedBasicDecimal) = @_;
        $self->{speedBasicDecimal} = $speedBasicDecimal;
}


sub getSpeedBasicDecimal {
    my ($self) = @_;
        return $self->{speedBasicDecimal};
}

use org::allbinary::game::layer::AllBinaryGameLayer;
use org::allbinary::game::physics::velocity::BasicVelocityProperties;
use org::allbinary::game::physics::velocity::VelocityInterfaceCompositeInterface;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::logic::math::BasicDecimal;
use org::allbinary::logic::math::vector::AxisMathVectorUtil;
use org::allbinary::math::AngleFactory;
use org::allbinary::physics::movement::Movement;

1;

