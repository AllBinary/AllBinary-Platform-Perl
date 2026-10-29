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

package org::allbinary::animation::image::AllBinaryJ2SEImageRotationAnimation;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::animation::image::ImageBaseRotationAnimation';


sub _init_fields {
    my ($self) = @_;
    $self->{imageRotationUtil} = 'org::allbinary::media::image::ImageRotationUtil'->getInstance();
    $self->{imageModifierUtil} = 'org::allbinary::media::image::ImageModifierUtil'->getInstanceOrCreate();
    $self->{realOriginalImage} = undef;
    $self->{originalImageArray} = [(undef) x (1)];
    $self->{twoImages} = [(undef) x (2)];
    $self->{imageToShow} = undef;
    $self->{bufferedImageIndex} = 0;
    $self->{lastScaleX} = 1.0;
    $self->{lastScaleY} = 1.0;
    $self->{scaleX} = 1.0;
    $self->{scaleY} = 1.0;
    $self->{maxScaleX} = 0.0;
    $self->{maxScaleY} = 0.0;
    $self->{alphaProcessor} = 'org::allbinary::animation::image::ModifierBaseProcessor'->getInstance();
    $self->{setColorProcessor} = 'org::allbinary::animation::image::ModifierBaseProcessor'->getInstance();
    $self->{changeColorProcessor} = 'org::allbinary::animation::image::ModifierBaseProcessor'->getInstance();
    $self->{scaleProcessor} = 'org::allbinary::animation::image::ScaleProcessor'->getInstance();
}


sub new {
    my ($class, $originalImage, $image, $angleInfo, $totalAngle, $animationBehavior) = @_;
    my $self = $class->SUPER::new($image, $angleInfo, $totalAngle, $animationBehavior);
    $self->_init_fields();
        # super(...) made $self above
        $self->{realOriginalImage} = $originalImage;
        $self->{originalImageArray}->[0] = $originalImage;
        $self->{imageToShow} = $image;
        $self->{twoImages}->[0] = $image;
        $self->{twoImages}->[1] = 'org::allbinary::media::image::ImageCopyUtil'->getInstance()->createImageForRotation($image);
    return $self;
}


sub setBasicColorP {
    my ($self, $basicColor) = @_;
        my $changed = 0;
        if (!defined($self->getBasicColorP()) || int($self->getBasicColorP()) != int($basicColor)) {
            $changed = 1;
        }
        $self->SUPER::setBasicColorP($basicColor);
        if ($changed) {
            $self->{setColorProcessor} = 'org::allbinary::animation::image::SetColorProcessor'->getInstance();
            $self->updateImage();
        }
}


sub changeBasicColor {
    my ($self, $basicColor) = @_;
        my $changed = 0;
        if (!defined($self->getChangeBasicColor()) || int($self->getChangeBasicColor()) != int($basicColor)) {
            $changed = 1;
        }
        $self->SUPER::changeBasicColor($basicColor);
        if ($changed) {
            $self->{changeColorProcessor} = 'org::allbinary::animation::image::ChangeColorProcessor'->getInstance();
            $self->updateImage();
        }
}


sub setAlpha {
    my ($self, $alpha) = @_;
        my $changed = 0;
        if ($self->{alphaP} != $alpha) {
            $changed = 1;
        }
        $self->SUPER::setAlpha($alpha);
        if ($changed) {
            $self->{alphaProcessor} = 'org::allbinary::animation::image::AlphaProcessor'->getInstance();
            $self->updateImage();
        }
}


sub setScale {
    my ($self, $scaleX, $scaleY) = @_;
        $self->{scaleX} = $scaleX;
        $self->{scaleY} = $scaleY;
        if ($self->{scaleX} != $self->{lastScaleX} || $self->{scaleY} != $self->{lastScaleY}) {
            $self->{scaleProcessor}->update($self->{realOriginalImage}, $self->{originalImageArray}, $self->{twoImages}, $self->{bufferedImageIndex}, $self->{scaleX}, $self->{scaleY}, $self->{maxScaleX}, $self->{maxScaleY});
            $self->updateImage();
        }
        $self->{lastScaleX} = $self->{scaleX};
        $self->{lastScaleY} = $self->{scaleY};
}


