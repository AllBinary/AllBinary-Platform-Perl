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
    $self->{imageUtil} = 'org::allbinary::media::image::ImageUtil'->getInstance();
    $self->{imageJ2SEUtil} = 'org::allbinary::media::image::ImageJ2SEUtil'->getInstance();
    $self->{imageCreationUtil} = 'org::allbinary::media::image::ImageCreationUtil'->getInstance();
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
        my $width = $originalImage->getWidth();
        my $height = $originalImage->getHeight();
        my $scaleX = $scaleNominatorX / $scaleDenominatorX;
        my $scaleY = $scaleNominatorY / $scaleDenominatorY;
        my $image = undef;
        if ($cached) {
            $image = $imageCache->get(ref($self), int(($width * $scaleX)), int(($height * $scaleY)));
        } else {
            $image = $imageCache->get("createImage", int(($width * $scaleX)), int(($height * $scaleY)));
        }
        $self->scale($originalImage, $image, $scaleX, $scaleY, 1);
        return $image;
}


# throws Exception
sub scale2 {
    my ($self, $originalImage, $originalImageArray, $ximageToShowArray, $unused, $scaleX, $scaleY, $maxScaleX, $maxScaleY) = @_;
        if ($maxScaleX * $originalImage->getWidth() > $originalImageArray->[0]->getWidth() || $maxScaleY * $originalImage->getHeight() > $originalImageArray->[0]->getHeight()) {
            $originalImageArray->[0] = $self->{imageCreationUtil}->createImage($originalImage->getWidth(), $originalImage->getHeight(), $maxScaleX, $maxScaleY);
        }
        $self->scale($originalImage, $originalImageArray->[0], $scaleX, $scaleY, 0);
}


sub scale {
    my ($self, $originalImage, $newMaxSizeImage, $scaleX, $scaleY, $clear) = @_;
        my $bufferedImage = $self->{imageUtil}->getBufferedImage($originalImage);
        my $newBufferedImage = $self->{imageUtil}->getBufferedImage($newMaxSizeImage);
        my $at = 'java::awt::geom::AffineTransform'->getScaleInstance($scaleX, $scaleY);
        my $g = $newBufferedImage->createGraphics();
        if ($clear) {
            $g->setBackground($self->{imageJ2SEUtil}->{TRANSPARENT_COLOR});
            $g->clearRect(0, 0, $newBufferedImage->getWidth(), $newBufferedImage->getHeight());
        }
        $g->drawRenderedImage($bufferedImage, $at);
        $g->dispose();
}

# use java::awt::Graphics2D;
# use java::awt::geom::AffineTransform;
# use java::awt::image::BufferedImage;
# use javax::microedition::lcdui::Image;
use org::allbinary::image::ImageCache;
use org::allbinary::media::image::ImageUtil;
use org::allbinary::media::image::ImageJ2SEUtil;
use org::allbinary::media::image::ImageCreationUtil;

1;

