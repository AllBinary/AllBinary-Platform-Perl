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

package org::allbinary::media::image::ImageRotationUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use POSIX ();
use List::Util ();

our $instance = 'org::allbinary::media::image::ImageRotationUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{playnUtil} = 'playn::html::HTMLPlaynUtil'->getInstance();
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::media::image::ImageRotationUtil::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub rotateImage {
    my ($self, $originalImage, $image, $totalAngle) = @_;
        if ($image->isMutable()) {
            my $htmlImage = $image;
            my $canvasImage = $htmlImage->getImage();
            my $canvas = $self->{playnUtil}->getCanvas($canvasImage);
            $canvas->save();
            $canvas->clear();
            $canvas->translate($originalImage->getWidth() / 2, $originalImage->getHeight() / 2);
            my $image2 = $self->rotateImageCanvasSurface($originalImage, $image, $canvas, $totalAngle);
            $self->drawImage($originalImage, $image, $canvas);
            $canvas->restore();
            return $image2;
        } else {
            return undef;
        }
}


sub rotateImageCanvasSurfaceClear {
    my ($self, $originalImage, $image, $canvasSurface, $totalAngle) = @_;
        if ($image->isMutable()) {
            $canvasSurface->translate(-$originalImage->getWidth() / 2, -$originalImage->getHeight() / 2);
            $canvasSurface->clear();
            $canvasSurface->translate($originalImage->getWidth() / 2, $originalImage->getHeight() / 2);
            return $self->rotateImageCanvasSurface($originalImage, $image, $canvasSurface, $totalAngle);
        } else {
            return undef;
        }
}


sub rotateImageCanvasSurface {
    my ($self, $originalImage, $image, $canvasSurface, $totalAngle) = @_;
        if ($image->isMutable()) {
            $canvasSurface->rotate((($totalAngle) * 3.14159265358979 / 180));
            return $image;
        } else {
            return undef;
        }
}


sub drawImage {
    my ($self, $originalImage, $image, $canvasSurface) = @_;
        my $originalPlayNImage = undef;
        if ($originalImage->isMutable()) {
            my $originalHTMLImage = $originalImage;
            $originalPlayNImage = $originalHTMLImage->getImage();
        } else {
            my $originalHTMLImage = $originalImage;
            $originalPlayNImage = $originalHTMLImage->getImage();
        }
        $canvasSurface->draw($originalPlayNImage, -$originalImage->getWidth() / 2, -$originalImage->getHeight() / 2);
}


# throws Exception
sub createRotatedImage {
    my ($self, $originalImage, $rotationInDegrees) = @_;
        my $image = 'org::allbinary::media::image::ImageCreationUtil'->getInstance()->createImageWH($originalImage->getWidth(), $originalImage->getHeight());
        my $rotatedImage = $self->rotateImage($originalImage, $image, $rotationInDegrees);
        if (!defined($rotatedImage)) {
            die ("Not Mutable");
        }
        return $rotatedImage;
}

# use javax::microedition::lcdui::Image;
use org::microemu::device::playn::PlaynImmutableImage;
use org::microemu::device::playn::PlaynMutableImage;
use playn::core::Canvas;
use playn::core::CoreImage;
use playn::core::ImageImpl;
use playn::html::HTMLPlaynUtil;
use org::allbinary::media::image::ImageCreationUtil;

1;

