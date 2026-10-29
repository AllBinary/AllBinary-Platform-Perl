# 
# AllBinary Open License Version 1 
# Copyright (c) 2003 AllBinary 
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

package org::allbinary::game::layer::RTSLayerUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use POSIX ();

our $instance = 'org::allbinary::game::layer::RTSLayerUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{groupCommonFactory} = 'org::allbinary::game::identification::GroupCommonFactory'->getInstance();
    $self->{MAX_RELOAD_TIME} = int(int(2147483647) / 100000);
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::layer::RTSLayerUtil::instance;
}


sub createWeaponProperties {
    my ($self, $weaponProperties, $currentLevel, $lastLevel) = @_;
        my $reloadTime = $weaponProperties->getReloadTime();
        if ($lastLevel > $currentLevel) {
            $reloadTime = $reloadTime + 50;
        } elsif ($lastLevel < $currentLevel) {
            $reloadTime = $reloadTime - 50;
        }
        my $newWeaponProperties = 'org::allbinary::game::combat::weapon::WeaponProperties'->new($reloadTime, $weaponProperties->getTargetingTime(), $weaponProperties->getSpeed()->getUnscaled(), $weaponProperties->getDamage() / $lastLevel * $currentLevel, $weaponProperties->getDissipation());
        return $newWeaponProperties;
}


sub downgrade {
    my ($self, $rtsLayer) = @_;
        $rtsLayer->setLevel($rtsLayer->getLevel() - 1);
        my $partInterfaceArray = $rtsLayer->getPartInterfaceArray();
        my $size = scalar(@{$partInterfaceArray});
        my $partInterface = undef;
        for (my $index = $size; --$index >= 0; ) {
            $partInterface = $partInterfaceArray->[$index];
            $partInterface->setWeaponProperties($self->createWeaponProperties($partInterface->getWeaponProperties(), $rtsLayer->getLevel(), $rtsLayer->getLevel() + 1));
        }
        $rtsLayer->select();
}


sub upgrade {
    my ($self, $rtsLayer) = @_;
        $rtsLayer->setLevel($rtsLayer->getLevel() + 1);
        my $partInterfaceArray = $rtsLayer->getPartInterfaceArray();
        my $size = scalar(@{$partInterfaceArray});
        my $partInterface = undef;
        for (my $index = $size; --$index >= 0; ) {
            $partInterface = $partInterfaceArray->[$index];
            $partInterface->setWeaponProperties($self->createWeaponProperties($partInterface->getWeaponProperties(), $rtsLayer->getLevel(), $rtsLayer->getLevel() - 1));
        }
        $rtsLayer->select();
}


sub getCostExponential {
    my ($self, $cost) = @_;
        return (int(($cost * $cost * $cost) / ($cost * 1000)));
}


sub getWeaponPropertiesCost {
    my ($self, $weaponProperties) = @_;
        my $cost = ($weaponProperties->getDamage() + $weaponProperties->getRange() + (POSIX::floor((($self->{MAX_RELOAD_TIME} / $weaponProperties->getReloadTime())) / (2 ** (1)))));
        $cost = $self->getCostExponential($cost);
        return $cost;
}


sub getCost {
    my ($self, $rtsLayer) = @_;
        my $total = 0;
        my $partInterfaceArray = $rtsLayer->getPartInterfaceArray();
        my $size = scalar(@{$partInterfaceArray});
        my $partInterface = undef;
        my $weaponProperties = undef;
        for (my $index = $size - 1; $index >= 0; $index--) {
            $partInterface = $partInterfaceArray->[$index];
            $weaponProperties = $partInterface->getWeaponProperties();
            $total += $self->getWeaponPropertiesCost($weaponProperties);
        }
        return $total;
}


