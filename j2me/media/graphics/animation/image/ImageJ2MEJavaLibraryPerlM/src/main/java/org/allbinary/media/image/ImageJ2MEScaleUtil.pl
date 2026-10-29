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
use POSIX ();

our $instance = 'org::allbinary::media::image::ImageJ2MEScaleUtil'->new();


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::media::image::ImageJ2MEScaleUtil::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
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
        my $sourceWidth = $image->getWidth();
        my $sourceHeight = $image->getHeight();
        my $originalData = [(0) x ($image->getWidth() * $image->getHeight())];
        $image->getRGB($originalData, 0, $image->getWidth(), 0, 0, $image->getWidth(), $image->getHeight());
        my $scaledData = [(0) x ($width * $height)];
        my $heightRatioFactor = int((8 * $sourceHeight) / $height);
        my $widthRatioFactor = int((8 * $sourceWidth) / $width);
        my $scaledIndex = scalar(@{$scaledData}) - 1;
        my $dx = 0;
        my $dy = 0;
        for (my $index = $height; --$index >= 0; ) {
            $dy = POSIX::floor((($index * $heightRatioFactor)) / (2 ** (3)));
            for (my $index2 = $width; --$index2 >= 0; ) {
                $dx = POSIX::floor((($index2 * $widthRatioFactor)) / (2 ** (3)));
                $scaledData->[$scaledIndex--] = $originalData->[($sourceWidth * $dy) + $dx];
            }
        }
        my $scaledImage = 'javax::microedition::lcdui::Image'->createRGBImage($scaledData, $width, $height, 1);
        return $scaledImage;
}

# use javax::microedition::lcdui::Image;

1;