sub setMaxScale {
    my ($self, $maxScaleX, $maxScaleY) = @_;
        $self->{maxScaleX} = $maxScaleX;
        $self->{maxScaleY} = $maxScaleY;
        $self->{scaleProcessor}->update($self->{realOriginalImage}, $self->{originalImageArray}, $self->{twoImages}, $self->{bufferedImageIndex}, $self->{scaleX}, $self->{scaleY}, $self->{maxScaleX}, $self->{maxScaleY});
        $self->updateImage();
}


sub nextRotation {
    my ($self) = @_;
        $self->SUPER::nextRotation();
        $self->updateImage();
}


sub previousRotation {
    my ($self) = @_;
        $self->SUPER::previousRotation();
        $self->updateImage();
}


sub updateImage {
    my ($self) = @_;
        $self->{imageRotationUtil}->rotateImage($self->{originalImageArray}->[0], $self->{twoImages}->[$self->{bufferedImageIndex}], $self->{angleInfo}->getAngle() + 90);
        $self->{alphaProcessor}->updateAlpha($self->{imageModifierUtil}, $javax::microedition::lcdui::NullImage::NULL_IMAGE, $self->{twoImages}->[$self->{bufferedImageIndex}], 0, $self->{alphaP});
        $self->{setColorProcessor}->updateColor($self->{imageModifierUtil}, $javax::microedition::lcdui::NullImage::NULL_IMAGE, $self->{twoImages}->[$self->{bufferedImageIndex}], 0, $self->{basicColor});
        $self->{changeColorProcessor}->updateColor($self->{imageModifierUtil}, $javax::microedition::lcdui::NullImage::NULL_IMAGE, $self->{twoImages}->[$self->{bufferedImageIndex}], 0, $self->{changeBasicColorP});
        $self->swap();
}


sub setFrame {
    my ($self, $index) = @_;
        $self->SUPER::setFrame($index);
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


# throws Exception
sub close {
    my ($self) = @_;
        $self->SUPER::close();
        my $disposalUtil = 'org::allbinary::DisposalUtil'->getInstance();
        my $size2 = scalar(@{$self->{twoImages}});
        for (my $index = 0; $index < $size2; $index++) {
            $disposalUtil->disposeImage($self->{twoImages}->[$index]);
        }
        my $size = scalar(@{$self->{originalImageArray}});
        for (my $index = 0; $index < $size; $index++) {
            $disposalUtil->disposeImage($self->{originalImageArray}->[$index]);
        }
        $disposalUtil->disposeImage($self->{realOriginalImage});
        $disposalUtil->disposeImage($self->{imageToShow});
}


# throws Throwable
sub finalize {
    my ($self) = @_;
        $self->SUPER::finalize();
        my $disposalUtil = 'org::allbinary::DisposalUtil'->getInstance();
        my $size2 = scalar(@{$self->{twoImages}});
        for (my $index = 0; $index < $size2; $index++) {
            $disposalUtil->disposeImage($self->{twoImages}->[$index]);
        }
        my $size = scalar(@{$self->{originalImageArray}});
        for (my $index = 0; $index < $size; $index++) {
            $disposalUtil->disposeImage($self->{originalImageArray}->[$index]);
        }
        $disposalUtil->disposeImage($self->{realOriginalImage});
        $disposalUtil->disposeImage($self->{imageToShow});
}

# use javax::microedition::lcdui::Graphics;
# use javax::microedition::lcdui::Image;
# use javax::microedition::lcdui::NullImage;
use org::allbinary::DisposalUtil;
use org::allbinary::animation::AnimationBehavior;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::math::AngleInfo;
use org::allbinary::media::image::ImageCopyUtil;
use org::allbinary::media::image::ImageModifierUtil;
use org::allbinary::media::image::ImageRotationUtil;
use org::allbinary::animation::image::ImageBaseRotationAnimation;
use org::allbinary::animation::image::ModifierBaseProcessor;
use org::allbinary::animation::image::ScaleProcessor;
use org::allbinary::animation::image::SetColorProcessor;
use org::allbinary::animation::image::ChangeColorProcessor;
use org::allbinary::animation::image::AlphaProcessor;

1;

