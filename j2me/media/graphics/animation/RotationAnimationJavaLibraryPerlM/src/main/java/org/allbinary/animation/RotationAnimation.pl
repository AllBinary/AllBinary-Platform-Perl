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

package org::allbinary::animation::RotationAnimation;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::animation::IndexedAnimation','org::allbinary::animation::RotationAnimationInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{frameUtil} = 'org::allbinary::math::FrameUtil'->getInstance();
    $self->{directionUtil} = 'org::allbinary::direction::DirectionUtil'->getInstance();
    $self->{angleInfo} = undef;
    $self->{circularIndexUtil} = undef;
}


sub new {
    my ($class, $angleInfo, $circularIndexUtil, $animationBehavior) = @_;
    my $self = $class->SUPER::new($animationBehavior);
    $self->_init_fields();
        # super(...) made $self above
        $self->{angleInfo} = $angleInfo;
        $self->{circularIndexUtil} = $circularIndexUtil;
    return $self;
}


sub nextRotationX {
    my ($self) = @_;
}


sub previousRotationX {
    my ($self) = @_;
}


sub nextRotation {
    my ($self) = @_;
        $self->{angleInfo}->adjustAngle($self->{circularIndexUtil}->next());
}


sub previousRotation {
    my ($self) = @_;
        $self->{angleInfo}->adjustAngle($self->{circularIndexUtil}->previous());
}


sub nextRotationZ {
    my ($self) = @_;
}


sub previousRotationZ {
    my ($self) = @_;
}


sub setFrame {
    my ($self, $index) = @_;
        $self->{circularIndexUtil}->setIndex($index);
        my $newFrame = $self->{circularIndexUtil}->getIndex();
        $self->{angleInfo}->adjustAngle($newFrame);
}


sub setFrameByDirection {
    my ($self, $direction) = @_;
        my $angle = $self->{directionUtil}->getFrameAngle($direction);
        $self->adjustFrameToAngle($angle);
}


sub setFrameToAngle {
    my ($self, $angle) = @_;
        $self->adjustFrameToAngle($angle);
}


sub adjustFrameToAngle {
    my ($self, $angle) = @_;
        $self->adjustFrame($angle->getValue());
}


sub adjustFrame {
    my ($self, $angle) = @_;
        $self->setFrame($self->{frameUtil}->getFrameForAngle($angle, int($self->{angleInfo}->getAngleIncrementInfo()->getAngleIncrement())));
}


sub getFrame {
    my ($self) = @_;
        return $self->{circularIndexUtil}->getIndex();
}


sub getSize {
    my ($self) = @_;
        return $self->{circularIndexUtil}->getSize();
}


sub getAngleInfoP {
    my ($self) = @_;
        return $self->{angleInfo};
}


sub toString {
    my ($self) = @_;
        return 'org::allbinary::logic::string::StringMaker'->new()->append($self->SUPER::toString())->append("circularIndexUtil: ")->append($self->{circularIndexUtil}->toString())->append("angleInfo: ")->append($self->{angleInfo}->toString())->toString();
}

use org::allbinary::direction::Direction;
use org::allbinary::direction::DirectionUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::math::Angle;
use org::allbinary::math::AngleInfo;
use org::allbinary::math::FrameUtil;
use org::allbinary::util::CircularIndexUtil;
use org::allbinary::animation::IndexedAnimation;
use org::allbinary::animation::RotationAnimationInterface;

1;

