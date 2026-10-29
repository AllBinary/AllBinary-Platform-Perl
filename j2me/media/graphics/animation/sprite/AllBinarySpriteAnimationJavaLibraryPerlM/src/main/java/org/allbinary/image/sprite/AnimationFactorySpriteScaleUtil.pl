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

package org::allbinary::image::sprite::AnimationFactorySpriteScaleUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::image::sprite::AnimationFactorySpriteScaleUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{imageCache} = 'org::allbinary::image::ImageCacheFactory'->getInstance();
    $self->{imageScaleUtil} = 'org::allbinary::media::image::ImageScaleUtil'->getInstance();
    $self->{openGLUtil} = 'org::allbinary::graphics::opengles::OpenGLUtil'->getInstance();
    $self->{j2seMath} = 'org::allbinary::logic::math::J2SEMath'->getInstance();
    $self->{openGLESImageExclusionUtil} = 'org::allbinary::image::opengles::OpenGLESImageExclusionUtil'->getInstance();
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::image::sprite::AnimationFactorySpriteScaleUtil::instance;
}


# throws Exception
sub createImage {
    my ($self, $image, $width, $height, $scaleWidth, $scaleHeight) = @_;
        my $spriteFactory = 'org::allbinary::game::layer::SpriteFactory'->getInstance();
        my $sprite = undef;
        my $scaledImage = undef;
        if ($scaleWidth != 0 && $scaleHeight != 0) {
            my $scaleX = ($scaleWidth) / ($width);
            my $scaleY = ($scaleHeight) / ($height);
            if (($scaleX == 1.0 && $scaleY == 1.0) || ($scaleX == 0.0 || $scaleY == 0.0)) {
                $scaledImage = $self->{openGLUtil}->addImage($image);
                $sprite = $spriteFactory->createSprite($scaledImage, $width, $height);
            } else {
                if ($self->{openGLESImageExclusionUtil}->isCustomScaling($image)) {
                    my $width2 = $self->{j2seMath}->round(($scaleWidth) - 0.5);
                    my $height2 = $self->{j2seMath}->round(($scaleHeight) - 0.5);
                    my $multiplesOf16Width = int($width2 / 16);
                    my $by16Width = $multiplesOf16Width * 16;
                    $scaleX = ($by16Width) / $width;
                    my $multiplesOf16Height = int($height2 / 16);
                    my $by16Height = $multiplesOf16Height * 16;
                    $scaleY = ($by16Height) / $height;
                    if ($scaleWidth < $width) {
                        $scaleX = $scaleX * 2.35;
                    }
                    if ($scaleHeight < $height) {
                        $scaleY = $scaleY * 2.35;
                    }
                }
                $scaledImage = $self->{imageScaleUtil}->createImage2($self->{imageCache}, $image, $scaleX, 1.0, $scaleY, 1.0, 1);
                $sprite = $spriteFactory->createSprite($scaledImage, int(($width * $scaleX)), int(($height * $scaleY)));
            }
        } else {
            $scaledImage = $self->{openGLUtil}->addImage($image);
            $sprite = $spriteFactory->createSprite($scaledImage, $width, $height);
        }
        return $sprite;
}

# use javax::microedition::lcdui::Image;
# use javax::microedition::lcdui::game::Sprite;
use org::allbinary::game::layer::SpriteFactory;
use org::allbinary::graphics::opengles::OpenGLUtil;
use org::allbinary::image::ImageCache;
use org::allbinary::image::ImageCacheFactory;
use org::allbinary::image::opengles::OpenGLESImageExclusionUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::math::J2SEMath;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::media::image::ImageScaleUtil;
use org::allbinary::string::CommonLabels;
use org::allbinary::string::CommonStrings;

1;

