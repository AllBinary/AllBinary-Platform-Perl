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

package org::allbinary::game::layer::building::SimulatedBuildingPropertiesFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::layer::building::BuildingPropertiesFactory';

our $instanceC = 'org::allbinary::game::layer::building::SimulatedBuildingPropertiesFactory'->new();

sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::layer::building::SimulatedBuildingPropertiesFactory::instanceC;
}


sub getEfficiencyPerLevel {
    my ($self, $buildingLayer) = @_;
        return 0;
}


sub getDamageFloaters {
    my ($self, $buildingLayer) = @_;
        my $damageFloaters = 'org::allbinary::game::combat::damage::DamageFloaters'->getInstance();
        $self->{damageFloatersPaintableInterface} = $damageFloaters;
        return $damageFloaters;
}


# throws Exception
sub getHealthBar {
    my ($self, $buildingLayer) = @_;
        return 'org::allbinary::graphics::paint::NullPaintable'->getInstance();
}


sub getHashtable {
    my ($self) = @_;
        return 'org::allbinary::logic::StdUtil'->getInstance()->{NULL_TABLE};
}


sub getTrackingEvent {
    my ($self, $buildingLayer) = @_;
        return 'org::allbinary::game::tracking::TrackingEvent'->new('org::allbinary::game::tracking::TrackingEventHandler'->getInstance());
}

use org::allbinary::game::combat::damage::DamageFloaters;
use org::allbinary::game::tracking::TrackingEvent;
use org::allbinary::game::tracking::TrackingEventHandler;
use org::allbinary::graphics::paint::NullPaintable;
use org::allbinary::graphics::paint::Paintable;
use org::allbinary::logic::StdUtil;
use org::allbinary::util::ABHashtable;
use org::allbinary::game::layer::building::BuildingPropertiesFactory;

1;

