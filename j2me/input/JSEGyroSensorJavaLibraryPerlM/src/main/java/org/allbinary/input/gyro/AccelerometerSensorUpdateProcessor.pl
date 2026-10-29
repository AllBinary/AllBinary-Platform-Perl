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

package org::allbinary::input::gyro::AccelerometerSensorUpdateProcessor;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::canvas::Processor';


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    return $self;
}


# throws Exception
sub process {
    my ($self) = @_;
        my $sensorFeatureFactory = 'org::allbinary::game::configuration::feature::SensorFeatureFactory'->getInstance();
        if ('org::allbinary::game::configuration::feature::Features'->getInstance()->isFeature($sensorFeatureFactory->{ORIENTATION_SENSORS})) {
            'org::allbinary::input::accelerometer::AccelerometerSensorFactory'->getInstance()->setCompleteMotionGestureInputEventListener('org::allbinary::game::input::motion::action::SingleKeyPressGameKeyFromMotionGestureEventListener'->new());
        } elsif ('org::allbinary::game::configuration::feature::Features'->getInstance()->isFeature($sensorFeatureFactory->{SIMULATED_ORIENTATION_SENSORS})) {
            'org::allbinary::input::accelerometer::AccelerometerSensorFactory'->getInstance()->setCompleteMotionGestureInputEventListener('org::allbinary::game::input::motion::action::SingleKeyPressGameKeyFromMotionGestureEventListener'->new());
        } elsif ('org::allbinary::game::configuration::feature::Features'->getInstance()->isFeature($sensorFeatureFactory->{NO_ORIENTATION})) {
            'org::allbinary::input::accelerometer::AccelerometerSensorFactory'->getInstance()->setCompleteMotionGestureInputEventListener('org::allbinary::game::input::motion::action::NoCompleteMotionGestureInputEventListener'->getInstance());
        } else {
            die ("Sensor Feature Not Set");
        }
}

use org::allbinary::canvas::Processor;
use org::allbinary::game::configuration::feature::Features;
use org::allbinary::game::configuration::feature::SensorFeatureFactory;
use org::allbinary::game::input::motion::action::NoCompleteMotionGestureInputEventListener;
use org::allbinary::game::input::motion::action::SingleKeyPressGameKeyFromMotionGestureEventListener;
use org::allbinary::input::accelerometer::AccelerometerSensorFactory;

1;

