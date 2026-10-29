#
# AllBinary Open License Version 1
# Copyright (c) 2023 AllBinary
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

package org::allbinary::media::image::ImageJ2MEScaleUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::media::image::ImageJ2MEScaleUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::media::image::ImageJ2MEScaleUtil::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


# throws Exception
sub scaleArray {
    my ($self, $images, $width, $height) = @_;
        my $scaledImages = [(undef) x (scalar(@{$images}))];
        for (my $index = scalar(@{$images}); --$index >= 0; ) {
            $scaledImages->[$index] = $self->scale($images->[$index], $width, $height);
        }
        return $scaledImages;
}


# throws Exception
sub scale {
    my ($self, $image, $width, $height) = @_;
        my $originalPlayNImage = undef;
        if ($image->isMutable()) {
            my $originalHTMLImage = $image;
            $originalPlayNImage = $originalHTMLImage->getImage();
        } else {
            my $originalHTMLImage = $image;
            $originalPlayNImage = $originalHTMLImage->getImage();
        }
        my $scaledImage = 'javax::microedition::lcdui::Image'->createImageWH($width, $height);
        my $htmlImage = $scaledImage;
        my $scaledPlayNImage = $htmlImage->getImage();
        my $canvas = ('playn::core::PlayN'->getInstance()->graphics())->get($scaledPlayNImage);
        ($originalPlayNImage)->draw($canvas->gc(), 0, 0, $scaledImage->getWidth(), $scaledImage->getHeight(), 0, 0, $image->getWidth(), $image->getHeight());
        return $scaledImage;
}

# use javax::microedition::lcdui::Image;
use org::allbinary::logic::communication::log::LogUtil;
use org::microemu::device::playn::PlaynImmutableImage;
use org::microemu::device::playn::PlaynMutableImage;
use playn::core::Canvas;
use playn::core::CoreImage;
use playn::core::ImageImpl;
use playn::core::PlayN;
use playn::html::HtmlGraphics;
use playn::html::HtmlImage;

1;

