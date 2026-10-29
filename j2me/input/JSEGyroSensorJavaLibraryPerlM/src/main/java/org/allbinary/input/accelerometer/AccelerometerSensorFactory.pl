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

package org::allbinary::input::accelerometer::AccelerometerSensorFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $allBinaryAccelerometerSensor = undef;

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


# throws Exception
sub init {
    my ($class) = @_;
        my $features = 'org::allbinary::game::configuration::feature::Features'->getInstance();
        my $sensorFeatureFactory = 'org::allbinary::game::configuration::feature::SensorFeatureFactory'->getInstance();
        if ($features->isFeature($sensorFeatureFactory->{ORIENTATION_SENSORS})) {
            die ("No Orientation Sensors");
        } elsif ($features->isFeature($sensorFeatureFactory->{SIMULATED_ORIENTATION_SENSORS})) {
            die ("No Simulation Sensors");
        } elsif ($features->isFeature($sensorFeatureFactory->{NO_ORIENTATION})) {
            $org::allbinary::input::accelerometer::AccelerometerSensorFactory::allBinaryAccelerometerSensor = 'org::allbinary::input::accelerometer::NoAccelerometerSensor'->new();
        } else {
            die ("Not Such SensorFeature");
        }
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::input::accelerometer::AccelerometerSensorFactory::allBinaryAccelerometerSensor;
}

use org::allbinary::game::configuration::feature::Features;
use org::allbinary::game::configuration::feature::SensorFeatureFactory;
use org::allbinary::input::gyro::AllBinaryOrientationSensor;
use org::allbinary::input::accelerometer::NoAccelerometerSensor;

1;

