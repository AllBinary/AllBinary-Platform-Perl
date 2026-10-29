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

package org::allbinary::input::gyro::SingleSensorGameUpdateProcessor;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::input::gyro::SensorGameUpdateProcessor';


sub _init_fields {
    my ($self) = @_;
    $self->{accelerometerSensorUpdateProcessor} = 'org::allbinary::input::gyro::AccelerometerSensorUpdateProcessor'->new();
    $self->{gyroSensorUpdateProcessor} = 'org::allbinary::input::gyro::GyroSensorUpdateProcessor'->new();
}

sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
    return $self;
}


# throws Exception
sub process {
    my ($self, $anyType) = @_;
        $self->setNoSensors();
}


# throws Exception
sub sendNotifications {
    my ($self, $anyType) = @_;
}

use org::allbinary::canvas::Processor;
use org::allbinary::input::gyro::SensorGameUpdateProcessor;
use org::allbinary::input::gyro::AccelerometerSensorUpdateProcessor;
use org::allbinary::input::gyro::GyroSensorUpdateProcessor;

1;