sub getDowngradeCost {
    my ($self, $rtsLayer) = @_;
        my $partInterfaceArray = $rtsLayer->getPartInterfaceArray();
        my $size = scalar(@{$partInterfaceArray});
        my $downgradeCost = 0;
        my $partInterface = undef;
        my $weaponProperties = undef;
        my $downgradeWeaponCost = 0;
        my $currentWeaponCost = 0;
        for (my $index = $size - 1; $index >= 0; $index--) {
            $partInterface = $partInterfaceArray->[$index];
            $weaponProperties = $partInterface->getWeaponProperties();
            $downgradeWeaponCost = $self->getWeaponPropertiesCost($self->createWeaponProperties($weaponProperties, $rtsLayer->getLevel() - 1, $rtsLayer->getLevel()));
            $currentWeaponCost = $self->getWeaponPropertiesCost($weaponProperties);
            $downgradeCost += ($currentWeaponCost - $downgradeWeaponCost);
        }
        $downgradeCost = int($downgradeCost * 9 / 10);
        $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append("Total Cost: ")->appendint($downgradeCost)->toString(), $self, "getDowngradeCost");
        return $downgradeCost;
}


sub getUpgradeCost {
    my ($self, $rtsLayer) = @_;
        my $upgradeCost = 0;
        my $partInterfaceArray = $rtsLayer->getPartInterfaceArray();
        my $size = scalar(@{$partInterfaceArray});
        my $partInterface = undef;
        my $weaponProperties = undef;
        my $upgradedWeaponCost = 0;
        my $currentWeaponCost = 0;
        for (my $index = $size - 1; $index >= 0; $index--) {
            $partInterface = $partInterfaceArray->[$index];
            $weaponProperties = $partInterface->getWeaponProperties();
            $upgradedWeaponCost = $self->getWeaponPropertiesCost($self->createWeaponProperties($weaponProperties, $rtsLayer->getLevel() + 1, $rtsLayer->getLevel()));
            $currentWeaponCost = $self->getWeaponPropertiesCost($weaponProperties);
            $upgradeCost += ($upgradedWeaponCost - $currentWeaponCost);
        }
        $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append("Total Cost: ")->appendint($upgradeCost)->toString(), $self, "getUpgradeCost");
        return $upgradeCost;
}


# throws Exception
sub destroyAndClear {
    my ($self, $list) = @_;
        my $rtsLayer = undef;
        for (my $index = $list->size() - 1; $index >= 0; $index--) {
            $rtsLayer = $list->get($index);
            $rtsLayer->setDestroyed(1);
        }
        $list->clear();
}


sub createFakeRTSLayerHashtable {
    my ($self, $baseRaceTrackGeographicMap) = @_;
        my $hashtable = 'org::allbinary::logic::StdUtil'->getInstance()->createHashtable();
        my $layerManager = 'org::allbinary::game::layer::FakeLayerManager'->new($org::allbinary::game::GameInfo::NONE);
        $layerManager->setGeographicMapInterface([$baseRaceTrackGeographicMap]);
        $hashtable->put($org::allbinary::game::layer::AllBinaryGameLayerManager::ID, $layerManager);
        $hashtable->put('org::allbinary::direction::DirectionFactory'->getInstance()->{NAME}, 'org::allbinary::direction::DirectionFactory'->getInstance()->{LEFT});
        $hashtable->put($self->{groupCommonFactory}->{ID}, 'org::allbinary::game::identification::BasicGroupFactory'->getInstance()->{NONE_ARRAY});
        return $hashtable;
}

use org::allbinary::game::identification::GroupCommonFactory;
use org::allbinary::util::BasicArrayList;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::direction::DirectionFactory;
use org::allbinary::game::GameInfo;
use org::allbinary::game::combat::weapon::WeaponProperties;
use org::allbinary::game::identification::BasicGroupFactory;
use org::allbinary::game::part::PartInterface;
use org::allbinary::game::part::weapon::BasicWeaponPart;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::media::graphics::geography::map::BasicGeographicMap;
use org::allbinary::media::graphics::geography::map::racetrack::BaseRaceTrackGeographicMap;
use org::allbinary::util::ABHashtable;
use org::allbinary::game::layer::FakeLayerManager;
use org::allbinary::game::layer::AllBinaryGameLayerManager;

1;

