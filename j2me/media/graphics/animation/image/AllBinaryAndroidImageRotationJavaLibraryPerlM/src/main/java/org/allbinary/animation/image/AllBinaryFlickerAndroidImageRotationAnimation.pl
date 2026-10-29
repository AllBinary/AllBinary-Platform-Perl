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

package org::allbinary::animation::image::AllBinaryFlickerAndroidImageRotationAnimation;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use POSIX ();
use parent -norequire,'org::allbinary::animation::image::ImageBaseRotationAnimation';


sub _init_fields {
    my ($self) = @_;
    $self->{imageModifierUtil} = 'org::allbinary::media::image::ImageModifierUtil'->getInstanceOrCreate();
    $self->{androidImageUtil} = 'org::allbinary::media::image::AndroidImageUtil'->getInstance();
    $self->{matrix} = 'android::graphics::Matrix'->new();
    $self->{halfWidth} = undef;
    $self->{halfHeight} = undef;
    $self->{increment} = undef;
    $self->{originalImage} = undef;
}


sub new {
    my ($class, $originalImage, $image, $angleInfo, $totalAngle, $animationBehavior) = @_;
    my $self = $class->SUPER::new($image, $angleInfo, $totalAngle, $animationBehavior);
    $self->_init_fields();
        # super(...) made $self above
        $self->{originalImage} = $originalImage;
        $self->{halfWidth} = (POSIX::floor(($image->getWidth()) / (2 ** (1))));
        $self->{halfHeight} = (POSIX::floor(($image->getHeight()) / (2 ** (1))));
        $self->{increment} = ((int(($self->{angleInfo}->getAngleIncrementInfo()->getAngleIncrement())) + 32768) % 65536 - 32768);
    return $self;
}


sub setBasicColorP {
    my ($self, $basicColor) = @_;
        my $changed = 0;
        if (!defined($self->getBasicColorP()) || int($self->getBasicColorP()) != int($basicColor)) {
            $self->{imageModifierUtil}->setColor($self->{originalImage}, $self->getImage(), 0, $basicColor);
            $changed = 1;
        }
        $self->SUPER::setBasicColorP($basicColor);
        if ($changed) {
            $self->{matrix}->setRotate(0.0, $self->{halfWidth}, $self->{halfHeight});
            $self->updateImage();
        }
}


sub changeBasicColor {
    my ($self, $basicColor) = @_;
        $self->setBasicColorP($basicColor);
}


sub setAlpha {
    my ($self, $alpha) = @_;
        my $changed = 0;
        if ($self->{alphaP} != $alpha) {
            $changed = 1;
        }
        $self->SUPER::setAlpha($alpha);
        $self->{imageModifierUtil}->setAlpha($self->{originalImage}, $self->getImage(), 0, $self->{alphaP});
        if ($changed) {
            $self->{matrix}->setRotate(0.0, $self->{halfWidth}, $self->{halfHeight});
            $self->updateImage();
        }
}


sub nextRotation {
    my ($self) = @_;
        $self->SUPER::nextRotation();
        $self->{matrix}->setRotate($self->{increment}, $self->{halfWidth}, $self->{halfHeight});
        $self->updateImage();
}


sub previousRotation {
    my ($self) = @_;
        $self->SUPER::previousRotation();
        $self->{matrix}->setRotate(-$self->{increment}, $self->{halfWidth}, $self->{halfHeight});
        $self->updateImage();
}


sub updateImage {
    my ($self) = @_;
        $self->{androidImageUtil}->rotate($self->getImage(), $self->{originalImage}, $self->{matrix}, $self->{imageModifierUtil}->{paint});
}


sub setFrame {
    my ($self, $index) = @_;
        my $currentFrame = $self->{circularIndexUtil}->getIndex();
        $self->{circularIndexUtil}->setIndex($index);
        my $newFrame = $self->{circularIndexUtil}->getIndex();
        $self->{angleInfo}->adjustAngle($newFrame);
        $self->{matrix}->setRotate(($newFrame - $currentFrame) * $self->{increment}, $self->{halfWidth}, $self->{halfHeight});
        $self->updateImage();
}

use android::graphics::Matrix;
# use javax::microedition::lcdui::Image;
use org::allbinary::animation::AnimationBehavior;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::math::AngleInfo;
use org::allbinary::media::image::AndroidImageUtil;
use org::allbinary::media::image::ImageModifierUtil;
use org::allbinary::animation::image::ImageBaseRotationAnimation;

1;

