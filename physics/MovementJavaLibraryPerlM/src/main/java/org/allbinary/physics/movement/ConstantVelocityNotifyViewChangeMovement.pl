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

package org::allbinary::physics::movement::ConstantVelocityNotifyViewChangeMovement;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::physics::movement::Movement';


sub _init_fields {
    my ($self) = @_;
    $self->{basicVelocityProperties} = undef;
    $self->{speedBasicDecimal} = undef;
    $self->{axisMathVectorUtil} = 'org::allbinary::logic::math::vector::AxisMathVectorUtil'->getInstance();
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{speedBasicDecimal} = $org::allbinary::logic::math::BasicDecimal::ZERO_BIGDECIMAL;
        $self->{basicVelocityProperties} = 'org::allbinary::game::physics::velocity::BasicVelocityProperties'->new();
    return $self;
}


sub init {
    my ($self, $speedBasicDecimal, $angle, $otherAngle) = @_;
        $self->{speedBasicDecimal} = $speedBasicDecimal;
        my $angleFactory = 'org::allbinary::math::AngleFactory'->getInstance();
        $self->{basicVelocityProperties}->setVelocityWithBigDecimal($speedBasicDecimal, $angleFactory->getAt($angle), $angleFactory->getAt($otherAngle));
}


sub moveOutsideRadius {
    my ($self, $layer, $radius, $angle, $otherAngle) = @_;
        my $scaleFactorValue = $self->{speedBasicDecimal}->getScaledFactorValue();
        my $xVector = int(($self->{axisMathVectorUtil}->calculateX($radius, $angle) / $scaleFactorValue));
        my $yVector = int(($self->{axisMathVectorUtil}->calculateY($radius, $angle) / $scaleFactorValue));
        my $zVector = int(($self->{axisMathVectorUtil}->calculateZ($radius, $otherAngle) / $scaleFactorValue));
        $layer->moveDXYZ($xVector, $yVector, $zVector);
}


# throws Exception
sub process {
    my ($self, $layer) = @_;
        my $x = $self->{basicVelocityProperties}->getVelocityXBasicDecimalP()->getScaled();
        my $y = $self->{basicVelocityProperties}->getVelocityYBasicDecimalP()->getScaled();
        my $z = $self->{basicVelocityProperties}->getVelocityZBasicDecimalP()->getScaled();
        $layer->moveDXYZ($x, $y, $z);
        if ($x != 0 || $y != 0 || $z != 0) {
            $layer->onViewPositionChangeEvent();
        }
}


sub stop {
    my ($self) = @_;
        $self->{basicVelocityProperties}->zero();
}

use org::allbinary::game::layer::AllBinaryGameLayer;
use org::allbinary::game::physics::velocity::BasicVelocityProperties;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::logic::math::BasicDecimal;
use org::allbinary::logic::math::vector::AxisMathVectorUtil;
use org::allbinary::math::AngleFactory;
use org::allbinary::physics::movement::Movement;

1;

