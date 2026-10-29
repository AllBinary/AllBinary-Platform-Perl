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

package org::allbinary::input::gyro::GyroSensorFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $allBinaryGyroSensor = $org::allbinary::input::gyro::AllBinaryOrientationSensor::NULL_ALLBINARY_ORIENTATION_SENSOR;

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


# throws Exception
sub init {
    my ($class) = @_;
        $org::allbinary::input::gyro::GyroSensorFactory::allBinaryGyroSensor = 'org::allbinary::input::gyro::NoGyroSensor'->new();
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::input::gyro::GyroSensorFactory::allBinaryGyroSensor;
}

use org::allbinary::input::gyro::AllBinaryOrientationSensor;
use org::allbinary::input::gyro::NoGyroSensor;

1;

