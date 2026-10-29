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

package org::allbinary::game::health::HealthBarAnimationInterfaceFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::animation::AnimationInterfaceFactoryInterface','org::allbinary::animation::ProceduralAnimationInterfaceFactoryInterface';



sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


# throws Exception
sub getInstanceByLocation {
    my ($self, $layerInterface, $location) = @_;
        return 'org::allbinary::game::health::HealthBarThreedAnimation'->new($layerInterface, $location);
}


# throws Exception
sub getInstance {
    my ($self, $instanceId) = @_;
        return undef;
}


# throws Exception
sub getInstanceAnimation {
    my ($self, $animationInterface) = @_;
        return undef;
}


sub setInitialScale {
    my ($self, $scaleProperties) = @_;
}

use org::allbinary::animation::Animation;
use org::allbinary::animation::AnimationInterfaceFactoryInterface;
use org::allbinary::animation::ProceduralAnimationInterfaceFactoryInterface;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::media::ScaleProperties;
use org::allbinary::game::health::HealthBarThreedAnimation;

1;

