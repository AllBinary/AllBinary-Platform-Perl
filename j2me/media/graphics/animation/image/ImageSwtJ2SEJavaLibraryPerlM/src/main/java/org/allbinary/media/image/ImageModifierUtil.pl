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
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{imageCopyUtil} = 'org::allbinary::media::image::ImageCopyUtil'->getInstance();
    $self->{features} = 'org::allbinary::game::configuration::feature::Features'->getInstance();
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
        my $newBufferedImage = undef;
        if ($image->isMutable()) {
            my $swtImage = $image;
            $newBufferedImage = $swtImage->getImage();
        } else {
            my $swtImage = $image;
            $newBufferedImage = $swtImage->getImage();
        }
        my $r = $basicColor->{red};
        my $g = $basicColor->{green};
        my $b = $basicColor->{blue};
        my $width = $image->getWidth();
        my $height = $image->getHeight();
        my $imageData = $newBufferedImage->getImageData();
        if ($imageData->{depth} == 24) {
            my $rx = 0;
            my $gx = 0;
            my $bx = 0;
            my $index3 = 0;
            for (my $index = 0; $index < $width; $index++) {
                for (my $index2 = 0; $index2 < $height; $index2++) {
                    $index3 = ($index2 * $imageData->{bytesPerLine}) + ($index * 4);
                    $rx = ($imageData->{data}->[$index3] & 0xFF) << 16;
                    $gx = ($imageData->{data}->[$index3 + 1] & 0xFF) << 8;
                    $bx = ($imageData->{data}->[$index3 + 2] & 0xFF);
                    if ($rx != 0 || $gx != 0 || $bx != 0) {
                        $imageData->{data}->[$index3] = ((int($r) + 128) % 256 - 128);
                        $imageData->{data}->[$index3 + 1] = ((int($g) + 128) % 256 - 128);
                        $imageData->{data}->[$index3 + 2] = ((int($b) + 128) % 256 - 128);
                    }
                }
            }
        }
}


sub changeColor {
    my ($self, $unusedOriginalImage, $image, $imageIndex, $basicColor) = @_;
        if ($self->{features}->isFeature('org::allbinary::graphics::opengles::OpenGLFeatureFactory'->getInstance()->{OPENGL})) {
            if ($image->getType() >= $org::allbinary::image::opengles::OpenGLESImage::TYPE) {
                my $openGLESImage = ($image);
                $openGLESImage->{imageProcessor} = 'org::allbinary::image::opengles::ModifierOpenGLESImageProcessor'->getInstance();
                $openGLESImage->{openGLESImageProperties}->{redf} = $basicColor->getRedComponent();
                $openGLESImage->{openGLESImageProperties}->{greenf} = $basicColor->getGreenComponent();
                $openGLESImage->{openGLESImageProperties}->{bluef} = $basicColor->getBlueComponent();
                return;
            }
        }
        my $newBufferedImage = undef;
        if ($image->isMutable()) {
            my $swtImage = $image;
            $newBufferedImage = $swtImage->getImage();
        } else {
            my $swtImage = $image;
            $newBufferedImage = $swtImage->getImage();
        }
        my $MAX = 255.0;
        my $r = ($basicColor->{red}) / $MAX;
        my $g = ($basicColor->{green}) / $MAX;
        my $b = ($basicColor->{blue}) / $MAX;
        my $rx = 0;
        my $gx = 0;
        my $bx = 0;
        my $imageData = $newBufferedImage->getImageData();
        if ($imageData->{depth} == 24) {
            my $size = scalar(@{$imageData->{data}});
            for (my $index = 0; $index < $size; $index += 4) {
                $rx = ($imageData->{data}->[$index] & 0xFF) << 16;
                $gx = ($imageData->{data}->[$index + 1] & 0xFF) << 8;
                $bx = ($imageData->{data}->[$index + 2] & 0xFF);
                $rx = int($rx * $r);
                $gx = int($gx * $g);
                $bx = int($bx * $b);
                $imageData->{data}->[$index] = ((int($rx) + 128) % 256 - 128);
                $imageData->{data}->[$index + 1] = ((int($gx) + 128) % 256 - 128);
                $imageData->{data}->[$index + 2] = ((int($bx) + 128) % 256 - 128);
            }
        }
}


sub setAlpha {
    my ($self, $unusedOriginalImage, $image, $imageIndex, $alphaInt) = @_;
        if ($self->{features}->isFeature('org::allbinary::graphics::opengles::OpenGLFeatureFactory'->getInstance()->{OPENGL})) {
            if ($image->getType() >= $org::allbinary::image::opengles::OpenGLESImage::TYPE) {
                my $openGLESImage = ($image);
                $openGLESImage->{imageProcessor} = 'org::allbinary::image::opengles::ModifierOpenGLESImageProcessor'->getInstance();
                $openGLESImage->{openGLESImageProperties}->{alphaf} = ($alphaInt) / 255;
                return;
            }
        }
        $self->setAlphaSWT($image, $alphaInt);
}


sub setAlphaSWT {
    my ($self, $image, $alphaInt) = @_;
        my $alpha = ((int($alphaInt) + 128) % 256 - 128);
        my $newBufferedImage = undef;
        if ($image->isMutable()) {
            my $swtImage = $image;
            $newBufferedImage = $swtImage->getImage();
        } else {
            my $swtImage = $image;
            $newBufferedImage = $swtImage->getImage();
        }
        $newBufferedImage->getImageData()->{alpha} = $alpha;
}


sub getImageArray {
    my ($self, $originalImageArray) = @_;
        try {
            my $newImageArray = [(undef) x (scalar(@{$originalImageArray}))];
            my $size = scalar(@{$newImageArray});
            my $originalImage = undef;
            for (my $index = 0; $index < $size; $index++) {
                $originalImage = $originalImageArray->[$index];
                my $image = $self->{imageCopyUtil}->createImage($originalImage);
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

# use javax::microedition::lcdui::Image;
use org::allbinary::game::configuration::feature::Features;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::graphics::opengles::OpenGLFeatureFactory;
use org::allbinary::image::opengles::ModifierOpenGLESImageProcessor;
use org::allbinary::image::opengles::OpenGLESImage;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::logic::communication::log::PreLogUtil;
use org::eclipse::swt::graphics::ImageData;
use org::microemu::device::swt::SwtImmutableImage;
use org::microemu::device::swt::SwtMutableImage;
use org::allbinary::media::image::ImageCopyUtil;

1;

