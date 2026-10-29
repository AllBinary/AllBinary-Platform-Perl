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

package org::allbinary::animation::compound::CompoundIndexedAnimation;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::animation::IndexedAnimation','org::allbinary::animation::compound::CompoundAnimationInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{circularIndexUtil} = undef;
    $self->{animationInterfaceArray} = undef;
}


sub new {
    my ($class, $animationInterfaceArray, $animationBehavior) = @_;
    my $self = $class->SUPER::new($animationBehavior);
    $self->_init_fields();
        # super(...) made $self above
        $self->{animationInterfaceArray} = $animationInterfaceArray;
        $self->{circularIndexUtil} = 'org::allbinary::util::CircularIndexUtil'->createInstance(scalar(@{$self->{animationInterfaceArray}}));
    return $self;
}


sub setFrame {
    my ($self, $index) = @_;
        my $indexedAnimation = $self->{animationInterfaceArray}->[$self->{circularIndexUtil}->getIndex()];
        $indexedAnimation->setFrame($index);
}


sub getFrame {
    my ($self) = @_;
        my $indexedAnimation = $self->{animationInterfaceArray}->[$self->{circularIndexUtil}->getIndex()];
        return $indexedAnimation->getFrame();
}


sub getSize {
    my ($self) = @_;
        my $indexedAnimation = $self->{animationInterfaceArray}->[$self->{circularIndexUtil}->getIndex()];
        return $indexedAnimation->getSize();
}


sub previousFrame {
    my ($self) = @_;
        my $indexedAnimation = $self->{animationInterfaceArray}->[$self->{circularIndexUtil}->getIndex()];
        $indexedAnimation->previousFrame();
}


sub setSequence {
    my ($self, $sequence) = @_;
}


sub getSequence {
    my ($self) = @_;
        return 'org::allbinary::logic::math::PrimitiveIntUtil'->getArrayInstance();
}


# throws Exception
sub nextFrame {
    my ($self) = @_;
        $self->{animationInterfaceArray}->[$self->{circularIndexUtil}->getIndex()]->nextFrame();
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
use org::allbinary::animation::Animation;
use org::allbinary::animation::AnimationBehavior;
use org::allbinary::animation::IndexedAnimation;
use org::allbinary::logic::math::PrimitiveIntUtil;
use org::allbinary::util::CircularIndexUtil;
use org::allbinary::animation::compound::CompoundAnimationInterface;

1;

