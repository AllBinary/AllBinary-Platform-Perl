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

package org::allbinary::media::image::ImageScaleUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::media::image::ImageScaleUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{playnUtil} = 'playn::html::HTMLPlaynUtil'->getInstance();
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::media::image::ImageScaleUtil::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


# throws Exception
sub createImage2 {
    my ($self, $imageCache, $originalImage, $scaleNominatorX, $scaleDenominatorX, $scaleNominatorY, $scaleDenominatorY, $cached) = @_;
        return $self->createImage3($imageCache, $originalImage, $scaleNominatorX, $scaleDenominatorX, $scaleNominatorY, $scaleDenominatorY, $cached, 1);
}


# throws Exception
sub createImage3 {
    my ($self, $imageCache, $originalImage, $scaleNominatorX, $scaleDenominatorX, $scaleNominatorY, $scaleDenominatorY, $cached, $mutable) = @_;
        my $scaleX = $scaleNominatorX / $scaleDenominatorX;
        my $scaleY = $scaleNominatorY / $scaleDenominatorY;
        return $self->createImage($imageCache, $originalImage, $scaleX, $scaleY, $cached);
}


# throws Exception
sub createImage {
    my ($self, $imageCache, $originalImage, $scaleX, $scaleY, $cached) = @_;
        return $self->createImageInternal($originalImage, $scaleX, $scaleY);
}


# throws Exception
sub createImageInternal {
    my ($self, $originalImage, $scaleX, $scaleY) = @_;
        my $image = 'org::allbinary::media::image::ImageCreationUtil'->getInstance()->createImageWH(int(($originalImage->getWidth() * $scaleX)), int(($originalImage->getHeight() * $scaleY)));
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
            my $canvas = $self->{playnUtil}->getCanvas($canvasImage);
            $canvas->drawScale($originalPlayNImage, 0, 0, $image->getWidth(), $image->getHeight(), 0, 0, $originalImage->getWidth(), $originalImage->getHeight());
            return $image;
        } else {
            die ("Not Mutable");
        }
}

# use javax::microedition::lcdui::Image;
use org::allbinary::image::ImageCache;
use org::microemu::device::playn::PlaynImmutableImage;
use org::microemu::device::playn::PlaynMutableImage;
use playn::core::Canvas;
use playn::core::CoreImage;
use playn::core::ImageImpl;
use playn::html::HTMLPlaynUtil;
use org::allbinary::media::image::ImageCreationUtil;

1;

