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

package org::allbinary::animation::compound::CompoundRotationAnimation;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::animation::RotationAnimation','org::allbinary::animation::compound::CompoundAnimationInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{animationInterfaceArray} = undef;
}


sub new {
    my ($class, $animationInterfaceArray, $animationBehavior) = @_;
    my $self = $class->SUPER::new('org::allbinary::math::AngleInfo'->getInstance('org::allbinary::math::AngleFactory'->getInstance()->{QUARTER_TOTAL_ANGLE}), 'org::allbinary::util::CircularIndexUtil'->createInstance(4), $animationBehavior);
    $self->_init_fields();
        # super(...) made $self above
        $self->{animationInterfaceArray} = $animationInterfaceArray;
        $self->{circularIndexUtil} = 'org::allbinary::util::CircularIndexUtil'->createInstance(scalar(@{$self->{animationInterfaceArray}}));
    return $self;
}


sub setFrame {
    my ($self, $index) = @_;
        $self->{animationInterfaceArray}->[$self->{circularIndexUtil}->getIndex()]->setFrame($index);
}


sub getFrame {
    my ($self) = @_;
        return $self->{animationInterfaceArray}->[$self->{circularIndexUtil}->getIndex()]->getFrame();
}


# throws Exception
sub getAnimationSize {
    my ($self) = @_;
        return $self->{animationInterfaceArray}->[$self->{circularIndexUtil}->getIndex()]->getAnimationSize();
}


sub getSize {
    my ($self) = @_;
        return $self->{animationInterfaceArray}->[$self->{circularIndexUtil}->getIndex()]->getSize();
}


sub previousFrame {
    my ($self) = @_;
        $self->{animationInterfaceArray}->[$self->{circularIndexUtil}->getIndex()]->previousFrame();
}


# throws Exception
sub nextFrame {
    my ($self) = @_;
        $self->{animationInterfaceArray}->[$self->{circularIndexUtil}->getIndex()]->nextFrame();
}


sub previousRotation {
    my ($self) = @_;
        $self->{animationInterfaceArray}->[$self->{circularIndexUtil}->getIndex()]->previousRotation();
}


sub nextRotation {
    my ($self) = @_;
        $self->{animationInterfaceArray}->[$self->{circularIndexUtil}->getIndex()]->nextRotation();
}


sub setSequence {
    my ($self, $sequence) = @_;
}


sub getSequence {
    my ($self) = @_;
        return 'org::allbinary::logic::math::PrimitiveIntUtil'->getArrayInstance();
}


sub paintXY {
    my ($self, $graphics, $x, $y) = @_;
        $self->{animationInterfaceArray}->[$self->{circularIndexUtil}->getIndex()]->paintXY($graphics, $x, $y);
}


sub paintThreedXYZ {
    my ($self, $graphics, $x, $y, $z) = @_;
        $self->{animationInterfaceArray}->[$self->{circularIndexUtil}->getIndex()]->paintThreedXYZ($graphics, $x, $y, $z);
}


sub getCurrentAnimation {
    my ($self) = @_;
        return $self->{animationInterfaceArray}->[$self->{circularIndexUtil}->getIndex()];
}


sub nextAnimation {
    my ($self) = @_;
        my $frame = $self->getFrame();
        $self->{circularIndexUtil}->next();
        $self->setFrame($frame);
}


sub previousAnimation {
    my ($self) = @_;
        my $frame = $self->getFrame();
        $self->{circularIndexUtil}->previous();
        $self->setFrame($frame);
}


sub setAnimation {
    my ($self, $index) = @_;
        my $frame = $self->getFrame();
        $self->{circularIndexUtil}->setIndex($index);
        $self->setFrame($frame);
}


sub setFrameByDirection {
    my ($self, $direction) = @_;
        $self->{animationInterfaceArray}->[$self->{circularIndexUtil}->getIndex()]->setFrameByDirection($direction);
}


sub setFrameToAngle {
    my ($self, $angle) = @_;
        $self->{animationInterfaceArray}->[$self->{circularIndexUtil}->getIndex()]->setFrameToAngle($angle);
}


sub adjustFrameToAngle {
    my ($self, $newAngle) = @_;
        $self->adjustFrame($newAngle->getValue());
}


sub adjustFrame {
    my ($self, $angle) = @_;
        $self->{animationInterfaceArray}->[$self->{circularIndexUtil}->getIndex()]->adjustFrame($angle);
}


sub getAngleInfoP {
    my ($self) = @_;
        return $self->{animationInterfaceArray}->[$self->{circularIndexUtil}->getIndex()]->getAngleInfoP();
}


sub getAnimationInterfaceArray {
    my ($self) = @_;
        return $self->{animationInterfaceArray};
}


sub setAnimationInterfaceArray {
    my ($self, $animationInterfaceArray) = @_;
        $self->{animationInterfaceArray} = $animationInterfaceArray;
}


# throws Exception
sub set {
    my ($self, $gl) = @_;
        for (my $index = scalar(@{$self->{animationInterfaceArray}}); --$index >= 0; ) {
            $self->{animationInterfaceArray}->[$index]->set($gl);
        }
}

# use javax::microedition::khronos::opengles::GL;
# use javax::microedition::lcdui::Graphics;
use org::allbinary::animation::AnimationBehavior;
use org::allbinary::animation::IndexedAnimation;
use org::allbinary::animation::RotationAnimation;
use org::allbinary::direction::Direction;
use org::allbinary::logic::math::PrimitiveIntUtil;
use org::allbinary::math::Angle;
use org::allbinary::math::AngleFactory;
use org::allbinary::math::AngleInfo;
use org::allbinary::util::CircularIndexUtil;
use org::allbinary::animation::compound::CompoundAnimationInterface;

1;

