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

package org::allbinary::image::AnimationFactoryImageScaleUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::image::AnimationFactoryImageScaleUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{imageScaleUtil} = 'org::allbinary::media::image::ImageJ2MEScaleUtil'->getInstance();
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::image::AnimationFactoryImageScaleUtil::instance;
}


# throws Exception
sub createImage {
    my ($self, $image, $width, $height, $scaleWidth, $scaleHeight) = @_;
        my $scaledImage = undef;
        if ($scaleWidth != 0 && $scaleHeight != 0) {
            my $scaleX = ($scaleWidth) / ($width);
            my $scaleY = ($scaleHeight) / ($height);
            if (($scaleX == 1.0 && $scaleY == 1.0) || ($scaleX == 0.0 || $scaleY == 0.0)) {
                $scaledImage = $image;
            } else {
                my $scaledWidth = int(($scaleX * $width));
                my $scaledHeight = int(($scaleY * $height));
                $scaledImage = $self->{imageScaleUtil}->scale($image, $scaledWidth, $scaledHeight);
            }
        } else {
            $scaledImage = $image;
        }
        return $scaledImage;
}


# throws Exception
sub processAdjust {
    my ($self, $baseImageAnimationFactory) = @_;
        my $scaleProperties = $baseImageAnimationFactory->getScalePropertiesP();
        if ($scaleProperties->{scaleWidth} != 0 && $scaleProperties->{scaleHeight} != 0) {
            my $animationFactoryInitializationVisitor = $baseImageAnimationFactory->getAnimationFactoryInitializationVisitorP();
            my $scaleX = ($scaleProperties->{scaleWidth}) / ($animationFactoryInitializationVisitor->{width});
            my $scaleY = ($scaleProperties->{scaleHeight}) / ($animationFactoryInitializationVisitor->{height});
            if (($scaleX == 1.0 && $scaleY == 1.0) || ($scaleX == 0.0 || $scaleY == 0.0)) {
            } else {
                $animationFactoryInitializationVisitor->{dx} = int(($animationFactoryInitializationVisitor->{originalDx} * $scaleX));
                $animationFactoryInitializationVisitor->{dy} = int(($animationFactoryInitializationVisitor->{originalDy} * $scaleY));
            }
        } else {
        }
}

# use javax::microedition::lcdui::Image;
use org::allbinary::animation::image::AnimationFactoryInitializationVisitor;
use org::allbinary::animation::image::BaseImageAnimationFactory;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::media::ScaleProperties;
use org::allbinary::media::image::ImageJ2MEScaleUtil;
use org::allbinary::string::CommonLabels;
use org::allbinary::string::CommonStrings;

1;

