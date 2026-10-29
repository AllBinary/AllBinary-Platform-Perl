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

package org::allbinary::input::AllBinarySensorManager;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT};

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{ORIENTATION_SENSOR_INPUT} = "Orientation Sensor Input";
    $self->{ORIENTATION_TYPE} = "Orientation Type";
    $self->{list} = 'org::allbinary::util::BasicArrayListD'->new();
}


sub getInstance {
    my ($class) = @_;
        if ($org::allbinary::input::AllBinarySensorManager::instance == 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT}) {
            $org::allbinary::input::AllBinarySensorManager::instance = 'org::allbinary::input::AllBinarySensorManager'->new();
        }
        return $org::allbinary::input::AllBinarySensorManager::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        try {
            'org::allbinary::input::gyro::GyroSensorFactory'->init();
            'org::allbinary::input::accelerometer::AccelerometerSensorFactory'->init();
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{CONSTRUCTOR}, $e);
        }
    return $self;
}


sub init {
    my ($self) = @_;
}


sub getSensorNamesList {
    my ($self) = @_;
        return $self->{list};
}


sub shutdown {
    my ($self) = @_;
}

use org::allbinary::input::accelerometer::AccelerometerSensorFactory;
use org::allbinary::input::gyro::GyroSensorFactory;
use org::allbinary::logic::NullUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;

1;

