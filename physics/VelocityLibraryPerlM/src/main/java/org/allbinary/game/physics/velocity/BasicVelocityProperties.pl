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

package org::allbinary::game::physics::velocity::BasicVelocityProperties;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::physics::velocity::BasicVelocityInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{velocityXBasicDecimal} = undef;
    $self->{velocityYBasicDecimal} = undef;
    $self->{velocityZBasicDecimal} = undef;
    $self->{axisMathVectorUtil} = 'org::allbinary::logic::math::vector::AxisMathVectorUtil'->getInstance();
    $self->{directionUtil} = 'org::allbinary::direction::DirectionUtil'->getInstance();
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{velocityXBasicDecimal} = 'org::allbinary::logic::math::BasicDecimal'->new(0);
        $self->{velocityYBasicDecimal} = 'org::allbinary::logic::math::BasicDecimal'->new(0);
        $self->{velocityZBasicDecimal} = 'org::allbinary::logic::math::BasicDecimal'->new(0);
    return $self;
}


sub zero {
    my ($self) = @_;
        $self->{velocityXBasicDecimal}->setint(0);
        $self->{velocityYBasicDecimal}->setint(0);
        $self->{velocityZBasicDecimal}->setint(0);
}


sub getVelocityXBasicDecimalP {
    my ($self) = @_;
        return $self->{velocityXBasicDecimal};
}


sub getVelocityYBasicDecimalP {
    my ($self) = @_;
        return $self->{velocityYBasicDecimal};
}


sub getVelocityZBasicDecimalP {
    my ($self) = @_;
        return $self->{velocityZBasicDecimal};
}


sub setVelocityWithBigDecimalAndDirection {
    my ($self, $magnitudeBasicDecimal, $direction, $otherDirection) = @_;
        my $angle = $self->{directionUtil}->getAngle($direction);
        my $otherAngle = $self->{directionUtil}->getAngle($otherDirection);
        $self->setVelocityWithBigDecimal($magnitudeBasicDecimal, $angle, $otherAngle);
}


sub setVelocityWithDirection {
    my ($self, $magnitude, $direction, $otherDirection) = @_;
        my $angle = $self->{directionUtil}->getAngle($direction);
        my $otherAngle = $self->{directionUtil}->getAngle($otherDirection);
        $self->setVelocity($magnitude, $angle, $otherAngle);
}


sub addVelocityWithBigDecimalAndDirection {
    my ($self, $magnitudeBasicDecimal, $direction, $otherDirection) = @_;
        my $angle = $self->{directionUtil}->getAngle($direction);
        my $otherAngle = $self->{directionUtil}->getAngle($otherDirection);
        $self->addVelocityWithBigDecimal($magnitudeBasicDecimal, $angle, $otherAngle);
}


sub addVelocityWithDirection {
    my ($self, $magnitude, $direction, $otherDirection) = @_;
        my $angle = $self->{directionUtil}->getAngle($direction);
        my $otherAngle = $self->{directionUtil}->getAngle($otherDirection);
        $self->addVelocity($magnitude, $angle, $otherAngle);
}


sub setVelocityWithBigDecimal {
    my ($self, $magnitudeBasicDecimal, $angle, $otherAngle) = @_;
        my $magnitude = $magnitudeBasicDecimal->getUnscaled();
        $self->setVelocity($magnitude, $angle, $otherAngle);
}


sub addVelocityWithBigDecimal {
    my ($self, $magnitudeBasicDecimal, $angle, $otherAngle) = @_;
        my $magnitude = $magnitudeBasicDecimal->getUnscaled();
        $self->addVelocity($magnitude, $angle, $otherAngle);
}


sub setVelocity {
    my ($self, $magnitude, $angle, $otherAngle) = @_;
        $self->setVelocityi($magnitude, int($angle->getValue()), int($otherAngle->getValue()));
}


sub addVelocity {
    my ($self, $magnitude, $angle, $otherAngle) = @_;
        $self->addVelocityi($magnitude, int($angle->getValue()), int($otherAngle->getValue()));
}


sub setVelocityi {
    my ($self, $magnitude, $angle, $otherAngle) = @_;
        my $xVector = ($self->{axisMathVectorUtil}->calculateX($magnitude, $angle) / $self->{velocityXBasicDecimal}->getScaledFactorValue());
        my $yVector = ($self->{axisMathVectorUtil}->calculateY($magnitude, $angle) / $self->{velocityYBasicDecimal}->getScaledFactorValue());
        my $zVector = ($self->{axisMathVectorUtil}->calculateZ($magnitude, $otherAngle) / $self->{velocityZBasicDecimal}->getScaledFactorValue());
        $self->{velocityXBasicDecimal}->setlong($xVector);
        $self->{velocityYBasicDecimal}->setlong($yVector);
        $self->{velocityZBasicDecimal}->setlong($zVector);
}


sub addVelocityi {
    my ($self, $magnitude, $angle, $otherAngle) = @_;
        my $xVector = ($self->{axisMathVectorUtil}->calculateX($magnitude, $angle) / $self->{velocityXBasicDecimal}->getScaledFactorValue());
        my $yVector = ($self->{axisMathVectorUtil}->calculateY($magnitude, $angle) / $self->{velocityYBasicDecimal}->getScaledFactorValue());
        my $zVector = ($self->{axisMathVectorUtil}->calculateZ($magnitude, $otherAngle) / $self->{velocityZBasicDecimal}->getScaledFactorValue());
        $self->{velocityXBasicDecimal}->addlong($xVector);
        $self->{velocityYBasicDecimal}->addlong($yVector);
        $self->{velocityZBasicDecimal}->addlong($zVector);
}


sub toString {
    my ($self) = @_;
        my $commonSeps = 'org::allbinary::string::CommonSeps'->getInstance();
        my $positionStrings = 'org::allbinary::math::PositionStrings'->getInstance();
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        my $stringUtil = 'org::allbinary::logic::string::StringUtil'->getInstance();
        $stringBuffer->append("Velocity ");
        $stringBuffer->append($positionStrings->{X_LABEL});
        $stringBuffer->append($stringUtil->toString($self->{velocityXBasicDecimal}));
        $stringBuffer->append($commonSeps->{SPACE});
        $stringBuffer->append($positionStrings->{Y_LABEL});
        $stringBuffer->append($stringUtil->toString($self->{velocityYBasicDecimal}));
        $stringBuffer->append($commonSeps->{SPACE});
        $stringBuffer->append($positionStrings->{Z_LABEL});
        $stringBuffer->append($stringUtil->toString($self->{velocityZBasicDecimal}));
        return $stringBuffer->toString();
}

use org::allbinary::direction::Direction;
use org::allbinary::direction::DirectionUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::math::BasicDecimal;
use org::allbinary::logic::math::vector::AxisMathVectorUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::math::Angle;
use org::allbinary::math::PositionStrings;
use org::allbinary::string::CommonSeps;
use org::allbinary::game::physics::velocity::BasicVelocityInterface;

1;

