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

package org::allbinary::animation::image::ChangeColorProcessor;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::animation::image::ModifierBaseProcessor';

our $instanceC = 'org::allbinary::animation::image::ChangeColorProcessor'->new();

sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::animation::image::ChangeColorProcessor::instanceC;
}


sub updateColor {
    my ($self, $imageModifierUtil, $originalImage, $imageToShow, $index, $basicColor) = @_;
        $imageModifierUtil->changeColor($originalImage, $imageToShow, $index, $basicColor);
}

# use javax::microedition::lcdui::Image;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::media::image::ImageModifierUtil;
use org::allbinary::animation::image::ModifierBaseProcessor;

1;

