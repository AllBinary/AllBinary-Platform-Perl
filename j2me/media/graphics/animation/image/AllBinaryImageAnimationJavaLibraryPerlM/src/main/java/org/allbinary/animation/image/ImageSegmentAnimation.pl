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

package org::allbinary::animation::image::ImageSegmentAnimation;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::animation::image::ImageAnimation';


sub _init_fields {
    my ($self) = @_;
    $self->{startX} = undef;
    $self->{startY} = undef;
    $self->{drawWidth} = undef;
    $self->{drawHeight} = undef;
    $self->{circularIndexUtil} = undef;
    $self->{sequenceArray} = undef;
}


sub new {
    my ($class, $image, $sequenceArray, $animationBehavior) = @_;
    my $self = $class->SUPER::new($image, $animationBehavior);
    $self->_init_fields();
        # super(...) made $self above
        $self->{startX} = 0;
        $self->{startY} = 0;
        $self->{drawWidth} = $self->getImage()->getWidth();
        $self->{drawHeight} = $self->getImage()->getHeight();
        $self->{circularIndexUtil} = 'org::allbinary::util::CircularIndexUtil'->createInstance($self->{drawHeight});
        $self->{sequenceArray} = $sequenceArray;
    return $self;
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
        return $self->{circularIndexUtil}->getSize();
}


sub setSequence {
    my ($self, $sequenceArray) = @_;
        $self->{sequenceArray} = $sequenceArray;
}


sub getSequence {
    my ($self) = @_;
        return $self->{sequenceArray};
}


sub paintXY {
    my ($self, $graphics, $x, $y) = @_;
}


sub getStartX {
    my ($self) = @_;
        return $self->{startX};
}


sub setStartX {
    my ($self, $startX) = @_;
        $self->{startX} = $startX;
}


sub getStartY {
    my ($self) = @_;
        return $self->{startY};
}


sub setStartY {
    my ($self, $startY) = @_;
        $self->{startY} = $startY;
}


sub getDrawWidth {
    my ($self) = @_;
        return $self->{drawWidth};
}


sub setDrawWidth {
    my ($self, $drawWidth) = @_;
        $self->{drawWidth} = $drawWidth;
}


sub getDrawHeight {
    my ($self) = @_;
        return $self->{drawHeight};
}


sub setDrawHeight {
    my ($self, $drawHeight) = @_;
        $self->{drawHeight} = $drawHeight;
}

# use javax::microedition::lcdui::Graphics;
# use javax::microedition::lcdui::Image;
use org::allbinary::animation::AnimationBehavior;
use org::allbinary::util::CircularIndexUtil;
use org::allbinary::animation::image::ImageAnimation;

1;

