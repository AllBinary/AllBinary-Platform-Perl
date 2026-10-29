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

package org::allbinary::media::image::AndroidImageUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::media::image::AndroidImageUtil'->new();

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::media::image::AndroidImageUtil::instance;
}


sub paintBitmap {
    my ($self, $bitmap, $originalBitmap, $paint) = @_;
        $bitmap->eraseColor($android::graphics::Color::TRANSPARENT);
        my $canvas = 'android::graphics::Canvas'->new();
        $canvas->setBitmap($bitmap);
        $canvas->drawBitmap($originalBitmap, 0.0, 0.0, $paint);
}


sub paint {
    my ($self, $image, $originalImage, $paint) = @_;
        my $androidImage = $image;
        $androidImage->getBitmap()->eraseColor($android::graphics::Color::TRANSPARENT);
        my $canvas = $androidImage->getCanvas();
        my $originalAndroidImage = $originalImage;
        $canvas->drawBitmap($originalAndroidImage->getBitmap(), 0.0, 0.0, $paint);
}


sub rotate {
    my ($self, $image, $originalImage, $matrix, $paint) = @_;
        my $androidImage = $image;
        $androidImage->getBitmap()->eraseColor($android::graphics::Color::TRANSPARENT);
        my $canvas = $androidImage->getCanvas();
        $canvas->concat($matrix);
        my $originalAndroidImage = $originalImage;
        $canvas->drawBitmap($originalAndroidImage->getBitmap(), 0.0, 0.0, $paint);
}

use android::graphics::Bitmap;
use android::graphics::Canvas;
use android::graphics::Color;
use android::graphics::Matrix;
use android::graphics::Paint;
# use javax::microedition::lcdui::Image;
use org::microemu::android::device::AndroidImageInterface;

1;

