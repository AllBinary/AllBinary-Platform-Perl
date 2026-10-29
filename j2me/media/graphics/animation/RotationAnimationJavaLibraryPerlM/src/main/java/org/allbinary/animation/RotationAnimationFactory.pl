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

package org::allbinary::animation::RotationAnimationFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::animation::AnimationInterfaceFactoryInterface','org::allbinary::animation::ProceduralAnimationInterfaceFactoryInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{totalAngle} = undef;
    $self->{angleIncrement} = undef;
}


sub createFactory {
    my ($class) = @_;
        my $totalAngle = 'org::allbinary::math::AngleFactory'->getInstance()->{TOTAL_ANGLE};
        return 'org::allbinary::animation::RotationAnimationFactory'->new($totalAngle, ((int(($totalAngle / 'org::allbinary::game::configuration::GameConfigurationCentral'->getInstance()->getGameControlFidelity())) + 32768) % 65536 - 32768));
}


sub new {
    my ($class, $totalAngle, $angleIncrement) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{totalAngle} = $totalAngle;
        $self->{angleIncrement} = $angleIncrement;
    return $self;
}


# throws Exception
sub getInstance {
    my ($self, $instanceId) = @_;
        return 'org::allbinary::animation::NullRotationAnimation'->createTotalAngle('org::allbinary::math::AngleInfo'->getInstance($self->{angleIncrement}), $self->{totalAngle}, 'org::allbinary::animation::AnimationBehavior'->getInstance());
}


# throws Exception
sub getInstanceAnimation {
    my ($self, $animationInterface) = @_;
        return 'org::allbinary::animation::NullRotationAnimation'->createTotalAngle('org::allbinary::math::AngleInfo'->getInstance($self->{angleIncrement}), $self->{totalAngle}, 'org::allbinary::animation::AnimationBehavior'->getInstance());
}


sub setInitialScale {
    my ($self, $scaleProperties) = @_;
}

use org::allbinary::game::configuration::GameConfigurationCentral;
use org::allbinary::math::AngleFactory;
use org::allbinary::math::AngleInfo;
use org::allbinary::media::ScaleProperties;
use org::allbinary::animation::AnimationInterfaceFactoryInterface;
use org::allbinary::animation::ProceduralAnimationInterfaceFactoryInterface;
use org::allbinary::animation::NullRotationAnimation;
use org::allbinary::animation::AnimationBehavior;

1;

