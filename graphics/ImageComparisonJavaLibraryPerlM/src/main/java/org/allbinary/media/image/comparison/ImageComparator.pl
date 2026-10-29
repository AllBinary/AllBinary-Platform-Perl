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

package org::allbinary::media::image::comparison::ImageComparator;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use POSIX ();
use List::Util ();


sub _init_fields {
    my ($self) = @_;
    $self->{imageComparatorConstraintsInterface} = undef;
}


sub new {
    my ($class, $imageComparatorConstraintsInterface) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{imageComparatorConstraintsInterface} = $imageComparatorConstraintsInterface;
    return $self;
}


# throws Exception
sub process {
    my ($self, $imageComparisonInfo, $point) = @_;
        my $isCollsionWithAvoidRectangles = $self->{imageComparatorConstraintsInterface}->isCollisionWithAvoidRectangles($point);
        if (!$isCollsionWithAvoidRectangles) {
            my $rgb1 = $imageComparisonInfo->getBufferedImages()->[0]->getRGB($point->getX(), $point->getY());
            my $rgb2 = $imageComparisonInfo->getBufferedImages()->[1]->getRGB($point->getX(), $point->getY());
            my $automaticCacheInterface = 'org::allbinary::graphics::color::ColorCacheFactory'->getInstance();
            my $colorInteger = ("" . ($rgb1));
            my $colorCacheable = $automaticCacheInterface->get($colorInteger);
            my $color = $colorCacheable->getColor();
            my $colorInteger2 = ("" . ($rgb2));
            my $colorCacheable2 = $automaticCacheInterface->get($colorInteger);
            my $color2 = $colorCacheable->getColor();
            if ($self->{imageComparatorConstraintsInterface}->isColorAllowed(0, $point, $color) || $self->{imageComparatorConstraintsInterface}->isColorAllowed(1, $point, $color2)) {
                if (abs($rgb1 - $rgb2) <= $imageComparisonInfo->getTolerance()) {
                    $imageComparisonInfo->{pixelsThatMatch}++;
                } else {
                    $imageComparisonInfo->add('org::allbinary::media::image::comparison::pixel::PixelDeltaFactory'->getInstance($point->getX(), $point->getY(), $rgb1, $rgb2));
                }
            }
        } else {
            $imageComparisonInfo->{pixelsIgnored}++;
        }
}


# throws Exception
sub compare {
    my ($self, $bufferedImage1, $bufferedImage2, $frameOne, $frameTwo, $tolerance) = @_;
        return $self->compare($bufferedImage1, $bufferedImage2, $frameOne, $frameTwo, $tolerance, 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});
}


# throws Exception
# Java overloaded method: Perl keeps the last definition
sub compare {
    my ($self, $bufferedImage1, $bufferedImage2, $frameOne, $frameTwo, $tolerance, $name) = @_;
        if (!defined($bufferedImage1) || !defined($bufferedImage2)) {
            die ("Input images must not be null.");
        }
        my $imageComparisonInfo = 'org::allbinary::media::image::comparison::ImageComparisonResult'->new($name, $bufferedImage1, $bufferedImage2, $frameOne, $frameTwo, $tolerance);
        for (my $indexY = 0; $indexY < $imageComparisonInfo->{imageHeight}; $indexY++) {
            for (my $indexX = 0; $indexX < $imageComparisonInfo->{imageWidth}; $indexX++) {
                $self->process($imageComparisonInfo, 'org::allbinary::graphics::PointFactory'->getInstance()->createXY($indexX, $indexY));
                if ($imageComparisonInfo->getNonMatchingPixelVector()->size() > $self->{imageComparatorConstraintsInterface}->getMaxNonMatchingPixelDeltas()) {
                    last;
                }
            }
        }
        return $imageComparisonInfo;
}

# use java::awt;
# use java::awt::image::BufferedImage;
use org::allbinary::graphics::GPoint;
use org::allbinary::graphics::PointFactory;
use org::allbinary::graphics::color::ColorCacheFactory;
use org::allbinary::graphics::color::ColorCacheable;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::util::cache::AutomaticCacheInterface;
use org::allbinary::media::image::comparison::pixel::PixelDeltaFactory;
use org::allbinary::media::image::comparison::ImageComparisonResult;

1;

