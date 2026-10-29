# 
# AllBinary Open License Version 1 
# Copyright (c) 2006 AllBinary 
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

package org::allbinary::game::layer::building::BuildingLayer;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::layer::AdvancedRTSGameLayer','org::allbinary::animation::RotationAnimationInterfaceCompositeInterface','org::allbinary::game::tracking::TrackingEventListenerInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{buildingLevelCost} = 0;
    $self->{productivity} = 0;
    $self->{efficiency} = undef;
    $self->{efficiencyPerLevel} = undef;
    $self->{trackingEvent} = undef;
    $self->{damageFloaters} = undef;
    $self->{damageFloatersPaintableInterface} = undef;
    $self->{healthBar} = undef;
    $self->{pathsHashtable} = undef;
    $self->{local} = 0;
    $self->{timeDelayHelper} = 'org::allbinary::time::TimeDelayHelper'->new(3000);
}


# throws Exception
sub createSimulated {
    my ($class) = @_;
        my $nullAnimationInterfaceFactoryInterface = 'org::allbinary::animation::NullAnimationFactory'->getFactoryInstance();
        my $nullIndexedAnimationInterfaceFactoryInterface = 'org::allbinary::animation::NullIndexedAnimationFactory'->getFactoryInstance();
        return 'org::allbinary::game::layer::building::BuildingLayer'->new($org::allbinary::game::multiplayer::layer::RemoteInfo::REMOTE_INFO, 'org::allbinary::game::layer::building::SimulatedBuildingPropertiesFactory'->getInstance(), 'org::allbinary::game::layer::AdvancedRTSProperties'->createPropertiesSimulated(), 'org::allbinary::game::identification::GroupFactory'->getInstance()->{NULL_GROUP_ARRAY}, 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, $org::allbinary::game::health::Health::NULL_HEALTH, 'org::allbinary::game::input::form::NullRTSFormInputFactory'->getInstance(), $nullAnimationInterfaceFactoryInterface, $nullIndexedAnimationInterfaceFactoryInterface, $nullAnimationInterfaceFactoryInterface, $nullAnimationInterfaceFactoryInterface, $nullIndexedAnimationInterfaceFactoryInterface, 'org::allbinary::animation::NullIndexedAnimationFactory'->getFactoryInstance(), $org::allbinary::graphics::RectangleFactory::SINGLETON, 0, 0);
}


sub new {
    my ($class, $remoteInfo, $buildingPropertiesFactory, $advancedRTSProperties, $groupInterface, $rootName, $name, $healthInterface, $rtsFormInput, $animationInterfaceFactoryInterface, $emptyAnimationInterfaceFactoryInterface, $baseAnimationInterfaceFactoryInterface, $buildAnimationInterfaceFactoryInterface, $verticleBuildAnimationInterfaceFactoryInterface, $proceduralAnimationInterfaceFactoryInterface, $rectangle, $x, $y) = @_;
    my $self = $class->SUPER::new($remoteInfo, $org::allbinary::game::layer::NullPathFindingLayer::NULL_PATH_FINDING_LAYER, $advancedRTSProperties, $groupInterface, $rootName, $name, $healthInterface, $rtsFormInput, $animationInterfaceFactoryInterface, $emptyAnimationInterfaceFactoryInterface, $baseAnimationInterfaceFactoryInterface, $buildAnimationInterfaceFactoryInterface, $verticleBuildAnimationInterfaceFactoryInterface, $proceduralAnimationInterfaceFactoryInterface, $rectangle, $x, $y, 'org::allbinary::game::view::TileLayerPositionIntoViewPosition'->new());
    $self->_init_fields();
        # super(...) made $self above
        $self->setCollidableInferface('org::allbinary::game::layer::CollidableRTSBehavior'->new(1));
        $self->getWaypointBehavior()->setWaypoint('org::allbinary::game::layer::waypoint::Waypoint'->new($self, 'org::allbinary::media::audio::SelectSound'->getInstance()));
        $self->{damageFloaters} = $buildingPropertiesFactory->getDamageFloaters($self);
        $self->{damageFloatersPaintableInterface} = $buildingPropertiesFactory->{damageFloatersPaintableInterface};
        $self->{healthBar} = $buildingPropertiesFactory->getHealthBar($self);
        $self->{pathsHashtable} = $buildingPropertiesFactory->getHashtable();
        $self->setMaxLevel(30);
        $self->setProductivity(1);
        $self->setEfficiency($self->calculateEfficiency());
        $self->{efficiencyPerLevel} = $buildingPropertiesFactory->getEfficiencyPerLevel($self);
        $self->{efficiency} = $self->{efficiencyPerLevel};
        $self->generateMoveOutOfBuildAreaPaths();
        $self->{trackingEvent} = $buildingPropertiesFactory->getTrackingEvent($self);
    return $self;
}


