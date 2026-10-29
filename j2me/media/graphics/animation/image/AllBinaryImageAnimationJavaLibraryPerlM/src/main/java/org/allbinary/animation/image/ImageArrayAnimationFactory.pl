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

package org::allbinary::animation::image::ImageArrayAnimationFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::animation::AnimationInterfaceFactoryInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{dx} = 0;
    $self->{dy} = 0;
    $self->{imageArray} = undef;
    $self->{animationBehaviorFactory} = undef;
}


sub new {
    my ($class, $imageArray, $dx, $dy, $animationBehaviorFactory) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{imageArray} = $imageArray;
        $self->{animationBehaviorFactory} = $animationBehaviorFactory;
        $self->{dx} = $dx;
        $self->{dy} = $dy;
    return $self;
}


# throws Exception
sub getInstance {
    my ($self, $instanceId) = @_;
        if ($self->{dx} != 0 || $self->{dy} != 0) {
            return 'org::allbinary::animation::image::AdjustedImageArrayAnimation'->new($self->{imageArray}, $self->{dx}, $self->{dy}, $self->{animationBehaviorFactory}->getOrCreateInstance());
        } else {
            return 'org::allbinary::animation::image::ImageArrayAnimation'->new($self->{imageArray}, 'org::allbinary::animation::AnimationBehavior'->getInstance());
        }
}


sub setInitialScale {
    my ($self, $scaleProperties) = @_;
}

# use javax::microedition::lcdui::Image;
use org::allbinary::animation::Animation;
use org::allbinary::animation::AnimationBehavior;
use org::allbinary::animation::AnimationBehaviorFactory;
use org::allbinary::animation::AnimationInterfaceFactoryInterface;
use org::allbinary::logic::communication::log::ForcedLogUtil;
use org::allbinary::media::ScaleProperties;
use org::allbinary::animation::image::ImageArrayAnimation;
use org::allbinary::animation::image::AdjustedImageArrayAnimation;

1;

