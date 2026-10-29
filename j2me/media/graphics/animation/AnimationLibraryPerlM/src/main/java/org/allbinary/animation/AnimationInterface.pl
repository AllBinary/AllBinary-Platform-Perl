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

# Java interface
package org::allbinary::animation::AnimationInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::graphics::paint::LocationPaintableInterface';



# throws Exception
sub nextFrame {
    my ($self) = @_;
    die "abstract method nextFrame";
}


sub paintThreedXYZ {
    my ($self, $graphics, $x, $y, $z) = @_;
    die "abstract method paintThreedXYZ";
}

# use javax::microedition::lcdui::Graphics;
use org::allbinary::graphics::paint::LocationPaintableInterface;

1;

