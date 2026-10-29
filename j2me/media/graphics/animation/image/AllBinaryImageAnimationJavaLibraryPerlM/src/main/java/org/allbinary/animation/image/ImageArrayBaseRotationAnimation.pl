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

package org::allbinary::animation::image::ImageArrayBaseRotationAnimation;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::animation::RotationAnimation';


sub _init_fields {
    my ($self) = @_;
    $self->{imageModifierUtil} = 'org::allbinary::media::image::ImageModifierUtil'->getInstanceOrCreate();
    $self->{originalImageArray} = undef;
    $self->{imageArray} = $javax::microedition::lcdui::NullImage::NULL_IMAGE_ARRAY;
    $self->{currentImage} = undef;
    $self->{totalFrames} = 0;
    $self->{anchor} = $org::allbinary::graphics::Anchor::TOP_LEFT;
}


sub new {
    my ($class, $originalImageArray, $angleInfo, $animationBehavior) = @_;
    my $self = $class->SUPER::new($angleInfo, 'org::allbinary::util::CircularIndexUtil'->createInstance(360 / $angleInfo->getAngleIncrementInfo()->getAngleIncrement()), $animationBehavior);
    $self->_init_fields();
        # super(...) made $self above
        $self->{originalImageArray} = $originalImageArray;
        $self->setImageArray($self->{imageModifierUtil}->getImageArray($originalImageArray));
        $self->{currentImage} = $self->{imageArray}->[$self->{circularIndexUtil}->getIndex()];
    return $self;
}


# throws Exception
sub getAnimationSize {
    my ($self) = @_;
        return $self->getSize();
}


sub setAlpha {
    my ($self, $alpha) = @_;
        if ($self->{alphaP} != $alpha) {
            $self->SUPER::setAlpha($alpha);
            $self->{imageModifierUtil}->reset();
            my $index = $self->{circularIndexUtil}->getIndex();
            $self->{imageModifierUtil}->setAlpha($self->{originalImageArray}->[$index], $self->{imageArray}->[$index], $index, $self->{alphaP});
        }
}


sub nextRotation {
    my ($self) = @_;
        $self->SUPER::nextRotation();
        my $index = $self->{circularIndexUtil}->getIndex();
        $self->{imageModifierUtil}->setAlpha($self->{originalImageArray}->[$index], $self->{imageArray}->[$index], $index, $self->{alphaP});
        $self->{currentImage} = $self->{imageArray}->[$index];
}


sub previousRotation {
    my ($self) = @_;
        $self->SUPER::previousRotation();
        my $index = $self->{circularIndexUtil}->getIndex();
        $self->{imageModifierUtil}->setAlpha($self->{originalImageArray}->[$index], $self->{imageArray}->[$index], $index, $self->{alphaP});
        $self->{currentImage} = $self->{imageArray}->[$index];
}


sub setFrame {
    my ($self, $index2) = @_;
        $self->SUPER::setFrame($index2);
        my $index = $self->{circularIndexUtil}->getIndex();
        $self->{imageModifierUtil}->setAlpha($self->{originalImageArray}->[$index], $self->{imageArray}->[$index], $index, $self->{alphaP});
        $self->{currentImage} = $self->{imageArray}->[$index];
}


sub setSequence {
    my ($self, $sequence) = @_;
}


sub getSequence {
    my ($self) = @_;
        return 'org::allbinary::logic::math::PrimitiveIntUtil'->getArrayInstance();
}


sub setImageArray {
    my ($self, $imageArray) = @_;
        $self->{imageArray} = $imageArray;
        $self->{totalFrames} = scalar(@{$imageArray});
        $self->{circularIndexUtil} = 'org::allbinary::util::CircularIndexUtil'->createInstance($self->{totalFrames});
}


sub paintXY {
    my ($self, $graphics, $x, $y) = @_;
        $graphics->drawImage($self->{currentImage}, $x, $y, $self->{anchor});
}


# throws Exception
sub close {
    my ($self) = @_;
        my $disposalUtil = 'org::allbinary::DisposalUtil'->getInstance();
        my $size2 = scalar(@{$self->{imageArray}});
        for (my $index = 0; $index < $size2; $index++) {
            $disposalUtil->disposeImage($self->{imageArray}->[$index]);
        }
        my $size = scalar(@{$self->{originalImageArray}});
        for (my $index = 0; $index < $size; $index++) {
            $disposalUtil->disposeImage($self->{originalImageArray}->[$index]);
        }
        $disposalUtil->disposeImage($self->{currentImage});
}


# throws Throwable
sub finalize {
    my ($self) = @_;
        my $disposalUtil = 'org::allbinary::DisposalUtil'->getInstance();
        my $size2 = scalar(@{$self->{imageArray}});
        for (my $index = 0; $index < $size2; $index++) {
            $disposalUtil->disposeImage($self->{imageArray}->[$index]);
        }
        my $size = scalar(@{$self->{originalImageArray}});
        for (my $index = 0; $index < $size; $index++) {
            $disposalUtil->disposeImage($self->{originalImageArray}->[$index]);
        }
        $disposalUtil->disposeImage($self->{currentImage});
}

# use javax::microedition::lcdui::Graphics;
# use javax::microedition::lcdui::Image;
# use javax::microedition::lcdui::NullImage;
use org::allbinary::DisposalUtil;
use org::allbinary::animation::AnimationBehavior;
use org::allbinary::animation::RotationAnimation;
use org::allbinary::graphics::Anchor;
use org::allbinary::logic::math::PrimitiveIntUtil;
use org::allbinary::math::AngleInfo;
use org::allbinary::media::image::ImageModifierUtil;
use org::allbinary::util::CircularIndexUtil;

1;

