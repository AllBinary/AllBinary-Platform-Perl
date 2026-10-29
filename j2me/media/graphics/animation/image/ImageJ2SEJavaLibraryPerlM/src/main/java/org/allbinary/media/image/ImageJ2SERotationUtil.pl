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

package org::allbinary::media::image::ImageJ2SERotationUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use POSIX ();
use List::Util ();

our $instance = 'org::allbinary::media::image::ImageJ2SERotationUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{imageUtil} = 'org::allbinary::media::image::ImageUtil'->getInstance();
    $self->{imageJ2SEUtil} = 'org::allbinary::media::image::ImageJ2SEUtil'->getInstance();
    $self->{TWO_PIE} = 2 * $Math::PI;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::media::image::ImageJ2SERotationUtil::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getRotatedImage {
    my ($self, $bufferedImage, $totalAngle) = @_;
        return $self->getRotatedImageRadians($bufferedImage, $self->{TWO_PIE} * $totalAngle / 360.0);
}


sub getRotatedImageRadians {
    my ($self, $bufferedImage, $radians) = @_;
        my $newBufferedImage = $self->{imageUtil}->create($bufferedImage->getWidth(undef), $bufferedImage->getHeight(undef));
        return $self->drawRotatedImageRadians($bufferedImage, $newBufferedImage, $newBufferedImage->createGraphics(), $radians);
}


sub drawRotatedImageRadians {
    my ($self, $bufferedImage, $newBufferedImage, $g, $radians) = @_;
        $g->rotate($radians, $newBufferedImage->getWidth(undef) / 2, $newBufferedImage->getHeight(undef) / 2);
        $g->drawImage($bufferedImage, 0, 0, $bufferedImage->getWidth(undef), $bufferedImage->getHeight(undef), undef);
        $g->dispose();
        return $newBufferedImage;
}


sub rotateImage {
    my ($self, $bufferedImage, $newBufferedImage, $totalAngle) = @_;
        my $g = $newBufferedImage->createGraphics();
        $g->setBackground($self->{imageJ2SEUtil}->{TRANSPARENT_COLOR});
        $g->clearRect(0, 0, $newBufferedImage->getWidth(), $newBufferedImage->getHeight());
        return $self->drawRotatedImageRadians($bufferedImage, $newBufferedImage, $g, $self->{TWO_PIE} * $totalAngle / 360.0);
}


sub createRotatedImage {
    my ($self, $bufferedImage, $newBufferedImage, $totalAngle) = @_;
        my $g = $newBufferedImage->createGraphics();
        return $self->drawRotatedImageRadians($bufferedImage, $newBufferedImage, $g, $self->{TWO_PIE} * $totalAngle / 360.0);
}


sub getRotatedImages {
    my ($self, $bufferedImage, $numberOfFrames, $totalAngle) = @_;
        my $bufferedImageArray = [(undef) x ($numberOfFrames)];
        my $arc = ($self->{TWO_PIE}) * $totalAngle / 360.0;
        my $size = scalar(@{$bufferedImageArray});
        for (my $index = 0; $index < $size; $index++) {
            my $radians = ($arc / $size) * $index;
            $bufferedImageArray->[$index] = $self->getRotatedImageRadians($bufferedImage, $radians);
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
        my $bufferedImage = $self->{imageUtil}->create($firstBufferedImage->getWidth(undef) * $columns, $firstBufferedImage->getHeight(undef) * $rows);
        my $g = $bufferedImage->createGraphics();
        my $columnIndex = 0;
        my $rowIndex = 0;
        my $nextBufferedImage = undef;
        for (my $index = 0; $index < $size; $index++) {
            if (int($index / 9) != 0 && $index % 9 == 0) {
                $rowIndex++;
                $columnIndex = 0;
            }
            $nextBufferedImage = $bufferedImageArray->[$index];
            $g->drawImage($nextBufferedImage, $nextBufferedImage->getWidth(undef) * $columnIndex, $nextBufferedImage->getHeight(undef) * $rowIndex, $nextBufferedImage->getWidth(undef), $nextBufferedImage->getHeight(undef), undef);
            $columnIndex++;
        }
        $g->dispose();
        return $bufferedImage;
}

# use java::awt::Graphics2D;
# use java::awt::Image;
# use java::awt::image::BufferedImage;
use org::allbinary::media::image::ImageUtil;
use org::allbinary::media::image::ImageJ2SEUtil;

1;

