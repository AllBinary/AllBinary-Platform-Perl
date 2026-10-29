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

package org::allbinary::game::layer::building::BuildingPropertiesFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::game::layer::building::BuildingPropertiesFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{damageFloatersPaintableInterface} = 'org::allbinary::graphics::paint::NullPaintable'->getInstance();
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::layer::building::BuildingPropertiesFactory::instance;
}


sub getEfficiencyPerLevel {
    my ($self, $buildingLayer) = @_;
        return 10000 / $buildingLayer->getMaxLevel() + 10000 % $buildingLayer->getMaxLevel();
}


sub getDamageFloaters {
    my ($self, $buildingLayer) = @_;
        my $damageFloaters = 'org::allbinary::game::combat::damage::DamageFloaters'->getInstance();
        if ('org::allbinary::game::configuration::feature::Features'->getInstance()->isFeature('org::allbinary::game::configuration::feature::GameFeatureFactory'->getInstance()->{DAMAGE_FLOATERS})) {
            $damageFloaters = 'org::allbinary::game::combat::damage::PtsDamageFloaters'->new($buildingLayer);
            $self->{damageFloatersPaintableInterface} = $damageFloaters;
        } else {
            $damageFloaters = 'org::allbinary::game::combat::damage::DamageFloaters'->new();
        }
        return $damageFloaters;
}


# throws Exception
sub getHealthBar {
    my ($self, $buildingLayer) = @_;
        my $healthBar = 'org::allbinary::graphics::paint::NullPaintable'->getInstance();
        if ('org::allbinary::game::configuration::feature::Features'->getInstance()->isFeature('org::allbinary::game::configuration::feature::GameFeatureFactory'->getInstance()->{HEALTH_BARS})) {
            $healthBar = 'org::allbinary::game::health::HealthBar'->new($buildingLayer, $buildingLayer->getHealthInterface(), 'org::allbinary::game::health::HealthBarTwodAnimation'->new($buildingLayer, 'org::allbinary::game::graphics::hud::BasicHudFactory'->getInstance()->{BOTTOMLEFT}), -1);
        }
        return $healthBar;
}


sub getHashtable {
    my ($self) = @_;
        return 'org::allbinary::logic::StdUtil'->getInstance()->createHashtable();
}


sub getTrackingEvent {
    my ($self, $buildingLayer) = @_;
        return 'org::allbinary::game::tracking::TrackingEvent'->new($buildingLayer);
}

use org::allbinary::game::combat::damage::DamageFloaters;
use org::allbinary::game::combat::damage::PtsDamageFloaters;
use org::allbinary::game::configuration::feature::Features;
use org::allbinary::game::configuration::feature::GameFeatureFactory;
use org::allbinary::game::graphics::hud::BasicHudFactory;
use org::allbinary::game::health::HealthBar;
use org::allbinary::game::health::HealthBarTwodAnimation;
use org::allbinary::game::tracking::TrackingEvent;
use org::allbinary::graphics::paint::NullPaintable;
use org::allbinary::graphics::paint::Paintable;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::logic::StdUtil;
use org::allbinary::util::ABHashtable;

1;

