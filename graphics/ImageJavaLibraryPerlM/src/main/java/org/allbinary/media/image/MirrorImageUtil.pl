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

package org::allbinary::media::image::MirrorImageUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::media::image::MirrorImageUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{imageUtil} = 'org::allbinary::media::image::ImageUtil'->getInstance();
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::media::image::MirrorImageUtil::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getImage {
    my ($self, $bufferedImage, $verticle, $horizontal) = @_;
        $self->{logUtil}->putF("Starting", $self, "getImage");
        my $newBufferedImage = $self->{imageUtil}->create($bufferedImage->getWidth(undef), $bufferedImage->getHeight(undef));
        my $g = $newBufferedImage->createGraphics();
        if ($verticle) {
            my $tx = 'java::awt::geom::AffineTransform'->getScaleInstance(1, -1);
            $tx->translate(0, -$bufferedImage->getHeight(undef));
            my $op = 'java::awt::image::AffineTransformOp'->new($tx, $java::awt::image::AffineTransformOp::TYPE_NEAREST_NEIGHBOR);
            $bufferedImage = $op->filter($bufferedImage, undef);
        }
        if ($horizontal) {
            my $tx = 'java::awt::geom::AffineTransform'->getScaleInstance(-1, 1);
            $tx->translate(-$bufferedImage->getWidth(undef), 0);
            my $op = 'java::awt::image::AffineTransformOp'->new($tx, $java::awt::image::AffineTransformOp::TYPE_NEAREST_NEIGHBOR);
            $bufferedImage = $op->filter($bufferedImage, undef);
        }
        $g->drawImage($bufferedImage, 0, 0, $bufferedImage->getWidth(undef), $bufferedImage->getHeight(undef), undef);
        $g->dispose();
        return $newBufferedImage;
}


sub getImages {
    my ($self, $bufferedImage, $verticle, $horizontal) = @_;
        my $width = $bufferedImage->getWidth();
        my $height = $bufferedImage->getHeight();
        my $cellHeight = $height;
        my $cellWidth = $height;
        my $numberOfFramesPerOrientation = int($width / $cellWidth);
        my $numberOfFrames = $numberOfFramesPerOrientation;
        if ($verticle) {
            $numberOfFrames *= 2;
        }
        if ($horizontal) {
            $numberOfFrames *= 2;
        }
        $self->{logUtil}->putF("numberOfFramesPerOrientation: " . $numberOfFramesPerOrientation . " numberOfFrames: " . $numberOfFrames, $self, "getImages");
        my $bufferedImageArray = [(undef) x ($numberOfFrames)];
        my $y = 0;
        for (my $index = 0; $index < $numberOfFramesPerOrientation; $index++) {
            my $x = $index * $cellWidth;
            $bufferedImageArray->[$index] = $bufferedImage->getSubimage($x, $y, $cellWidth, $cellHeight);
        }
        for (my $index = 0; $index < $numberOfFramesPerOrientation; $index++) {
            $bufferedImageArray->[$index + $numberOfFramesPerOrientation] = $self->getImage($bufferedImageArray->[$index], $verticle, $horizontal);
        }
        return $bufferedImageArray;
}

# use java::awt;
# use java::awt::geom::AffineTransform;
# use java::awt::image::AffineTransformOp;
# use java::awt::image::BufferedImage;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::media::image::ImageUtil;

1;

