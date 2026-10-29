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

package org::allbinary::game::configuration::feature::SensorFeatureFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::game::configuration::feature::SensorFeatureFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{NO_ORIENTATION} = 'org::allbinary::game::configuration::feature::SensorFeature'->new("No Orientation");
    $self->{ORIENTATION_SENSORS} = 'org::allbinary::game::configuration::feature::SensorFeature'->new("Orientation Sensors");
    $self->{SIMULATED_ORIENTATION_SENSORS} = 'org::allbinary::game::configuration::feature::SensorFeature'->new("Simulated Orientation Sensors");
    $self->{YAW} = 'org::allbinary::game::configuration::feature::SensorFeature'->new("Yaw");
    $self->{YAW_MINUS_RIGHT_PLUS_LEFT} = 'org::allbinary::game::configuration::feature::SensorFeature'->new("Yaw -Right +Left");
    $self->{YAW_MINUS_LEFT_PLUS_RIGHT} = 'org::allbinary::game::configuration::feature::SensorFeature'->new("Yaw -Left +Right ");
    $self->{PITCH} = 'org::allbinary::game::configuration::feature::SensorFeature'->new("Pitch");
    $self->{ROLL} = 'org::allbinary::game::configuration::feature::SensorFeature'->new("Roll");
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::configuration::feature::SensorFeatureFactory::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}

use org::allbinary::game::configuration::feature::SensorFeature;

1;

