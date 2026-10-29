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

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstanceOrCreate {
    my ($class) = @_;
        return $org::allbinary::media::image::ImageModifierUtil::instance;
}


sub setColor {
    my ($self, $unusedOriginalImage, $image, $imageIndex, $basicColor) = @_;
}


sub changeColor {
    my ($self, $unusedOriginalImage, $image, $imageIndex, $basicColor) = @_;
}


sub setAlpha {
    my ($self, $originalImage, $image, $imageIndex, $alphaInt) = @_;
}


sub getImageArray {
    my ($self, $originalImageArray) = @_;
        return $originalImageArray;
}


sub handleImage {
    my ($self, $imageArray, $index, $image) = @_;
}


sub reset {
    my ($self) = @_;
}

# use javax::microedition::lcdui::Image;
use org::allbinary::graphics::color::BasicColor;

1;

