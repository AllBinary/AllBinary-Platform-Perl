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

package org::allbinary::animation::image::LazyImageRotationAnimationFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::animation::AnimationInterfaceFactoryInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{layoutIndex} = undef;
    $self->{animationInterfaceFactoryInterface} = undef;
    $self->{scaleProperties} = $org::allbinary::media::ScaleProperties::instance;
}


sub new {
    my ($class, $layoutIndex, $associatedLazyAnimationId, $animationInterfaceFactoryInterface) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{layoutIndex} = $layoutIndex;
        $self->{animationInterfaceFactoryInterface} = $animationInterfaceFactoryInterface;
        'org::allbinary::image::ImageCacheFactory'->getInstance()->{hasAnyLazyAnimationFactories} = 1;
        if ($self->{animationInterfaceFactoryInterface}->{animationBehaviorFactory} == 'org::allbinary::animation::AnimationBehaviorFactory'->getInstance()) {
            'org::allbinary::logic::communication::log::ForcedLogUtil'->log("Using default AnimationBehaviorFactory with IndexedAnimationFactory", $self);
        }
    return $self;
}


# throws Exception
sub getInstance {
    my ($self, $instanceId) = @_;
        if ($self->{animationInterfaceFactoryInterface}->getImage()->isReady()) {
            $self->{animationInterfaceFactoryInterface}->setInitialScale($self->{scaleProperties});
            return $self->{animationInterfaceFactoryInterface}->getInstance($instanceId);
        } else {
            return 'org::allbinary::animation::image::LazyImageRotationAnimation'->new($self->{layoutIndex}, $instanceId, $self->{scaleProperties}, $self->{animationInterfaceFactoryInterface}, $self->{animationInterfaceFactoryInterface}->{animationBehaviorFactory}->getOrCreateInstance());
        }
}


sub setInitialScale {
    my ($self, $scaleProperties) = @_;
        $self->{scaleProperties} = $scaleProperties;
}

use org::allbinary::animation::Animation;
use org::allbinary::animation::AnimationBehaviorFactory;
use org::allbinary::animation::AnimationInterfaceFactoryInterface;
use org::allbinary::image::ImageCacheFactory;
use org::allbinary::logic::communication::log::ForcedLogUtil;
use org::allbinary::media::ScaleProperties;
use org::allbinary::animation::image::LazyImageRotationAnimation;

1;