sub initVisibility {
    my ($self, $rtsPlayerLayerInterface) = @_;
        my $advancedRTSPlayerLayerInterface = $rtsPlayerLayerInterface;
        if ($advancedRTSPlayerLayerInterface->isLocalPlayer()) {
            $self->{local} = 1;
            $self->addVisibility();
        } else {
            $self->{local} = 0;
        }
        $self->SUPER::initVisibility($rtsPlayerLayerInterface);
}


# throws Exception
sub construct {
    my ($self, $rtsPlayerLayerInterface) = @_;
        $self->SUPER::construct($rtsPlayerLayerInterface);
        'org::allbinary::game::tracking::TrackingEventHandler'->getInstance()->addListenerInterface($self);
}


sub onMovement {
    my ($self, $trackingEvent) = @_;
        try {
            my $layerInterface = $trackingEvent->getLayerInterface();
            if ($layerInterface->getGroupInterface()->[0] != $self->getGroupInterface()->[0]) {
                $layerInterface->onMovementFound($self->{trackingEvent});
            }
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "onMovement", $e);
        }
}


# throws Exception
sub processBuiltTick {
    my ($self, $allBinaryLayerManager) = @_;
        if ($self->getHealthInterface()->isDamaged()) {
            $self->setAnimationInterface($self->{destroyAnimationInterface});
        }
        if (!$self->getHealthInterface()->isAlive()) {
            if ($self->isReadyForExplosion()) {
                my $currentFrame = $self->{destroyAnimationInterface}->getFrame();
                my $size = $self->{destroyAnimationInterface}->getSize() - 1;
                if ($currentFrame == $size && !$self->{timeDelayHelper}->isTimeTNT()) {
                    if (!$self->getHealthInterface()->isAlive()) {
                        $self->setDestroyed(1);
                    }
                } else {
                    $self->{destroyAnimationInterface}->nextFrame();
                }
            } else {
                $self->setAnimationInterface($self->{destroyAnimationInterface});
                'org::allbinary::media::audio::SecondaryPlayerQueueFactory'->getInstance()->add('org::allbinary::ag::weapon::media::audio::ExplosionBasicSound'->getInstance());
                $self->{shakeListener}->onSmallShakeEvent();
                $self->{vibration}->vibrate($self->{duration}, 0, 0);
                $self->{timeDelayHelper}->setStartTimeTNT();
                $self->setReadyForExplosion(1);
            }
        } else {
            $self->SUPER::processBuiltTick($allBinaryLayerManager);
        }
        $self->{indexedButShouldBeRotationAnimationInterface}->nextFrame();
}


sub calculateEfficiency {
    my ($self) = @_;
        return $self->{efficiencyPerLevel};
}


sub getCost {
    my ($self) = @_;
        my $total = 'org::allbinary::game::layer::RTSLayerUtil'->getInstance()->getCostExponential(int(($self->getLevel() * $self->getBuildingLevelCost())));
        return $total;
}


sub getDowngradeCost {
    my ($self) = @_;
        my $downgradeCost = 'org::allbinary::game::layer::RTSLayerUtil'->getInstance()->getCostExponential(int((($self->getLevel() - 1) * $self->getBuildingLevelCost())));
        $self->{logUtil}->putF("Cost: " . $downgradeCost, $self, "getDowngradeCost");
        return int($downgradeCost * 9 / 10);
}


sub getUpgradeCost {
    my ($self) = @_;
        my $upgradeCost = 'org::allbinary::game::layer::RTSLayerUtil'->getInstance()->getCostExponential(int((($self->getLevel() + 1) * $self->getBuildingLevelCost())));
        return $upgradeCost;
}


sub downgrade {
    my ($self) = @_;
        $self->SUPER::downgrade();
        $self->setProductivity($self->getProductivity() - 1);
        $self->setEfficiency($self->getEfficiency() - $self->calculateEfficiency());
        $self->getHealthInterface()->setMaxHealth($self->getHealthInterface()->getMaxHealth() - (($self->getLevel() + 1) * 100));
}


sub upgrade {
    my ($self) = @_;
        $self->SUPER::upgrade();
        $self->setProductivity($self->getProductivity() + 1);
        $self->setEfficiency($self->getEfficiency() + $self->calculateEfficiency());
        $self->getHealthInterface()->setMaxHealth($self->getHealthInterface()->getMaxHealth() + ($self->getLevel() * 100));
}


sub getBuildingLevelCost {
    my ($self) = @_;
        return $self->{buildingLevelCost};
}


sub setBuildingLevelCost {
    my ($self, $buildingLevelCost) = @_;
        $self->{buildingLevelCost} = $buildingLevelCost;
}


sub getProductivity {
    my ($self) = @_;
        return $self->{productivity};
}


