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

package org::allbinary::media::image::comparison::ChangedPixelsUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $START_X = 0;
our $START_Y = 0;
our $OFFSET = 0;
our $SCAN_SIZE = 0;
our $CLEAR_INT_ARRAY = [(0) x (1800 * 1600)];


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


# throws Exception
sub generateBufferedImageChacheables {
    my ($class, $imageComparisonInfo) = @_;
        my $bufferedImageCacheables = undef;
        my $originalBufferedImage = $imageComparisonInfo->getBufferedImages()->[0];
        $bufferedImageCacheables = [(undef) x (2)];
        my $bufferedImageInfo = 'org::allbinary::media::image::cache::BufferedImageInfoFactory'->getInstance($imageComparisonInfo->{imageWidth}, $imageComparisonInfo->{imageHeight}, $originalBufferedImage->getType());
        my $poolInterface = 'org::allbinary::media::image::cache::BufferedImagePoolSingleton'->getInstance();
        for (my $index = 0; $index < scalar(@{$bufferedImageCacheables}); $index++) {
            my $bufferedImageCacheable = $poolInterface->remove($bufferedImageInfo);
            $bufferedImageCacheables->[$index] = $bufferedImageCacheable;
            $bufferedImageCacheables->[$index]->getBufferedImage()->setRGB($org::allbinary::media::image::comparison::ChangedPixelsUtil::START_X, $org::allbinary::media::image::comparison::ChangedPixelsUtil::START_Y, $bufferedImageInfo->getWidth(), $bufferedImageInfo->getHeight(), $org::allbinary::media::image::comparison::ChangedPixelsUtil::CLEAR_INT_ARRAY, $org::allbinary::media::image::comparison::ChangedPixelsUtil::OFFSET, $org::allbinary::media::image::comparison::ChangedPixelsUtil::SCAN_SIZE);
        }
        my $vector = $imageComparisonInfo->getNonMatchingPixelVector();
        my $size = $vector->size();
        for (my $index = 0; $index < $size; $index++) {
            my $pixelDelta = $vector->get($index);
            if (!defined($pixelDelta->getColorDelta())) {
                print("ColorDelta");
                exit(0);
            }
            $bufferedImageCacheables->[0]->getBufferedImage()->setRGB($pixelDelta->getPoint()->getX(), $pixelDelta->getPoint()->getY(), $pixelDelta->getColorDelta()->getRgb1());
            $bufferedImageCacheables->[1]->getBufferedImage()->setRGB($pixelDelta->getPoint()->getX(), $pixelDelta->getPoint()->getY(), $pixelDelta->getColorDelta()->getRgb2());
        }
        return $bufferedImageCacheables;
}

# use java::awt::image::BufferedImage;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::logic::util::cache::PoolInterface;
use org::allbinary::media::image::cache::BufferedImageCacheable;
use org::allbinary::media::image::cache::BufferedImageInfo;
use org::allbinary::media::image::cache::BufferedImageInfoFactory;
use org::allbinary::media::image::cache::BufferedImagePoolSingleton;
use org::allbinary::media::image::comparison::pixel::PixelDelta;
use java::lang::System;

1;

