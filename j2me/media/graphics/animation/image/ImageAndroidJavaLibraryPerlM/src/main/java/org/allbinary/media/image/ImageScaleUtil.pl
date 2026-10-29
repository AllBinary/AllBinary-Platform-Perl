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
    $self->{anchor} = $org::allbinary::graphics::Anchor::TOP_LEFT;
    $self->{imageBasicArrayList} = 'org::allbinary::util::BasicArrayListD'->new();
    $self->{scaledImageBasicArrayList} = 'org::allbinary::util::BasicArrayListD'->new();
    $self->{scaleXBasicArrayList} = 'org::allbinary::util::BasicArrayListD'->new();
    $self->{scaleYBasicArrayList} = 'org::allbinary::util::BasicArrayListD'->new();
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
        my $originalAndroidImage = $originalImage;
        my $originalBitmap = $originalAndroidImage->getBitmap();
        my $width = int(($originalBitmap->getWidth() * $scaleX));
        my $height = int(($originalBitmap->getHeight() * $scaleY));
        my $index = $self->{imageBasicArrayList}->indexOf($originalImage);
        my $alreadyAvailable = 0;
        if ($index >= 0) {
            my $scaleX2Float = $self->{scaleXBasicArrayList}->get($index);
            my $scaleX2 = $scaleX2Float;
            my $scaleY2Float = $self->{scaleYBasicArrayList}->get($index);
            my $scaleY2 = $scaleY2Float;
            if ($scaleX2 == $scaleX && $scaleY2 == $scaleY) {
                $alreadyAvailable = 1;
            }
        }
        if ($alreadyAvailable) {
            return $self->{scaledImageBasicArrayList}->get($index);
        } else {
            my $scaledImage = $self->getScaledImage($imageCache, $originalImage, $scaleX, $scaleY, $width, $height, $cached);
            $self->{imageBasicArrayList}->add($originalImage);
            $self->{scaledImageBasicArrayList}->add($scaledImage);
            $self->{scaleXBasicArrayList}->add($scaleX);
            $self->{scaleYBasicArrayList}->add($scaleY);
            return $scaledImage;
        }
}


# throws Exception
sub getScaledImage {
    my ($self, $imageCache, $originalImage, $scaleX, $scaleY, $width, $height, $cached) = @_;
        my $image = $javax::microedition::lcdui::NullImage::NULL_IMAGE;
        if ($cached) {
            $image = $imageCache->get(ref($self), $width, $height);
        } else {
            $image = $imageCache->get($self->{commonStrings}->{CREATE_IMAGE}, $width, $height);
        }
        if ($image->isMutable()) {
            my $matrix = 'android::graphics::Matrix'->new();
            $self->scale($image, $matrix, $scaleX, $scaleY);
            $image->getGraphics()->drawImage($originalImage, 0, 0, $self->{anchor});
            return $image;
        } else {
            die ("Not Mutable");
        }
}


sub scale {
    my ($self, $image, $matrix, $scaleX, $scaleY) = @_;
        $matrix->setScale($scaleX, $scaleY);
        my $canvas = ($image)->getCanvas();
        $canvas->concat($matrix);
}

use android::graphics::Bitmap;
use android::graphics::Canvas;
use android::graphics::Matrix;
# use javax::microedition::lcdui::Image;
# use javax::microedition::lcdui::NullImage;
use org::allbinary::graphics::Anchor;
use org::allbinary::image::ImageCache;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::microemu::android::device::AndroidImageInterface;

1;

