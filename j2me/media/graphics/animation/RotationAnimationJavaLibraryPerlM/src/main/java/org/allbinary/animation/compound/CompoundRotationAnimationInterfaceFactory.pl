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

package org::allbinary::animation::compound::CompoundRotationAnimationInterfaceFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::animation::compound::CompoundAnimationInterfaceFactory';



sub new {
    my ($class, $basicAnimationInterfaceFactoryInterfaceArray, $animationBehaviorFactory) = @_;
    my $self = $class->SUPER::new($basicAnimationInterfaceFactoryInterfaceArray, $animationBehaviorFactory);
        # super(...) made $self above
        if ($animationBehaviorFactory == 'org::allbinary::animation::AnimationBehaviorFactory'->getInstance()) {
            'org::allbinary::logic::communication::log::ForcedLogUtil'->log("Using default AnimationBehaviorFactory with IndexedAnimationFactory", $self);
        }
    return $self;
}


sub createArray {
    my ($self, $size) = @_;
        return [(undef) x ($size)];
}


sub createAnimation {
    my ($self, $animationInterfaceArray) = @_;
        return 'org::allbinary::animation::compound::CompoundRotationAnimation'->new($animationInterfaceArray, $self->{animationBehaviorFactory}->getOrCreateInstance());
}

use org::allbinary::animation::Animation;
use org::allbinary::animation::AnimationBehaviorFactory;
use org::allbinary::animation::AnimationInterfaceFactoryInterface;
use org::allbinary::animation::RotationAnimation;
use org::allbinary::logic::communication::log::ForcedLogUtil;
use org::allbinary::animation::compound::CompoundAnimationInterfaceFactory;
use org::allbinary::animation::compound::CompoundRotationAnimation;

1;

