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

package org::allbinary::animation::NullSpecialAnimationFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::animation::AnimationInterfaceFactoryInterface','org::allbinary::animation::ProceduralAnimationInterfaceFactoryInterface';

our $NULL_SPECIAL_ANIMATION_FACTORY = 'org::allbinary::animation::NullSpecialAnimationFactory'->new();


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getFactoryInstance {
    my ($class) = @_;
        return $org::allbinary::animation::NullSpecialAnimationFactory::NULL_SPECIAL_ANIMATION_FACTORY;
}


# throws Exception
sub getInstance {
    my ($self, $instanceId) = @_;
        return 'org::allbinary::animation::special::SpecialAnimation'->getInstance();
}


# throws Exception
sub getInstanceAnimation {
    my ($self, $animationInterface) = @_;
        return 'org::allbinary::animation::special::SpecialAnimation'->getInstance();
}


sub setInitialScale {
    my ($self, $scaleProperties) = @_;
}

use org::allbinary::animation::special::SpecialAnimation;
use org::allbinary::media::ScaleProperties;
use org::allbinary::animation::AnimationInterfaceFactoryInterface;
use org::allbinary::animation::ProceduralAnimationInterfaceFactoryInterface;

1;

