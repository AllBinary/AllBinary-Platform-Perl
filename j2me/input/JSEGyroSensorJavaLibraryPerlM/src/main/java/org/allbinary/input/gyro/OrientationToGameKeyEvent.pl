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

package org::allbinary::input::gyro::OrientationToGameKeyEvent;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{allBinaryGyroSensor} = undef;
    $self->{MIN} = 15;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        if ('org::allbinary::game::configuration::feature::Features'->getInstance()->isFeature('org::allbinary::game::configuration::feature::SensorFeatureFactory'->getInstance()->{NO_ORIENTATION})) {
            $self->{allBinaryGyroSensor} = 'org::allbinary::input::gyro::NoGyroSensor'->new();
        } else {
            die ("Not Such Feature");
        }
    return $self;
}


sub setAllBinaryGyroSensor {
    my ($self, $allBinaryGyroSensor) = @_;
        $self->{allBinaryGyroSensor} = $allBinaryGyroSensor;
}


sub getAllBinaryGyroSensor {
    my ($self) = @_;
        return $self->{allBinaryGyroSensor};
}


# throws Exception
sub process {
    my ($self) = @_;
}


# throws Exception
sub updateGameKeyEvents {
    my ($self, $orientation, $yaw, $pitch, $roll) = @_;
}

use org::allbinary::game::configuration::feature::Features;
use org::allbinary::game::configuration::feature::SensorFeatureFactory;
use org::allbinary::logic::math::Orientation;
use org::allbinary::input::gyro::NoGyroSensor;

1;

