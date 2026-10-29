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

package org::allbinary::animation::image::TweenedImageAnimation;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::animation::IndexedAnimation';


sub _init_fields {
    my ($self) = @_;
    $self->{image} = undef;
    $self->{dx} = undef;
    $self->{dy} = undef;
    $self->{totalFrames} = undef;
    $self->{circularIndexUtil} = undef;
    $self->{anchor} = $org::allbinary::graphics::Anchor::TOP_LEFT;
}


sub new {
    my ($class, $image, $dx, $dy, $totalFrames, $animationBehavior) = @_;
    my $self = $class->SUPER::new($animationBehavior);
    $self->_init_fields();
        # super(...) made $self above
        $self->{image} = $image;
        $self->{dx} = $dx;
        $self->{dy} = $dy;
        $self->{totalFrames} = $totalFrames;
        $self->{circularIndexUtil} = 'org::allbinary::util::CircularIndexUtil'->createInstance($self->{totalFrames});
    return $self;
}


# throws Exception
sub getAnimationSize {
    my ($self) = @_;
        return $self->getSize();
}


sub nextFrame {
    my ($self) = @_;
        $self->{circularIndexUtil}->next();
}


sub previousFrame {
    my ($self) = @_;
        $self->{circularIndexUtil}->previous();
}


sub setFrame {
    my ($self, $index) = @_;
        $self->{circularIndexUtil}->setIndex($index);
}


sub getFrame {
    my ($self) = @_;
        return $self->{circularIndexUtil}->getIndex();
}


sub getSize {
    my ($self) = @_;
        return $self->{totalFrames};
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
        my $frame = $self->getFrame();
        my $currentX = $self->{dx} * $frame;
        my $currentY = $self->{dy} * $frame;
        $graphics->drawImage($self->{image}, $x + $currentX, $y + $currentY, $self->{anchor});
}


# throws Exception
sub close {
    my ($self) = @_;
        'org::allbinary::DisposalUtil'->getInstance()->disposeImage($self->{image});
}


# throws Throwable
sub finalize {
    my ($self) = @_;
        'org::allbinary::DisposalUtil'->getInstance()->disposeImage($self->{image});
}

# use javax::microedition::lcdui::Graphics;
# use javax::microedition::lcdui::Image;
use org::allbinary::DisposalUtil;
use org::allbinary::animation::AnimationBehavior;
use org::allbinary::animation::IndexedAnimation;
use org::allbinary::graphics::Anchor;
use org::allbinary::logic::math::PrimitiveIntUtil;
use org::allbinary::util::CircularIndexUtil;

1;

