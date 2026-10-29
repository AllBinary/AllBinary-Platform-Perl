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

# Java interface
package org::allbinary::game::physics::velocity::BasicVelocityInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub getVelocityXBasicDecimalP {
    my ($self) = @_;
    die "abstract method getVelocityXBasicDecimalP";
}


sub getVelocityYBasicDecimalP {
    my ($self) = @_;
    die "abstract method getVelocityYBasicDecimalP";
}


sub zero {
    my ($self) = @_;
    die "abstract method zero";
}


sub setVelocityWithBigDecimalAndDirection {
    my ($self, $magnitudeBasicDecimal, $direction, $otherDirection) = @_;
    die "abstract method setVelocityWithBigDecimalAndDirection";
}


sub addVelocityWithBigDecimalAndDirection {
    my ($self, $magnitudeBasicDecimal, $direction, $otherDirection) = @_;
    die "abstract method addVelocityWithBigDecimalAndDirection";
}


sub setVelocityWithDirection {
    my ($self, $magnitude, $direction, $otherDirection) = @_;
    die "abstract method setVelocityWithDirection";
}


sub addVelocityWithDirection {
    my ($self, $magnitude, $direction, $otherDirection) = @_;
    die "abstract method addVelocityWithDirection";
}


sub setVelocityWithBigDecimal {
    my ($self, $magnitudeBasicDecimal, $angle, $otherAngle) = @_;
    die "abstract method setVelocityWithBigDecimal";
}


sub addVelocityWithBigDecimal {
    my ($self, $magnitudeBasicDecimal, $angle, $otherAngle) = @_;
    die "abstract method addVelocityWithBigDecimal";
}


sub setVelocity {
    my ($self, $magnitude, $angle, $otherAngle) = @_;
    die "abstract method setVelocity";
}


sub addVelocity {
    my ($self, $magnitude, $angle, $otherAngle) = @_;
    die "abstract method addVelocity";
}


sub addVelocityi {
    my ($self, $magnitude, $angle, $otherAngle) = @_;
    die "abstract method addVelocityi";
}

use org::allbinary::direction::Direction;
use org::allbinary::logic::math::BasicDecimal;
use org::allbinary::math::Angle;

1;