sub setProductivity {
    my ($self, $productivity) = @_;
        $self->{productivity} = $productivity;
}


sub getEfficiency {
    my ($self) = @_;
        return $self->{efficiency};
}


sub setEfficiency {
    my ($self, $efficiency) = @_;
        $self->{efficiency} = $efficiency;
}


# throws Exception
sub generateMoveOutOfBuildAreaPaths {
    my ($self) = @_;
        my $occupyList = $self->{geographicMapCellPositionAreaBase}->getOccupyingGeographicMapCellPositionList();
        my $surroundList = $self->{geographicMapCellPositionAreaBase}->getSurroundingGeographicMapCellPositionList();
        my $NO_DIRECTION = 'org::allbinary::direction::DirectionFactory'->getInstance()->{NO_DIRECTION};
        my $geographicMapDirectionUtil = 'org::allbinary::media::graphics::geography::map::GeographicMapDirectionUtil'->getInstance();
        my $pathsList = undef;
        my $occupyGeographicMapCellPosition = undef;
        my $surroundGeographicMapCellPosition = undef;
        my $list = undef;
        for (my $index2 = $occupyList->size() - 1; $index2 >= 0; $index2--) {
            $pathsList = 'org::allbinary::util::BasicArrayListD'->new();
            $occupyGeographicMapCellPosition = $occupyList->get($index2);
            for (my $index = $surroundList->size() - 1; $index >= 0; $index--) {
                $surroundGeographicMapCellPosition = $surroundList->get($index);
                if ($geographicMapDirectionUtil->getEightDirectionFromCellPositionToAdjacentCellPosition($surroundGeographicMapCellPosition, $occupyGeographicMapCellPosition) != $NO_DIRECTION) {
                    $list = 'org::allbinary::util::BasicArrayListS'->new(1);
                    $list->add($surroundGeographicMapCellPosition);
                    $pathsList->add($list);
                }
            }
            $self->{pathsHashtable}->put($occupyGeographicMapCellPosition, $pathsList);
        }
}


sub getMoveOutOfBuildAreaPath {
    my ($self, $geographicMapCellPosition) = @_;
        my $pathsList = $self->{pathsHashtable}->get($geographicMapCellPosition);
        return $pathsList;
}


sub getEndGeographicMapCellPositionList {
    my ($self) = @_;
        return $self->{geographicMapCellPositionAreaBase}->getSurroundingGeographicMapCellPositionList();
}


sub shouldHandleStartSameAsEnd {
    my ($self) = @_;
        return 0;
}


sub paint {
    my ($self, $graphics) = @_;
        if ($self->isVisible()) {
            $self->SUPER::paint($graphics);
            $self->{damageFloatersPaintableInterface}->paint($graphics);
            $self->{healthBar}->paint($graphics);
        }
}


# throws Exception
sub damage {
    my ($self, $damage, $damageType) = @_;
        $self->SUPER::damage($damage, $damageType);
        $self->{damageFloaters}->add($damage);
        if ($damage > 0) {
            $self->getHealthInterface()->damage($damage);
        }
}


# throws Exception
sub getDamage {
    my ($self, $damageType) = @_;
        return 0;
}


sub addVisibility {
    my ($self) = @_;
        my $geographicMapCellPositionArea = $self->{geographicMapCellPositionAreaBase};
        my $occupyList = $geographicMapCellPositionArea->getOccupyingGeographicMapCellPositionList();
        'org::allbinary::game::input::form::VisibleCellPositionsSingleton'->getInstance()->addStationaryCellPositions($occupyList);
        my $surroundList = $geographicMapCellPositionArea->getSurroundingGeographicMapCellPositionList();
        'org::allbinary::game::input::form::VisibleCellPositionsSingleton'->getInstance()->addStationaryCellPositions($surroundList);
}


sub removeVisibility {
    my ($self) = @_;
        my $occupyList = $self->{geographicMapCellPositionAreaBase}->getOccupyingGeographicMapCellPositionList();
        'org::allbinary::game::input::form::VisibleCellPositionsSingleton'->getInstance()->removeStationaryCellPositions($occupyList);
        my $surroundList = $self->{geographicMapCellPositionAreaBase}->getSurroundingGeographicMapCellPositionList();
        'org::allbinary::game::input::form::VisibleCellPositionsSingleton'->getInstance()->removeStationaryCellPositions($surroundList);
}


