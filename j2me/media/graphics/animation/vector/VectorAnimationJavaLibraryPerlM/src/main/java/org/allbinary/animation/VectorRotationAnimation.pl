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

package org::allbinary::animation::VectorRotationAnimation;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::animation::VectorBaseRotationAnimation';



sub new {
    my ($class, $currentPoints, $basicColor, $animationBehavior) = @_;
    my $self = $class->SUPER::new('org::allbinary::math::AngleInfo'->getInstance(((int(('org::allbinary::math::AngleFactory'->getInstance()->{TOTAL_ANGLE} / scalar(@{$currentPoints}))) + 32768) % 65536 - 32768)), $currentPoints, $basicColor, $animationBehavior);
        # super(...) made $self above
        $self->{angleInfo}->adjustAngle($self->getFrame());
    return $self;
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


sub setFrame {
    my ($self, $index) = @_;
        $self->SUPER::setFrame($index);
        $self->{angleInfo}->adjustAngle($self->getFrame());
}


sub adjustFrame {
    my ($self, $newAngle) = @_;
        $self->setFrame($self->{frameUtil}->getFrameForAngle($newAngle, int($self->{angleInfo}->getAngleIncrementInfo()->getAngleIncrement())));
}


sub adjustFrameToAngle {
    my ($self, $newAngle) = @_;
        $self->adjustFrame($newAngle->getValue());
}

use org::allbinary::direction::Direction;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::math::Angle;
use org::allbinary::math::AngleFactory;
use org::allbinary::math::AngleInfo;
use org::allbinary::animation::VectorBaseRotationAnimation;

1;

