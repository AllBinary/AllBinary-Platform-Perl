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

package org::allbinary::game::layer::AdvancedRTSProperties;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{shakeListener} = undef;
    $self->{vibration} = undef;
    $self->{duration} = undef;
    $self->{waypointBehaviorBase} = undef;
}


sub createPropertiesSimulated {
    my ($class) = @_;
        return 'org::allbinary::game::layer::AdvancedRTSProperties'->new($org::allbinary::animation::transition::shake::NoShakeAnimationListener::NO_SHAKE_ANIMATION_LISTENER, $org::allbinary::media::AllBinaryNoVibration::NO_VIBRATION, 0, 'org::allbinary::game::layer::WaypointBehaviorBase'->new());
}


sub createProperties {
    my ($class) = @_;
        return 'org::allbinary::game::layer::AdvancedRTSProperties'->new('org::allbinary::animation::transition::shake::ShakeAnimationListenerFactory'->getInstance(), 'org::allbinary::media::AllBinaryVibration'->getInstance(), int('org::allbinary::game::configuration::GameConfigurationCentral'->getInstance()->{VIBRATION}->getValue()) * 100, 'org::allbinary::game::layer::WaypointBehaviorBase'->new());
}


sub new {
    my ($class, $shakeListener, $vibration, $duration, $waypointBehaviorBase) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{shakeListener} = $shakeListener;
        $self->{vibration} = $vibration;
        $self->{duration} = $duration;
        $self->{waypointBehaviorBase} = $waypointBehaviorBase;
    return $self;
}

use org::allbinary::animation::transition::shake::NoShakeAnimationListener;
use org::allbinary::animation::transition::shake::ShakeAnimationListener;
use org::allbinary::animation::transition::shake::ShakeAnimationListenerFactory;
use org::allbinary::game::configuration::GameConfigurationCentral;
use org::allbinary::game::tick::TickableInterface;
use org::allbinary::media::AllBinaryNoVibration;
use org::allbinary::media::AllBinaryVibration;
use org::allbinary::media::AllBinaryVibrationME;
use org::allbinary::game::layer::WaypointBehaviorBase;

1;

