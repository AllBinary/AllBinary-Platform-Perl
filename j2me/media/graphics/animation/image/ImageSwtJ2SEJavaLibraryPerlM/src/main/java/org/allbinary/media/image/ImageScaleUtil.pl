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
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{imageCopyUtil} = 'org::allbinary::media::image::ImageCopyUtil'->getInstance();
    $self->{gameFeatureFactory} = 'org::allbinary::game::configuration::feature::GameFeatureFactory'->getInstance();
    $self->{features} = 'org::allbinary::game::configuration::feature::Features'->getInstance();
    $self->{NO_COPY} = "SWT should not copy images after initial loading as the alpha is not honored";
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
        if (!$self->{features}->isFeature($self->{gameFeatureFactory}->{POST_IMAGE_LOADING_MODIFICATION})) {
            $self->{logUtil}->putF($self->{NO_COPY}, $self, $self->{commonStrings}->{CONSTRUCTOR});
            return $originalImage;
        }
        my $width = $originalImage->getWidth();
        my $height = $originalImage->getHeight();
        my $scaleX = $scaleNominatorX / $scaleDenominatorX;
        my $scaleY = $scaleNominatorY / $scaleDenominatorY;
        my $scaledImage = $self->{imageCopyUtil}->createImageWH($originalImage, int(($scaleX * $width)), int(($scaleY * $height)), $mutable);
        return $scaledImage;
}


# throws Exception
sub scale2 {
    my ($self, $originalImage, $originalImageArray, $ximageToShowArray, $unused, $scaleX, $scaleY, $maxScaleX, $maxScaleY) = @_;
        $self->scale($originalImage, $originalImageArray, $ximageToShowArray, $unused, $scaleX, $scaleY, $maxScaleX, $maxScaleY, 1);
}


# throws Exception
sub scale {
    my ($self, $originalImage, $originalImageArray, $ximageToShowArray, $unused, $scaleX, $scaleY, $maxScaleX, $maxScaleY, $mutable) = @_;
        my $width = $originalImage->getWidth();
        my $height = $originalImage->getHeight();
        my $scaledImage = $self->{imageCopyUtil}->createImageWH($originalImage, int(($scaleX * $width)), int(($scaleY * $height)), $mutable);
        $originalImageArray->[0] = $scaledImage;
}

# use javax::microedition::lcdui::Image;
use org::allbinary::game::configuration::feature::Features;
use org::allbinary::game::configuration::feature::GameFeatureFactory;
use org::allbinary::image::ImageCache;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::media::image::ImageCopyUtil;

1;

