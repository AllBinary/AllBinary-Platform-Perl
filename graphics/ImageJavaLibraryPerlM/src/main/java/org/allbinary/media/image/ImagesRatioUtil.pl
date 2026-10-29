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

package org::allbinary::media::image::ImagesRatioUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::media::image::ImagesRatioUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{imageUtil} = 'org::allbinary::media::image::ImageUtil'->getInstance();
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::media::image::ImagesRatioUtil::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub isEqual {
    my ($self, $bufferedImageArray, $totalImages) = @_;
        my $end = $totalImages;
        if (scalar(@{$bufferedImageArray}) < $totalImages) {
            $end = scalar(@{$bufferedImageArray});
        }
        my $ratio = ($bufferedImageArray->[0]->getWidth() / $bufferedImageArray->[0]->getHeight());
        for (my $index = 1; $index < $end; $index++) {
            if ($ratio != ($bufferedImageArray->[$index]->getWidth() / $bufferedImageArray->[$index]->getHeight())) {
                return 0;
            }
        }
        return 1;
}


sub getAverage {
    my ($self, $bufferedImageArray, $totalImages) = @_;
        my $ratio = 0.0;
        my $end = $totalImages;
        if (scalar(@{$bufferedImageArray}) < $totalImages) {
            $end = scalar(@{$bufferedImageArray});
        }
        for (my $index = 0; $index < $end; $index++) {
            $ratio += ($bufferedImageArray->[$index]->getWidth() / $bufferedImageArray->[$index]->getHeight());
        }
        return ($ratio / $end);
}


# throws Exception
sub fudge {
    my ($self, $bufferedImage, $ratio) = @_;
        my $imageRatio = ($bufferedImage->getWidth() / $bufferedImage->getHeight());
        my $point = 'org::allbinary::media::image::Point'->new();
        my $newHeight = $bufferedImage->getHeight();
        my $newWidth = $bufferedImage->getWidth();
        if ($ratio > $imageRatio) {
            $newWidth = int(($bufferedImage->getHeight() * $ratio));
            $point->{x} = ($newWidth - $bufferedImage->getWidth()) / 2;
        } else {
            $newHeight = int(($bufferedImage->getWidth() / $ratio));
            $point->{y} = ($newHeight - $bufferedImage->getHeight()) / 2;
        }
        my $commonLabels = 'org::allbinary::string::CommonLabels'->getInstance();
        $self->{logUtil}->putF($commonLabels->{WIDTH_LABEL} + $bufferedImage->getWidth() . " newWidth: " . $newWidth . $commonLabels->{HEIGHT_LABEL} . $bufferedImage->getHeight() . " newHeight: " . $newHeight . " needed ratio: " . ($newWidth / $newHeight), $self, "fudge");
        my $newBufferedImage = $self->{imageUtil}->create($newWidth, $newHeight);
        my $g = $newBufferedImage->createGraphics();
        if ($point->{x} > 0) {
            my $firstColumnBufferedImage = $bufferedImage->getSubimage(0, 0, 1, $bufferedImage->getHeight());
            my $lastColumnBufferedImage = $bufferedImage->getSubimage($bufferedImage->getWidth() - 1, 0, 1, $bufferedImage->getHeight());
            $self->{logUtil}->putF("Draw some columns to fill in gap", $self, "fudge");
            for (my $index = 0; $index < $point->{x}; $index++) {
                $g->drawImage($firstColumnBufferedImage, $index, 0, undef);
                $g->drawImage($lastColumnBufferedImage, $newWidth - $index, 0, undef);
            }
        }
        if ($point->{y} > 0) {
            my $firstRowBufferedImage = $bufferedImage->getSubimage(0, 0, $bufferedImage->getWidth(), 1);
            my $lastRowBufferedImage = $bufferedImage->getSubimage(0, $bufferedImage->getHeight() - 1, $bufferedImage->getWidth(), 1);
            $self->{logUtil}->putF("Draw some rows to fill in gap", $self, "fudge");
            for (my $index = 0; $index < $point->{y}; $index++) {
                $g->drawImage($firstRowBufferedImage, 0, $index, undef);
                $g->drawImage($lastRowBufferedImage, 0, $newHeight - $index, undef);
            }
        }
        $g->drawImage($bufferedImage, $point->{x}, $point->{y}, $bufferedImage->getWidth(), $bufferedImage->getHeight(), undef);
        return $newBufferedImage;
}


# throws Exception
# Java overloaded method: Perl keeps the last definition
sub fudge {
    my ($self, $bufferedImageArray, $totalImages, $ratio) = @_;
        my $end = $totalImages;
        if (scalar(@{$bufferedImageArray}) < $totalImages) {
            $end = scalar(@{$bufferedImageArray});
        }
        my $fudgedBufferedImageArray = [(undef) x ($end)];
        for (my $index = 0; $index < $end; $index++) {
            $fudgedBufferedImageArray->[$index] = $self->fudge($bufferedImageArray->[$index], $ratio);
        }
        return $fudgedBufferedImageArray;
}

# use java::awt;
# use java::awt::image::BufferedImage;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonLabels;
use org::allbinary::media::image::ImageUtil;
use org::allbinary::media::image::Point;

1;

