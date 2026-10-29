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

package org::allbinary::animation::image::AllBinaryHTMLImageRotationAnimation;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::animation::image::ImageBaseRotationAnimation';


sub _init_fields {
    my ($self) = @_;
    $self->{imageRotationUtil} = 'org::allbinary::media::image::ImageRotationUtil'->getInstance();
    $self->{imageModifierUtil} = 'org::allbinary::media::image::ImageModifierUtil'->getInstanceOrCreate();
    $self->{originalImage} = undef;
    $self->{twoImages} = [(undef) x (2)];
    $self->{canvasSurfaceArray} = [(undef) x (2)];
    $self->{imageToShow} = undef;
    $self->{bufferedImageIndex} = 0;
    $self->{alphaProcessor} = 'org::allbinary::animation::image::AlphaBaseProcessor'->getInstance();
}


sub new {
    my ($class, $originalImage, $image, $angleInfo, $totalAngle, $animationBehavior) = @_;
    my $self = $class->SUPER::new($image, $angleInfo, $totalAngle, $animationBehavior);
    $self->_init_fields();
        # super(...) made $self above
        $self->{originalImage} = $originalImage;
        $self->{imageToShow} = $image;
        $self->{twoImages}->[0] = $image;
        $self->{twoImages}->[1] = 'org::allbinary::media::image::ImageCopyUtil'->getInstance()->createImage($image);
        $self->{canvasSurfaceArray}->[0] = $self->getCanvasSurface($self->{twoImages}->[0]);
        $self->{canvasSurfaceArray}->[1] = $self->getCanvasSurface($self->{twoImages}->[1]);
    return $self;
}


sub getCanvasSurface {
    my ($self, $image) = @_;
        my $htmlImage = $image;
        my $canvasImage = $htmlImage->getImage();
        my $playN = 'playn::core::PlayN'->getInstance();
        my $canvas = ($playN->graphics())->get($canvasImage);
        $canvas->translate($self->{originalImage}->getWidth() / 2, $self->{originalImage}->getHeight() / 2);
        return $canvas;
}


sub setBasicColorP {
    my ($self, $basicColor) = @_;
        my $changed = 0;
        if (!defined($self->getBasicColorP()) || int($self->getBasicColorP()) != int($basicColor)) {
            $changed = 1;
        }
        $self->SUPER::setBasicColorP($basicColor);
        if ($changed) {
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
        my $canvasSurface = $self->{canvasSurfaceArray}->[$self->{bufferedImageIndex}];
        $canvasSurface->save();
        $self->{imageRotationUtil}->rotateImageCanvasSurfaceClear($self->{originalImage}, $self->{twoImages}->[$self->{bufferedImageIndex}], $canvasSurface, $self->{angleInfo}->getAngle() + 90);
        $self->{alphaProcessor}->setAlpha($self->{imageModifierUtil}, $self->{originalImage}, $self->{twoImages}->[$self->{bufferedImageIndex}], $self->{alphaP});
        $self->{imageRotationUtil}->drawImage($self->{originalImage}, $self->{imageToShow}, $canvasSurface);
        $canvasSurface->restore();
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

# use javax::microedition::lcdui::Graphics;
# use javax::microedition::lcdui::Image;
use org::allbinary::animation::AnimationBehavior;
use org::allbinary::math::AngleInfo;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::media::image::ImageCopyUtil;
use org::allbinary::media::image::ImageModifierUtil;
use org::allbinary::media::image::ImageRotationUtil;
use org::microemu::device::playn::PlaynMutableImage;
use playn::core::Canvas;
use playn::core::ImageImpl;
use playn::core::PlayN;
use playn::html::HtmlGraphics;
use playn::html::HtmlImage;
use org::allbinary::animation::image::ImageBaseRotationAnimation;
use org::allbinary::animation::image::AlphaBaseProcessor;
use org::allbinary::animation::image::AlphaProcessor;

1;

