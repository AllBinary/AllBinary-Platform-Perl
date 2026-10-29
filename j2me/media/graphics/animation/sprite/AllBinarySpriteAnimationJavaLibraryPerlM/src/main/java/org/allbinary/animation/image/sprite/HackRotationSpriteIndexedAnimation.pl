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

package org::allbinary::animation::image::sprite::HackRotationSpriteIndexedAnimation;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::animation::RotationAnimation';


sub _init_fields {
    my ($self) = @_;
    $self->{sprite} = undef;
    $self->{image} = undef;
}


sub new {
    my ($class, $sprite, $image, $angleInfo, $animationBehavior) = @_;
    my $self = $class->SUPER::new($angleInfo, 'org::allbinary::util::CircularIndexUtil'->createInstance(360 / $angleInfo->getAngleIncrementInfo()->getAngleIncrement()), $animationBehavior);
    $self->_init_fields();
        # super(...) made $self above
        $self->{sprite} = $sprite;
        $self->{image} = $image;
    return $self;
}


# throws Exception
sub getAnimationSize {
    my ($self) = @_;
        return $self->getSize();
}


sub paintFrame {
    my ($self, $g, $frame, $x, $y) = @_;
        $self->setFrame($frame);
        $self->paintXY($g, $x, $y);
}


sub paintXY {
    my ($self, $g, $x, $y) = @_;
        $self->{sprite}->setPosition($x, $y);
        $self->paint($g);
}


sub paint {
    my ($self, $g) = @_;
        $self->{sprite}->paint($g);
}


sub nextRotation {
    my ($self) = @_;
        $self->{sprite}->nextFrame();
}


sub previousRotation {
    my ($self) = @_;
        $self->{sprite}->prevFrame();
}


sub getSize {
    my ($self) = @_;
        return $self->{sprite}->getRawFrameCount();
}


sub setFrame {
    my ($self, $frame) = @_;
        $self->{sprite}->setFrame($frame);
}


sub getFrame {
    my ($self) = @_;
        return $self->{sprite}->getFrame();
}


sub setSequence {
    my ($self, $sequence) = @_;
}


sub getSequence {
    my ($self) = @_;
        return 'org::allbinary::logic::math::PrimitiveIntUtil'->getArrayInstance();
}

# use javax::microedition::lcdui::Graphics;
# use javax::microedition::lcdui::Image;
# use javax::microedition::lcdui::game::Sprite;
use org::allbinary::animation::AnimationBehavior;
use org::allbinary::animation::RotationAnimation;
use org::allbinary::logic::math::PrimitiveIntUtil;
use org::allbinary::math::AngleInfo;
use org::allbinary::util::CircularIndexUtil;

1;

