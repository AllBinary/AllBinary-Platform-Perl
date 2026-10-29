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

package org::allbinary::animation::image::ImageAnimationSingletonInterfaceFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::animation::SingletonAnimationInterfaceFactory';



sub new {
    my ($class, $animationInterface, $width, $height) = @_;
    my $self = $class->SUPER::new('org::allbinary::animation::image::ImageAnimation'->new('org::allbinary::image::AnimationFrameToImageUtil'->getInstance()->getInstanceWH($width, $height, $animationInterface), 'org::allbinary::animation::AnimationBehavior'->getInstance()));
        # super(...) made $self above
    return $self;
}

use org::allbinary::animation::Animation;
use org::allbinary::animation::AnimationBehavior;
use org::allbinary::animation::SingletonAnimationInterfaceFactory;
use org::allbinary::image::AnimationFrameToImageUtil;
use org::allbinary::animation::image::ImageAnimation;

1;

