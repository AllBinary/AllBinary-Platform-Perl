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


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::media::image::ImageRotationUtil::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


# throws Exception
sub createRotatedImage {
    my ($self, $originalImage, $rotationInDegrees) = @_;
        my $image = 'org::allbinary::media::image::ImageCreationUtil'->getInstance()->getInstance($originalImage->getWidth(), $originalImage->getHeight());
        if ($image->isMutable()) {
            my $originalPlayNImage = undef;
            if ($originalImage->isMutable()) {
                my $originalHTMLImage = $originalImage;
                $originalPlayNImage = $originalHTMLImage->getImage();
            } else {
                my $originalHTMLImage = $originalImage;
                $originalPlayNImage = $originalHTMLImage->getImage();
            }
            my $htmlImage = $image;
            my $canvasImage = $htmlImage->getImage();
            my $canvasSurface = $htmlImage->getCanvasSurface($canvasImage);
            $canvasSurface->translate($originalPlayNImage->width() / 2, $originalPlayNImage->height() / 2);
            $canvasSurface->rotate((($rotationInDegrees) * 3.14159265358979 / 180));
            $canvasSurface->drawImage($originalPlayNImage, -$originalPlayNImage->width() / 2, -$originalPlayNImage->height() / 2);
            return $image;
        } else {
            die ("Not Mutable");
        }
}

# use javax::microedition::lcdui::Image;
use org::microemu::device::playn::PlaynImmutableImage;
use org::microemu::device::playn::PlaynMutableImage;
use playn::core::CanvasImage;
use playn::core::CanvasSurface;
use org::allbinary::media::image::ImageCreationUtil;

1;

