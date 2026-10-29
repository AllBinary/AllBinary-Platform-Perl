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

package org::allbinary::media::image::ImageSwtRotationUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::media::image::ImageSwtRotationUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{imageUtil} = 'org::allbinary::media::image::ImageUtil'->getInstance();
    $self->{gameFeatureFactory} = 'org::allbinary::game::configuration::feature::GameFeatureFactory'->getInstance();
    $self->{features} = 'org::allbinary::game::configuration::feature::Features'->getInstance();
    $self->{NO_COPY} = "SWT should not copy images after initial loading as the alpha is not honored";
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::media::image::ImageSwtRotationUtil::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getRotatedImage {
    my ($self, $bufferedImage, $totalAngle) = @_;
        if (!$self->{features}->isFeature($self->{gameFeatureFactory}->{POST_IMAGE_LOADING_MODIFICATION})) {
            $self->{logUtil}->putF($self->{NO_COPY}, $self, $self->{commonStrings}->{CONSTRUCTOR});
            return $bufferedImage;
        }
        return $bufferedImage;
}


sub getRotatedImage2 {
    my ($self, $bufferedImage, $newBufferedImage, $gc, $angle) = @_;
        if (!$self->{features}->isFeature($self->{gameFeatureFactory}->{POST_IMAGE_LOADING_MODIFICATION})) {
            $self->{logUtil}->putF($self->{NO_COPY}, $self, $self->{commonStrings}->{CONSTRUCTOR});
            return $bufferedImage;
        }
        return $bufferedImage;
}


sub rotateImage {
    my ($self, $originalSwtImage, $newSwtImage, $gc, $totalAngle) = @_;
        return $self->getRotatedImage2($originalSwtImage, $newSwtImage, $gc, $totalAngle);
}


sub getRotatedImageSWT {
    my ($self, $bufferedImage, $newSwtImage, $gc, $totalAngle) = @_;
        return $self->getRotatedImage2($bufferedImage, $newSwtImage, $gc, $totalAngle);
}


sub getRotatedImages {
    my ($self, $bufferedImage, $numberOfFrames, $totalAngle) = @_;
        my $bufferedImageArray = [(undef) x ($numberOfFrames)];
        my $angle = 0;
        my $size = scalar(@{$bufferedImageArray});
        for (my $index = 0; $index < $size; $index++) {
            $angle = (int($totalAngle / $size)) * $index;
            $bufferedImageArray->[$index] = $self->getRotatedImage($bufferedImage, $angle);
        }
        return $bufferedImageArray;
}


sub createSpriteImage {
    my ($self, $bufferedImageArray) = @_;
        my $columns = 9;
        my $rows = 0;
        my $size = scalar(@{$bufferedImageArray});
        if ($size < $columns) {
            $columns = $size;
        }
        $rows = (int($size / $columns));
        if ($size % $columns != 0) {
            $rows++;
        }
        my $firstBufferedImage = $bufferedImageArray->[0];
        my $imageData = $firstBufferedImage->getImageData();
        my $bufferedImage = $self->{imageUtil}->create($imageData->{width} * $columns, $imageData->{height} * $rows);
        my $gc = 'org::eclipse::swt::graphics::GC'->new($bufferedImage);
        $gc->setAntialias($org::eclipse::swt::SWT::ON);
        $gc->setInterpolation($org::eclipse::swt::SWT::HIGH);
        my $columnIndex = 0;
        my $rowIndex = 0;
        my $nextBufferedImage = undef;
        for (my $index = 0; $index < $size; $index++) {
            if (int($index / 9) != 0 && $index % 9 == 0) {
                $rowIndex++;
                $columnIndex = 0;
            }
            $nextBufferedImage = $bufferedImageArray->[$index];
            $imageData = $nextBufferedImage->getImageData();
            $gc->drawImage($bufferedImage, 0, 0, $bufferedImage->getBounds()->{width}, $bufferedImage->getBounds()->{height}, $imageData->{width} * $columnIndex, $imageData->{height} * $rowIndex, $imageData->{width}, $imageData->{height});
            $columnIndex++;
        }
        $gc->dispose();
        return $bufferedImage;
}

use org::allbinary::game::configuration::feature::Features;
use org::allbinary::game::configuration::feature::GameFeatureFactory;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;
use org::eclipse::swt::SWT;
use org::eclipse::swt::graphics::GC;
use org::eclipse::swt::graphics::ImageData;
use org::allbinary::media::image::ImageUtil;

1;

