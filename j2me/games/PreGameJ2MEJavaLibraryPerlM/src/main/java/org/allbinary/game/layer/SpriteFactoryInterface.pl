# 
# AllBinary Open License Version 1 
# Copyright (c) 2025 AllBinary 
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

# Java interface
package org::allbinary::game::layer::SpriteFactoryInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub createSprite {
    my ($self, $image, $frameWidth, $frameHeight) = @_;
    die "abstract method createSprite";
}

# use javax::microedition::lcdui::Image;
# use javax::microedition::lcdui::game::Sprite;

1;

