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

package org::allbinary::animation::image::AllBinaryNoFlickerAndroidImageRotationAnimation;
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
    $self->{twoImages} = [(undef) x (2)];
    $self->{imageToShow} = undef;
    $self->{bufferedImageIndex} = 0;
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
        $self->{imageToShow} = $image;
        $self->{twoImages}->[0] = $image;
        $self->{twoImages}->[1] = 'org::allbinary::media::image::ImageCopyUtil'->getInstance()->createImage($image);
    return $self;
}


sub setBasicColorP {
    my ($self, $basicColor) = @_;
        my $changed = 0;
        if (!defined($self->getBasicColorP()) || int($self->getBasicColorP()) != int($basicColor)) {
            $self->{imageModifierUtil}->setColor($self->{originalImage}, $self->{imageToShow}, 0, $basicColor);
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
        $self->{imageModifierUtil}->setAlpha($self->{originalImage}, $self->{imageToShow}, 0, $self->{alphaP});
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
        $self->{androidImageUtil}->rotate($self->{twoImages}->[$self->{bufferedImageIndex}], $self->{originalImage}, $self->{matrix}, $self->{imageModifierUtil}->{paint});
        $self->swap();
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


sub swap {
    my ($self) = @_;
        $self->{imageToShow} = $self->{twoImages}->[$self->{bufferedImageIndex}];
        if ($self->{bufferedImageIndex} == 0) {
            $self->{bufferedImageIndex} = 1;
        } else {
            $self->{bufferedImageIndex} = 0;
        }
}


sub paintXY {
    my ($self, $graphics, $x, $y) = @_;
        $graphics->drawImage($self->{imageToShow}, $x, $y, $self->{anchor});
}

use android::graphics::Matrix;
# use javax::microedition::lcdui::Image;
# use javax::microedition::lcdui::Graphics;
use org::allbinary::math::AngleInfo;
use org::allbinary::animation::AnimationBehavior;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::media::image::AndroidImageUtil;
use org::allbinary::media::image::ImageCopyUtil;
use org::allbinary::media::image::ImageModifierUtil;
use org::allbinary::animation::image::ImageBaseRotationAnimation;

1;

