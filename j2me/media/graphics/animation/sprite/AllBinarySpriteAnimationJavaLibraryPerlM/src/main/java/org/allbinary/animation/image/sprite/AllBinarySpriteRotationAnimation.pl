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

package org::allbinary::animation::image::sprite::AllBinarySpriteRotationAnimation;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::animation::image::sprite::HackRotationSpriteIndexedAnimation';



sub new {
    my ($class, $sprite, $image, $animationBehavior) = @_;
    my $self = $class->SUPER::new($sprite, $image, 'org::allbinary::math::AngleInfo'->getInstance(((int(('org::allbinary::math::AngleFactory'->getInstance()->{TOTAL_ANGLE} / $sprite->getRawFrameCount())) + 32768) % 65536 - 32768)), $animationBehavior);
        # super(...) made $self above
        $self->{angleInfo}->adjustAngle($self->{sprite}->getFrame());
    return $self;
}


sub nextRotation {
    my ($self) = @_;
        $self->{sprite}->nextFrame();
        $self->{angleInfo}->adjustAngle($self->{sprite}->getFrame());
}


sub previousRotation {
    my ($self) = @_;
        $self->{sprite}->prevFrame();
        $self->{angleInfo}->adjustAngle($self->{sprite}->getFrame());
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
        $self->{sprite}->setFrame($index);
        $self->{angleInfo}->adjustAngle($self->getFrame());
}


sub adjustFrameToAngle {
    my ($self, $angle) = @_;
        $self->adjustFrame($angle->getValue());
}


sub adjustFrame {
    my ($self, $angle) = @_;
        $self->setFrame($self->{frameUtil}->getFrameForAngle($angle, int($self->{angleInfo}->getAngleIncrementInfo()->getAngleIncrement())));
}

# use javax::microedition::lcdui::Image;
# use javax::microedition::lcdui::game::Sprite;
use org::allbinary::animation::AnimationBehavior;
use org::allbinary::direction::Direction;
use org::allbinary::math::Angle;
use org::allbinary::math::AngleFactory;
use org::allbinary::math::AngleInfo;
use org::allbinary::animation::image::sprite::HackRotationSpriteIndexedAnimation;

1;

