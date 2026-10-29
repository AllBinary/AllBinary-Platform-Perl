# 
# AllBinary Open License Version 1 
# Copyright (c) 2022 AllBinary 
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

package org::allbinary::media::image::ImageModifierUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::media::image::ImageModifierUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{imageUtil} = 'org::allbinary::media::image::ImageUtil'->getInstance();
    $self->{colorArray} = [(0) x (1)];
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstanceOrCreate {
    my ($class) = @_;
        return $org::allbinary::media::image::ImageModifierUtil::instance;
}


sub setBasicColorP {
    my ($self, $basicColor) = @_;
}


sub setColor {
    my ($self, $unusedOriginalImage, $image, $imageIndex, $basicColor) = @_;
        my $newBufferedImage = $self->{imageUtil}->getBufferedImage($image);
        my $r = $basicColor->{red};
        my $g = $basicColor->{green};
        my $b = $basicColor->{blue};
        my $width = $image->getWidth();
        my $height = $image->getHeight();
        my $colorModel = undef;
        my $dataElements = undef;
        my $ax = 0;
        my $rx = 0;
        my $gx = 0;
        my $bx = 0;
        for (my $index = 0; $index < $width; $index++) {
            for (my $index2 = 0; $index2 < $height; $index2++) {
                $colorModel = $newBufferedImage->getColorModel();
                $dataElements = $newBufferedImage->getRaster()->getDataElements($index, $index2, undef);
                $ax = $colorModel->getAlpha($dataElements);
                $rx = $colorModel->getRed($dataElements);
                $gx = $colorModel->getGreen($dataElements);
                $bx = $colorModel->getBlue($dataElements);
                if ($rx != 0 || $gx != 0 || $bx != 0) {
                    $newBufferedImage->setRGB($index, $index2, ($ax << 24) | ($r << 16) | ($g << 8) | ($b));
                }
            }
        }
}


sub changeColor {
    my ($self, $unusedOriginalImage, $image, $imageIndex, $basicColor) = @_;
        my $newBufferedImage = $self->{imageUtil}->getBufferedImage($image);
        my $MAX = 255.0;
        my $r = ($basicColor->{red}) / $MAX;
        my $g = ($basicColor->{green}) / $MAX;
        my $b = ($basicColor->{blue}) / $MAX;
        my $width = $image->getWidth();
        my $height = $image->getHeight();
        my $colorModel = undef;
        my $dataElements = undef;
        my $ax = 0;
        my $rx = 0;
        my $gx = 0;
        my $bx = 0;
        for (my $index = 0; $index < $width; $index++) {
            for (my $index2 = 0; $index2 < $height; $index2++) {
                $colorModel = $newBufferedImage->getColorModel();
                $dataElements = $newBufferedImage->getRaster()->getDataElements($index, $index2, undef);
                $ax = $colorModel->getAlpha($dataElements);
                $rx = $colorModel->getRed($dataElements);
                $gx = $colorModel->getGreen($dataElements);
                $bx = $colorModel->getBlue($dataElements);
                $rx = int($rx * $r);
                $gx = int($gx * $g);
                $bx = int($bx * $b);
                $newBufferedImage->setRGB($index, $index2, ($ax << 24) | ($rx << 16) | ($gx << 8) | ($bx));
            }
        }
}


sub setAlpha {
    my ($self, $unusedOriginalImage, $image, $imageIndex, $alphaInt) = @_;
        my $alpha = ((int($alphaInt) + 128) % 256 - 128);
        my $newBufferedImage = $self->{imageUtil}->getBufferedImage($image);
        my $width = $image->getWidth();
        my $height = $image->getHeight();
        my $raster = $newBufferedImage->getAlphaRaster();
        for (my $index = 0; $index < $width; $index++) {
            for (my $index2 = 0; $index2 < $height; $index2++) {
                $raster->getPixel($index, $index2, $self->{colorArray});
                $self->{colorArray}->[0] = $alpha & $self->{colorArray}->[0];
                $raster->setPixel($index, $index2, $self->{colorArray});
            }
        }
}


sub getImageArray {
    my ($self, $originalImageArray) = @_;
        try {
            my $newImageArray = [(undef) x (scalar(@{$originalImageArray}))];
            my $size = scalar(@{$newImageArray});
            my $originalImage = undef;
            for (my $index = 0; $index < $size; $index++) {
                $originalImage = $originalImageArray->[$index];
                my $image = 'org::allbinary::media::image::ImageCreationUtil'->getInstance()->createImageWH($originalImage->getWidth(), $originalImage->getHeight());
                $image->getGraphics()->drawImage($originalImage, 0, 0, $org::allbinary::graphics::Anchor::TOP_LEFT);
                $newImageArray->[$index] = $image;
            }
            return $newImageArray;
        } catch ($e) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            'org::allbinary::logic::communication::log::PreLogUtil'->putOE($commonStrings->{EXCEPTION}, $self, "getImageArray", $e);
            return $originalImageArray;
        }
}


sub handleImage {
    my ($self, $imageArray, $index, $image) = @_;
}


sub reset {
    my ($self) = @_;
}

# use java::awt::image::BufferedImage;
# use java::awt::image::ColorModel;
# use java::awt::image::WritableRaster;
# use javax::microedition::lcdui::Image;
use org::allbinary::graphics::Anchor;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::logic::communication::log::PreLogUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::media::image::ImageUtil;
use org::allbinary::media::image::ImageCreationUtil;

1;

