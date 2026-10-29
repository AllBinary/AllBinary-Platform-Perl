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

package org::allbinary::input::gyro::SensorGameUpdateProcessor;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{inputSensor} = 'org::allbinary::input::NoAllBinarySensor'->getInstance();
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub setInputSensor {
    my ($self, $inputSensor) = @_;
        $self->{inputSensor} = $inputSensor;
}


sub getInputSensor {
    my ($self) = @_;
        return $self->{inputSensor};
}


# throws Exception
sub process {
    my ($self, $anyType) = @_;
}


# throws Exception
sub sendNotifications {
    my ($self, $anyType) = @_;
}


sub isAnySensor {
    my ($self) = @_;
        if ($self->{inputSensor} == 'org::allbinary::input::NoAllBinarySensor'->getInstance()) {
            return 0;
        } else {
            return 1;
        }
}


sub setNoSensors {
    my ($self) = @_;
        $self->setInputSensor('org::allbinary::input::NoAllBinarySensor'->getInstance());
}

use org::allbinary::input::AllBinarySensor;
use org::allbinary::input::NoAllBinarySensor;

1;

