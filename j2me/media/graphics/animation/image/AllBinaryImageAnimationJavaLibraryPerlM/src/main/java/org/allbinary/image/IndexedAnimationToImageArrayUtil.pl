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

package org::allbinary::image::IndexedAnimationToImageArrayUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


# throws Exception
sub getInstance {
    my ($class, $width, $height, $sequentialAnimationInterface) = @_;
        my $size = $sequentialAnimationInterface->getAnimationSize();
        my $imageArray = [(undef) x ($size)];
        for (my $index = 0; $index < $size; $index++) {
            $sequentialAnimationInterface->setFrame($index);
            $imageArray->[$index] = 'org::allbinary::image::AnimationFrameToImageUtil'->getInstance()->getInstanceWH($width, $height, $sequentialAnimationInterface);
        }
        return $imageArray;
}

# use javax::microedition::lcdui::Image;
use org::allbinary::animation::IndexedAnimation;
use org::allbinary::image::AnimationFrameToImageUtil;

1;

