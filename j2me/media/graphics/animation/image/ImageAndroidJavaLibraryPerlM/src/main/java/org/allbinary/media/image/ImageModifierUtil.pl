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


sub _init_fields {
    my ($self) = @_;
    $self->{paint} = 'android::graphics::Paint'->new($android::graphics::Paint::ANTI_ALIAS_FLAG);
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstanceOrCreate {
    my ($class) = @_;
        return 'org::allbinary::media::image::ImageModifierUtil'->new();
}


sub setColor {
    my ($self, $unusedOriginalImage, $image, $imageIndex, $basicColor) = @_;
        $self->{paint}->setColorFilter('android::graphics::PorterDuffColorFilter'->new(int($basicColor), $android::graphics::PorterDuff::Mode->{SRC_IN}));
}


sub changeColor {
    my ($self, $unusedOriginalImage, $image, $imageIndex, $basicColor) = @_;
        $self->{paint}->setColorFilter('android::graphics::PorterDuffColorFilter'->new(int($basicColor), $android::graphics::PorterDuff::Mode->{SRC_IN}));
}


sub setAlpha {
    my ($self, $originalImage, $image, $imageIndex, $alphaInt) = @_;
        if ($alphaInt != $self->{paint}->getAlpha()) {
            $self->{paint}->setAlpha($alphaInt);
        }
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

use android::graphics::Paint;
use android::graphics::PorterDuff;
use android::graphics::PorterDuffColorFilter;
# use javax::microedition::lcdui::Image;
use org::allbinary::graphics::color::BasicColor;

1;