# throws Exception
sub setDestroyed {
    my ($self, $destroyed) = @_;
        $self->SUPER::setDestroyed($destroyed);
        if ($self->isDestroyed()) {
            'org::allbinary::media::graphics::geography::map::drop::DropCellPositionHistory'->getInstance()->removeAll($self);
            'org::allbinary::game::tracking::TrackingEventHandler'->getInstance()->removeListener($self);
            if ($self->{local}) {
                $self->removeVisibility();
            }
            if (!$self->getHealthInterface()->isAlive()) {
                my $damage = $self->getHealthInterface()->getMaxHealth();
                if ($damage > 10) {
                    'org::allbinary::media::audio::SecondaryPlayerQueueFactory'->getInstance()->add('org::allbinary::ag::weapon::media::audio::ExplosionBasicSound'->getInstance());
                    if ($damage < 100) {
                        $self->{shakeListener}->onSmallShakeEvent();
                        $self->{vibration}->vibrate($self->{duration}, 0, 0);
                    } elsif ($damage < 1000) {
                        $self->{shakeListener}->onMediumShakeEvent();
                        $self->{vibration}->vibrate($self->{duration} * 2, 0, 0);
                    } elsif ($damage < 3000) {
                        $self->{shakeListener}->onLargeShakeEvent();
                        $self->{vibration}->vibrate($self->{duration} * 4, 0, 0);
                    }
                }
            }
        }
}


sub createHudPaintable {
    my ($self) = @_;
        my $buildingInfoHudPaintable = 'org::allbinary::game::layer::building::BuildingInfoHudPaintable'->getInstance();
        $buildingInfoHudPaintable->setBasicColorP($self->{allBinaryGameLayerManagerP}->getForegroundBasicColor());
        $buildingInfoHudPaintable->setRtsLayer($self);
        return $buildingInfoHudPaintable;
}


sub getHudPaintable {
    my ($self) = @_;
        my $buildingInfoHudPaintable = 'org::allbinary::game::layer::building::BuildingInfoHudPaintable'->getInstance();
        return $buildingInfoHudPaintable;
}


sub getType {
    my ($self) = @_;
        return 'org::allbinary::game::layer::building::BuildingLayer'->getStaticType();
}


sub getStaticType {
    my ($class) = @_;
        return 2;
}

# use javax::microedition::lcdui::Graphics;
use org::allbinary::ag::weapon::media::audio::ExplosionBasicSound;
use org::allbinary::animation::NullAnimationFactory;
use org::allbinary::animation::NullIndexedAnimationFactory;
use org::allbinary::game::identification::GroupFactory;
use org::allbinary::game::input::form::NullRTSFormInputFactory;
use org::allbinary::game::input::form::RTSFormInput;
use org::allbinary::game::input::form::VisibleCellPositionsSingleton;
use org::allbinary::game::layer::AdvancedRTSGameLayer;
use org::allbinary::game::layer::AdvancedRTSPlayerLayerInterface;
use org::allbinary::game::layer::AdvancedRTSProperties;
use org::allbinary::game::layer::CollidableRTSBehavior;
use org::allbinary::game::layer::RTSLayerUtil;
use org::allbinary::game::layer::RTSPlayerLayerInterface;
use org::allbinary::game::layer::SelectionHudPaintable;
use org::allbinary::game::layer::waypoint::Waypoint;
use org::allbinary::game::view::TileLayerPositionIntoViewPosition;
use org::allbinary::graphics::RectangleFactory;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::animation::AnimationInterfaceFactoryInterface;
use org::allbinary::animation::ProceduralAnimationInterfaceFactoryInterface;
use org::allbinary::animation::RotationAnimationInterfaceCompositeInterface;
use org::allbinary::direction::Direction;
use org::allbinary::direction::DirectionFactory;
use org::allbinary::game::combat::damage::DamageFloaters;
use org::allbinary::game::health::Health;
use org::allbinary::game::identification::Group;
use org::allbinary::game::layer::GeographicMapCellPositionAreaBase;
use org::allbinary::game::layer::NullPathFindingLayer;
use org::allbinary::game::tracking::TrackingEvent;
use org::allbinary::game::tracking::TrackingEventHandler;
use org::allbinary::game::tracking::TrackingEventListenerInterface;
use org::allbinary::graphics::Rectangle;
use org::allbinary::graphics::paint::Paintable;
use org::allbinary::layer::AllBinaryLayerManager;
use org::allbinary::media::audio::SecondaryPlayerQueueFactory;
use org::allbinary::media::audio::SelectSound;
use org::allbinary::media::graphics::geography::map::GeographicMapCellPosition;
use org::allbinary::media::graphics::geography::map::GeographicMapDirectionUtil;
use org::allbinary::media::graphics::geography::map::drop::DropCellPositionHistory;
use org::allbinary::time::TimeDelayHelper;
use org::allbinary::util::BasicArrayListS;
use org::allbinary::game::multiplayer::layer::RemoteInfo;
use org::allbinary::util::ABHashtable;
use org::allbinary::game::layer::building::SimulatedBuildingPropertiesFactory;
use org::allbinary::game::layer::building::BuildingInfoHudPaintable;

1;

