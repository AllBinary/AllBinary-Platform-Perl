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

package org::allbinary::animation::image::ImageArrayAnimation;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::animation::IndexedAnimation';


sub _init_fields {
    my ($self) = @_;
    $self->{imageArray} = $javax::microedition::lcdui::NullImage::NULL_IMAGE_ARRAY;
    $self->{totalFrames} = 0;
    $self->{circularIndexUtil} = $org::allbinary::util::CircularIndexUtil::NULL_CIRCULAR_INDEX_UTIL;
    $self->{anchor} = $org::allbinary::graphics::Anchor::TOP_LEFT;
}


sub new {
    my ($class, $imageArray, $animationBehavior) = @_;
    my $self = $class->SUPER::new($animationBehavior);
    $self->_init_fields();
        # super(...) made $self above
        $self->setImageArray($imageArray);
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


sub getImage {
    my ($self, $index) = @_;
        return $self->{imageArray}->[$index];
}


sub getImageArray {
    my ($self) = @_;
        return $self->{imageArray};
}


sub setImageArray {
    my ($self, $imageArray) = @_;
        $self->{imageArray} = $imageArray;
        $self->{totalFrames} = scalar(@{$imageArray});
        $self->{circularIndexUtil} = 'org::allbinary::util::CircularIndexUtil'->createInstance($self->{totalFrames});
}


sub paintXY {
    my ($self, $graphics, $x, $y) = @_;
        $graphics->drawImage($self->{imageArray}->[$self->{circularIndexUtil}->getIndex()], $x, $y, $self->{anchor});
}

# use javax::microedition::lcdui::Graphics;
# use javax::microedition::lcdui::Image;
# use javax::microedition::lcdui::NullImage;
use org::allbinary::animation::AnimationBehavior;
use org::allbinary::animation::IndexedAnimation;
use org::allbinary::graphics::Anchor;
use org::allbinary::logic::math::PrimitiveIntUtil;
use org::allbinary::util::CircularIndexUtil;

1;

