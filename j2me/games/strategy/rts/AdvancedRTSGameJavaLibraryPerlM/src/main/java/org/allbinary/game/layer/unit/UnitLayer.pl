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

package org::allbinary::game::layer::unit::UnitLayer;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use POSIX ();
use List::Util ();
use parent -norequire,'org::allbinary::game::layer::AdvancedRTSGameLayer','org::allbinary::game::layer::building::event::BuildingEventListenerInterface','org::allbinary::game::tracking::TrackingEventListenerInterface';

our $partialPositionList = 'org::allbinary::util::BasicArrayListS'->new(4);
our $SENSOR_RANGE_MULTIPLIER = 6;
our $MOVE = "Moving";

sub _init_fields {
    my ($self) = @_;
    $self->{basicColorFactory} = 'org::allbinary::graphics::color::BasicColorFactory'->getInstance();
    $self->{groupCommonFactory} = 'org::allbinary::game::identification::GroupCommonFactory'->getInstance();
    $self->{layerPartialCellPositionsUtil} = 'org::allbinary::game::layer::geographic::map::LayerPartialCellPositionsUtil'->getInstance();
    $self->{layerDistanceUtil} = 'org::allbinary::math::LayerDistanceUtil'->getInstance();
    $self->{angleFactory} = 'org::allbinary::math::AngleFactory'->getInstance();
    $self->{cellPositionFactory} = 'org::allbinary::graphics::CellPositionFactory'->getInstance();
    $self->{maxResourceLoad} = undef;
    $self->{vehicleProperties} = undef;
    $self->{accelerationBasicDecimal} = 'org::allbinary::logic::math::BasicDecimal'->new(1600);
    $self->{decelerationBasicDecimal} = 'org::allbinary::logic::math::BasicDecimal'->new(-1000);
    $self->{trackingEvent} = undef;
    $self->{damageFloaters} = undef;
    $self->{damageFloatersPaintableInterface} = undef;
    $self->{healthBar} = undef;
    $self->{moveSoundInterface} = undef;
    $self->{initResourceAnimation} = undef;
    $self->{resourceAnimation} = 'org::allbinary::animation::NullIndexedAnimationFactory'->getFactoryInstance()->getInstance(0);
    $self->{initPathAnimation} = undef;
    $self->{pathAnimation} = 'org::allbinary::animation::NullAnimationFactory'->getFactoryInstance()->getInstance(0);
    $self->{captionAnimationHelper} = 'org::allbinary::animation::caption::CaptionAnimationHelper'->new('org::allbinary::animation::FeaturedAnimationInterfaceFactoryInterfaceFactory'->getInstance()->get('org::allbinary::game::layer::CaptionResources'->getInstance()->{RESOURCE})->getInstance(0), -23, -25, 6, 0);
    $self->{decalAnimation} = undef;
    $self->{waypointLayerInterfaceFactoryInterface} = undef;
    $self->{resourceLoad} = 0;
    $self->{weaponRange} = 0;
    $self->{rtsLogHelper} = 'org::allbinary::game::layer::RTSLayerLogHelper'->getInstance();
    $self->{rotationAnimationInterfaceP} = undef;
    $self->{movementAngle} = $self->{angleFactory}->{NOT_ANGLE};
    $self->{steeringInsideGeographicMapCellPosition} = $org::allbinary::media::graphics::geography::map::SimpleGeographicMapCellPositionFactory::NULL_GEOGRAPHIC_MAP_CELL_POSITION;
    $self->{sensorGeographicMapCellPositionList} = 'org::allbinary::util::BasicArrayListD'->new();
    $self->{CAPITAL_EVENT} = 'org::allbinary::game::layer::capital::event::CapitalEvent'->new($self);
}


sub new {
    my ($class, $remoteInfo, $parentLayer, $advancedRTSProperties, $groupInterface, $rootName, $name, $vehicleProperties, $healthInterface, $maxResourceLoad, $moveSoundInterface, $waypointLayerInterfaceFactoryInterface, $animationInterfaceFactoryInterface, $emptyAnimationInterfaceFactoryInterface, $baseAnimationInterfaceFactoryInterface, $buildAnimationInterfaceFactoryInterface, $verticleBuildAnimationInterfaceFactoryInterface, $decalAnimationInterfaceFactoryInterface, $resourceAnimationInterfaceFactoryInterface, $proceduralAnimationInterfaceFactoryInterface, $rectangle, $direction, $x, $y, $z, $viewPosition) = @_;
    my $self = $class->SUPER::new($remoteInfo, $parentLayer, $advancedRTSProperties, $groupInterface, $rootName, $name, $healthInterface, 'org::allbinary::game::input::form::WaypointRTSFormInput'->new($groupInterface, 1), $animationInterfaceFactoryInterface, $emptyAnimationInterfaceFactoryInterface, $baseAnimationInterfaceFactoryInterface, $buildAnimationInterfaceFactoryInterface, $verticleBuildAnimationInterfaceFactoryInterface, $proceduralAnimationInterfaceFactoryInterface, $rectangle, $x, $y, $viewPosition);
    $self->_init_fields();
        # super(...) made $self above
        $self->setCollidableInferface('org::allbinary::game::layer::unit::CollidableUnitBehavior'->new(1));
        $self->{waypointLayerInterfaceFactoryInterface} = $waypointLayerInterfaceFactoryInterface;
        $self->{maxResourceLoad} = int($maxResourceLoad);
        $self->{moveSoundInterface} = $moveSoundInterface;
        if ('org::allbinary::game::configuration::feature::Features'->getInstance()->isFeature('org::allbinary::game::configuration::feature::GameFeatureFactory'->getInstance()->{DAMAGE_FLOATERS})) {
            $self->{damageFloaters} = 'org::allbinary::game::combat::damage::PtsDamageFloaters'->new($self);
            $self->{damageFloatersPaintableInterface} = $self->{damageFloaters};
        } else {
            $self->{damageFloatersPaintableInterface} = 'org::allbinary::graphics::paint::NullPaintable'->getInstance();
            $self->{damageFloaters} = 'org::allbinary::game::combat::damage::DamageFloaters'->new();
        }
        if ('org::allbinary::game::configuration::feature::Features'->getInstance()->isFeature('org::allbinary::game::configuration::feature::GameFeatureFactory'->getInstance()->{HEALTH_BARS})) {
            $self->{healthBar} = 'org::allbinary::game::health::HealthBar'->new($self, $self->getHealthInterface(), 'org::allbinary::game::health::HealthBarTwodAnimation'->new($self, 'org::allbinary::game::graphics::hud::BasicHudFactory'->getInstance()->{BOTTOMLEFT}), -1);
        } else {
            $self->{healthBar} = 'org::allbinary::graphics::paint::NullPaintable'->getInstance();
        }
        $self->{decalAnimation} = $decalAnimationInterfaceFactoryInterface->getInstance(0);
        $self->{initResourceAnimation} = $resourceAnimationInterfaceFactoryInterface->getInstance(0);
        $self->{initResourceAnimation}->setFrameByDirection($direction);
        $self->{decalAnimation}->setFrameByDirection($direction);
        $self->{rotationAnimationInterfaceP} = $self->{indexedButShouldBeRotationAnimationInterface};
        $self->{rotationAnimationInterfaceP}->setFrameByDirection($direction);
        $self->setMaxLevel(12);
        $self->{vehicleProperties} = $vehicleProperties;
        $self->{trackingEvent} = 'org::allbinary::game::tracking::TrackingEvent'->new($self);
        $self->{initPathAnimation} = 'org::allbinary::game::layer::PathAnimation'->new($self, 'org::allbinary::game::layer::LinePathRelativeAnimation'->getInstance());
    return $self;
}


# throws Exception
sub setAllBinaryGameLayerManager {
    my ($self, $allBinaryGameLayerManager) = @_;
        $self->SUPER::setAllBinaryGameLayerManager($allBinaryGameLayerManager);
        $self->{initPathAnimation}->setAllBinaryGameLayerManager($allBinaryGameLayerManager);
}


# throws Exception
sub updateWaypointBehavior {
    my ($self, $geographicMapInterface) = @_;
        my $hashtable = 'org::allbinary::logic::StdUtil'->getInstance()->createHashtable();
        $hashtable->put($self->{groupCommonFactory}->{ID}, $self->getGroupInterface());
        $hashtable->put($org::allbinary::layer::Layer::ID, $self);
        $hashtable->put($org::allbinary::game::layer::AllBinaryGameLayerManager::ID, $self->{allBinaryGameLayerManagerP});
        $self->setWaypointBehavior('org::allbinary::game::layer::unit::UnitWaypointBehavior2'->new($self, $self->{waypointLayerInterfaceFactoryInterface}->getNextInstance($hashtable, $self->{x}, $self->{y}, $self->{z})));
        my $features = 'org::allbinary::game::configuration::feature::Features'->getInstance();
        my $waypoint = ('org::allbinary::J2MEUtil'->isHTML() ? 'org::allbinary::game::layer::waypoint::MultipassNoCacheWaypoint'->new($self, 'org::allbinary::media::audio::AttackSound'->getInstance()) : 'org::allbinary::game::layer::waypoint::NoCacheWaypoint'->new($self, 'org::allbinary::media::audio::AttackSound'->getInstance()));
        $self->getWaypointBehavior()->setWaypoint($waypoint);
        $self->SUPER::updateWaypointBehavior($geographicMapInterface);
        $self->initRangeHack();
}


# throws Exception
sub construct {
    my ($self, $rtsPlayerLayerInterface) = @_;
        $self->SUPER::construct($rtsPlayerLayerInterface);
        'org::allbinary::game::tracking::TrackingEventHandler'->getInstance()->addListenerInterface($self);
        'org::allbinary::game::layer::waypoint::event::WaypointEventHandlerFactory'->getInstance($self->getGroupInterface()->[0])->addListenerInterface($self->getUnitWaypointBehavior());
        'org::allbinary::game::layer::building::event::BuildingEventHandler'->getInstance()->addListenerInterface($self);
        $self->getUnitWaypointBehavior()->setCurrentPathGeographicMapCellPosition($self->getCurrentGeographicMapCellPosition());
        $self->updateSensorGeographicMapCellPositionList();
        $self->getUnitWaypointBehavior()->setLastPathGeographicMapCellPosition($self->getUnitWaypointBehavior()->getCurrentPathGeographicMapCellPosition());
}


# throws Exception
sub updateSensorGeographicMapCellPositionList {
    my ($self) = @_;
        if ('org::allbinary::game::input::form::VisibleCellPositionsSingleton'->getInstance()->shouldProcess()) {
            my $currentGeographicMapCellPosition = $self->getCurrentGeographicMapCellPosition();
            $self->{sensorGeographicMapCellPositionList}->clear();
            $self->{sensorGeographicMapCellPositionList}->add($currentGeographicMapCellPosition);
            my $sensorRange = $self->{weaponRange} * $org::allbinary::game::layer::unit::UnitLayer::SENSOR_RANGE_MULTIPLIER;
            my $geographicMapCompositeInterface = $self->{allBinaryGameLayerManagerP};
            my $geographicMapInterface = $geographicMapCompositeInterface->getGeographicMapInterface()->[0];
            my $tiledLayer = $geographicMapInterface->getAllBinaryTiledLayer();
            my $totalCells = ($sensorRange / $tiledLayer->getCellHeight()) / 2;
            my $geographicMapCellPositionFactory = $geographicMapInterface->getGeographicMapCellPositionFactory();
            my $column = $currentGeographicMapCellPosition->getColumn();
            my $row = $currentGeographicMapCellPosition->getRow();
            my $lastColumn = $column + $totalCells;
            my $lastRow = $row + $totalCells;
            if ($lastColumn > $tiledLayer->getColumns()) {
                $lastColumn = $tiledLayer->getColumns();
            }
            if ($lastRow > $tiledLayer->getRows()) {
                $lastRow = $tiledLayer->getRows();
            }
            my $firstColumn = $column - $totalCells;
            my $firstRow = $row - $totalCells;
            if ($firstColumn < 0) {
                $firstColumn = 0;
            }
            if ($firstRow < 0) {
                $firstRow = 0;
            }
            for (my $index = $lastColumn - 1; $index >= $firstColumn; $index--) {
                for (my $index2 = $lastRow - 1; $index2 >= $firstRow; $index2--) {
                    my $geographicMapCellPosition = $geographicMapCellPositionFactory->getAt($index, $index2);
                    if (!$self->{sensorGeographicMapCellPositionList}->contains($geographicMapCellPosition)) {
                        $self->{sensorGeographicMapCellPositionList}->add($geographicMapCellPosition);
                    }
                }
            }
        }
}


sub getSensorGeographicMapCellPositionList {
    my ($self) = @_;
        return $self->{sensorGeographicMapCellPositionList};
}


sub select {
    my ($self) = @_;
        $self->{pathAnimation} = $self->{initPathAnimation};
        $self->SUPER::select();
}


sub deselect {
    my ($self) = @_;
        $self->{pathAnimation} = 'org::allbinary::animation::NullAnimationFactory'->getFactoryInstance()->getInstance(0);
        $self->SUPER::deselect();
}


sub setSelected {
    my ($self, $selected) = @_;
        $self->SUPER::setSelected($selected);
        if ($selected) {
            if ($self->{debug}) {
                $self->{rtsLogHelper} = 'org::allbinary::game::layer::RTSLayerSelectedLogHelper'->getInstance();
            }
            $self->{rtsLayer2LogHelper} = 'org::allbinary::game::layer::RTSLayer2SelectedLogHelper'->getInstance();
        } else {
            if ($self->{debug}) {
                $self->{rtsLogHelper} = 'org::allbinary::game::layer::RTSLayerLogHelper'->getInstance();
            }
            $self->{rtsLayer2LogHelper} = 'org::allbinary::game::layer::RTSLayer2LogHelper'->getInstance();
        }
}


# throws Exception
sub setClosestGeographicMapCellHistory {
    my ($self, $pathsList) = @_;
        $self->{rtsLogHelper}->setClosestGeographicMapCellHistory($self, $pathsList);
        my $closestIndex = -1;
        my $shortestDistance = 2147483647;
        my $currentDistance = 2147483647;
        for (my $index = $pathsList->size() - 1; $index >= 0; $index--) {
            my $geographicMapCellPositionBasicArrayList = $pathsList->get($index);
            my $geographicMapCellPosition = $geographicMapCellPositionBasicArrayList->get($geographicMapCellPositionBasicArrayList->size() - 1);
            $currentDistance = $self->{layerDistanceUtil}->getDistanceAt($self, $geographicMapCellPosition->getMidPoint());
            if ($currentDistance < $shortestDistance) {
                $shortestDistance = $currentDistance;
                $closestIndex = $index;
            }
        }
        if ($closestIndex >= 0) {
            my $geographicMapCellPositionBasicArrayList = $pathsList->get($closestIndex);
            my $geographicMapCellPosition = $geographicMapCellPositionBasicArrayList->get(0);
            $self->teleportTo($geographicMapCellPosition);
        }
}


# throws Exception
sub init {
    my ($self, $geographicMapCellHistory, $geographicMapCellPositionBasicArrayList) = @_;
        $geographicMapCellHistory->trackAll($geographicMapCellPositionBasicArrayList);
}


sub onMovement {
    my ($self, $trackingEvent) = @_;
        try {
            my $layerInterface = $trackingEvent->getLayerInterface();
            if ($layerInterface->getGroupInterface()->[0] != $self->getGroupInterface()->[0]) {
                $self->getUnitWaypointBehavior()->getPossibleTargetList()->add($layerInterface);
                $layerInterface->onMovementFound($self->getTrackingEvent());
            }
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "onMovement", $e);
        }
}


# throws Exception
sub onMovementFound {
    my ($self, $trackingEvent) = @_;
        my $layerInterface = $trackingEvent->getLayerInterface();
        if ($layerInterface->getGroupInterface()->[0] != $self->getGroupInterface()->[0]) {
            $self->getUnitWaypointBehavior()->getPossibleTargetList()->add($layerInterface);
        }
}


sub initRangeHack {
    my ($self) = @_;
        my $basicWeaponPart = $self->getPartInterfaceArray()->[0];
        my $weaponProperties = $basicWeaponPart->getWeaponProperties();
        $self->{weaponRange} = $weaponProperties->getRange();
        $self->{initRangeAnimation} = 'org::allbinary::animation::vector::AdjustedCircleAnimation'->createW($self->{weaponRange}, $self->{weaponRange}, $self->getWidth(), $self->{basicColorFactory}->{GREEN});
        my $sensorRange = $self->{weaponRange} * $org::allbinary::game::layer::unit::UnitLayer::SENSOR_RANGE_MULTIPLIER;
        $self->{initSensorRangeAnimation} = 'org::allbinary::animation::vector::AdjustedCircleAnimation'->createW($sensorRange, $sensorRange, $self->getWidth(), $self->{basicColorFactory}->{RED});
        $self->getUnitWaypointBehavior()->initRange($self->{weaponRange});
        $self->{fireTimeHelper}->{delay} = (int($weaponProperties->getReloadTime()));
}


# throws Exception
sub processBuiltTick {
    my ($self, $allBinaryLayerManager) = @_;
        if (!$self->getHealthInterface()->isAlive()) {
            if ($self->isReadyForExplosion()) {
                my $currentFrame = $self->{destroyAnimationInterface}->getFrame();
                my $size = $self->{destroyAnimationInterface}->getSize() - 1;
                if ($currentFrame == $size) {
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
                $self->setReadyForExplosion(1);
            }
        } else {
            $self->SUPER::processBuiltTick($allBinaryLayerManager);
        }
        $self->{captionAnimationHelper}->tick();
        $self->getUnitWaypointBehavior()->processTick($allBinaryLayerManager);
}


sub teleportTo {
    my ($self, $geographicMapCellPosition) = @_;
        my $point = $geographicMapCellPosition->getMidPoint();
        $self->setPosition($point->getX() - $self->getHalfWidth(), $point->getY() - $self->getHalfHeight(), $self->{z});
}


# throws Exception
sub getCurrentGeographicMapCellPosition {
    my ($self) = @_;
        my $geographicMapCompositeInterface = $self->{allBinaryGameLayerManagerP};
        my $geographicMapInterface = $geographicMapCompositeInterface->getGeographicMapInterface()->[0];
        my $geographicMapCellPosition = $geographicMapInterface->getCellPositionAtXY($self->{x} + $self->getHalfWidth(), $self->{y} + $self->getHalfHeight());
        my $raceTrackGeographicMap = $geographicMapInterface;
        if (!$raceTrackGeographicMap->isValid($geographicMapCellPosition)) {
            die ("Position is not really on the map: " . $geographicMapCellPosition);
        }
        return $geographicMapCellPosition;
}


# throws Exception
sub fire {
    my ($self, $layerManager, $gameKeyEvent) = @_;
        if ($self->{fireTimeHelper}->isTimeTNT()) {
            $self->fireAll($layerManager);
        } else {
            $self->reload();
        }
}


# throws Exception
sub left {
    my ($self) = @_;
        $self->{initResourceAnimation}->previousRotation();
        $self->{decalAnimation}->previousRotation();
        $self->{rotationAnimationInterfaceP}->previousRotation();
}


# throws Exception
sub right {
    my ($self) = @_;
        $self->{initResourceAnimation}->nextRotation();
        $self->{decalAnimation}->nextRotation();
        $self->{rotationAnimationInterfaceP}->nextRotation();
}


sub down {
    my ($self) = @_;
        my $velocityProperties = $self->getVehicleProperties()->getVelocityProperties();
        if (!$velocityProperties->isOverXYMaxForwardVelocity()) {
            $self->accelerate($self->{decelerationBasicDecimal});
        }
}


sub up {
    my ($self) = @_;
        my $velocityProperties = $self->getVehicleProperties()->getVelocityProperties();
        if (!$velocityProperties->isOverXYMaxForwardVelocity()) {
            $self->accelerate($self->{accelerationBasicDecimal});
        }
}


sub initInputProcessors {
    my ($self) = @_;
        $self->{inputProcessorArray}->[$javax::microedition::lcdui::Canvas::RIGHT] = 'org::allbinary::game::layer::special::SpecialRightGameInputProcessor'->new($self);
        $self->{inputProcessorArray}->[$javax::microedition::lcdui::Canvas::LEFT] = 'org::allbinary::game::layer::special::SpecialLeftGameInputProcessor'->new($self);
        $self->{inputProcessorArray}->[$javax::microedition::lcdui::Canvas::KEY_NUM0] = 'org::allbinary::game::layer::special::SpecialFireGameInputProcessor'->new($self);
        $self->{inputProcessorArray}->[$javax::microedition::lcdui::Canvas::KEY_POUND] = $self->{inputProcessorArray}->[$javax::microedition::lcdui::Canvas::KEY_NUM0];
        $self->{inputProcessorArray}->[$javax::microedition::lcdui::Canvas::DOWN] = 'org::allbinary::game::layer::special::SpecialDownGameInputProcessor'->new($self);
        $self->{inputProcessorArray}->[$javax::microedition::lcdui::Canvas::UP] = 'org::allbinary::game::layer::special::SpecialUpGameInputProcessor'->new($self);
        $self->SUPER::initInputProcessors();
}


# throws Exception
sub processInput {
    my ($self, $layerManager) = @_;
        my $list = $self->getGameKeyEventList();
        my $size = $list->size();
        for (my $index = 0; $index < $size; $index++) {
            my $anyType = $list->get($index);
            my $key = 'org::allbinary::game::input::event::GameKeyEventUtil'->getKey($anyType);
            $self->{inputProcessorArray}->[$key]->processEvent($layerManager, $org::allbinary::game::input::event::GameKeyEvent::NONE);
        }
        $list->clear();
        $self->groundFriction();
        $self->move();
}


sub accelerate {
    my ($self, $accelerate) = @_;
        $self->getVehicleProperties()->getVelocityProperties()->addVelocityi($accelerate->getUnscaled(), int($self->{rotationAnimationInterfaceP}->getAngleInfoP()->getAngle()), 90);
}


# throws Exception
sub fireAll {
    my ($self, $layerManager) = @_;
        my $angleInfo = $self->{rotationAnimationInterfaceP}->getAngleInfoP();
        my $angle = int(($angleInfo->getAngle() + $self->{slightAngle}));
        $self->{hashtable}->put('org::allbinary::logic::math::SmallIntegerSingletonFactory'->getInstance()->getAt(1), 'org::allbinary::logic::math::SmallIntegerSingletonFactory'->getInstance()->getAt(int('org::allbinary::math::AngleFactory'->getInstance()->getAt($angle)->getValue())));
        my $salvoInterface = $self->getPartInterfaceArray()->[0];
        $salvoInterface->process($layerManager, ((int($angle) + 32768) % 65536 - 32768), ((int(90) + 32768) % 65536 - 32768));
}


sub downgrade {
    my ($self) = @_;
        if ($self->getLevel() > 1) {
            $self->SUPER::downgrade();
        }
}


sub upgrade {
    my ($self) = @_;
        $self->SUPER::upgrade();
        $self->initRangeHack();
}


sub groundFriction {
    my ($self) = @_;
        my $vehicleFrictionProperties = $self->getVehicleProperties()->getVehicleFrictionProperties();
        $self->getVehicleProperties()->getVehicleFrictionProperties()->friction($self->getVehicleProperties()->getVelocityProperties(), $vehicleFrictionProperties->getTireFrictionNominator());
}


# throws Exception
sub trackTo {
    my ($self, $reason) = @_;
        my $waypointBehaviorBase = $self->{waypointBehaviorBase};
        my $nextUnvisitedPathGeographicMapCellPosition = $waypointBehaviorBase->getNextUnvisitedPathGeographicMapCellPosition();
        my $point = $nextUnvisitedPathGeographicMapCellPosition->getMidPoint();
        my $dx = ($self->getXP() + $self->getHalfWidth()) - $point->getX();
        my $dy = ($self->getYP() + $self->getHalfHeight()) - $point->getY();
        $self->{rtsLogHelper}->trackTo($self, $nextUnvisitedPathGeographicMapCellPosition, $dx, $dy, $reason);
        $self->trackToDXY($dx, $dy);
}


# throws Exception
sub trackToDXY {
    my ($self, $dx, $dy) = @_;
        my $angleOfTarget = 0;
        $self->trackToDXYTargetAngle($dx, $dy, $angleOfTarget);
}


# throws Exception
sub turnTo {
    my ($self, $dx, $dy, $targetAngle) = @_;
        my $waypointBehaviorBase = $self->{waypointBehaviorBase};
        my $nextUnvisitedPathGeographicMapCellPosition = $waypointBehaviorBase->getNextUnvisitedPathGeographicMapCellPosition();
        my $evading = 0;
        if ($self->getUnitWaypointBehavior()->getSensorAction() == 'org::allbinary::game::layer::SensorActionFactory'->getInstance()->{EVADE}) {
            $self->{rtsLogHelper}->evade($self);
            $evading = 1;
            $targetAngle += 180;
        }
        my $angleInfo = $self->{rotationAnimationInterfaceP}->getAngleInfoP();
        my $angle = 'org::allbinary::math::FrameUtil'->getInstance()->adjustAngleToFrameAngle($angleInfo->getAngle() - 270);
        $self->{rtsLogHelper}->turnTo($self, $dx, $dy, $angleInfo, $angle, $self->{movementAngle}, $evading, $targetAngle);
        my $gameKeyEventFactory = 'org::allbinary::game::input::event::GameKeyEventFactory'->getInstance();
        if ($dx == 0 && $dy == 0) {
            $self->{rtsLogHelper}->doneMoving($self);
            return 1;
        } elsif ((int($self->{movementAngle}->getValue())) == $angle) {
            if ($dx > 0 && $self->{movementAngle} == $self->{angleFactory}->{LEFT}) {
                $self->{rtsLogHelper}->movingLeft($self);
                return 0;
            }
            if ($dx < 0 && $self->{movementAngle} == $self->{angleFactory}->{RIGHT}) {
                $self->{rtsLogHelper}->movingRight($self);
                return 0;
            }
            if ($dy > 0 && $self->{movementAngle} == $self->{angleFactory}->{UP}) {
                $self->{rtsLogHelper}->movingUp($self);
                return 0;
            }
            if ($dy < 0 && $self->{movementAngle} == $self->{angleFactory}->{DOWN}) {
                $self->{rtsLogHelper}->movingDown($self);
                return 0;
            }
            $self->{rtsLogHelper}->currentMoveEnded($self);
            if ($self->{movementAngle} == $self->{angleFactory}->{LEFT} || $self->{movementAngle} == $self->{angleFactory}->{RIGHT}) {
                $self->handleDeltalY($dx, $dy);
            } elsif ($self->{movementAngle} == $self->{angleFactory}->{UP} || $self->{movementAngle} == $self->{angleFactory}->{DOWN}) {
                $self->handleDeltalX($dx, $dy);
            }
            return 1;
        } else {
            if ($nextUnvisitedPathGeographicMapCellPosition != $org::allbinary::media::graphics::geography::map::SimpleGeographicMapCellPositionFactory::NULL_GEOGRAPHIC_MAP_CELL_POSITION) {
                if ($self->{steeringInsideGeographicMapCellPosition} != $nextUnvisitedPathGeographicMapCellPosition) {
                    if (abs($dx) > abs($dy) && $dy != 0) {
                        $self->handleDeltalY($dx, $dy);
                    } elsif ($dx != 0) {
                        $self->handleDeltalX($dx, $dy);
                    } else {
                        $self->handleDeltalY($dx, $dy);
                    }
                }
                my $deltaAngle2 = $self->{movementAngle}->getValue() - $angle;
                if ($deltaAngle2 > 0) {
                    $self->{rtsLogHelper}->rotateRight($self);
                    $self->getGameKeyEventList()->add($gameKeyEventFactory->getInstanceForKey($self, $javax::microedition::lcdui::Canvas::RIGHT));
                } else {
                    $self->{rtsLogHelper}->rotateLeft($self);
                    $self->getGameKeyEventList()->add($gameKeyEventFactory->getInstanceForKey($self, $javax::microedition::lcdui::Canvas::LEFT));
                }
                return 1;
            } else {
                $self->{rtsLogHelper}->noRotation($self);
            }
            return 0;
        }
}


sub handleDeltalX {
    my ($self, $dx, $dy) = @_;
        my $waypointBehaviorBase = $self->{waypointBehaviorBase};
        my $nextUnvisitedPathGeographicMapCellPosition = $waypointBehaviorBase->getNextUnvisitedPathGeographicMapCellPosition();
        if ($dx > 0) {
            $self->{movementAngle} = $self->{angleFactory}->{LEFT};
            $self->{steeringInsideGeographicMapCellPosition} = $nextUnvisitedPathGeographicMapCellPosition;
        } else {
            $self->{movementAngle} = $self->{angleFactory}->{RIGHT};
            $self->{steeringInsideGeographicMapCellPosition} = $nextUnvisitedPathGeographicMapCellPosition;
        }
        $self->{rtsLogHelper}->handle($self, $self->{movementAngle});
}


sub handleDeltalY {
    my ($self, $dx, $dy) = @_;
        my $waypointBehaviorBase = $self->{waypointBehaviorBase};
        my $nextUnvisitedPathGeographicMapCellPosition = $waypointBehaviorBase->getNextUnvisitedPathGeographicMapCellPosition();
        if ($dy > 0) {
            $self->{movementAngle} = $self->{angleFactory}->{UP};
            $self->{steeringInsideGeographicMapCellPosition} = $nextUnvisitedPathGeographicMapCellPosition;
        } else {
            $self->{movementAngle} = $self->{angleFactory}->{DOWN};
            $self->{steeringInsideGeographicMapCellPosition} = $nextUnvisitedPathGeographicMapCellPosition;
        }
        $self->{rtsLogHelper}->handle($self, $self->{movementAngle});
}


# throws Exception
sub trackToDXYTargetAngle {
    my ($self, $dx, $dy, $targetAngle) = @_;
        my $list = $self->getUnitWaypointBehavior()->getSteeringVisitorList();
        if ($list->size() > 0) {
            for (my $index = $list->size() - 1; $index >= 0; $index--) {
                my $steeringVisitor = $list->get($index);
                my $anyType = $steeringVisitor->visit($self);
                if (!defined($anyType)) {
                    $list->removeAt($index);
                }
            }
            $self->fireOrMove();
        } elsif (!$self->turnTo($dx, $dy, $targetAngle)) {
            $self->fireOrMove();
        }
}


# throws Exception
sub fireOrMove {
    my ($self) = @_;
        my $gameKeyEventFactory = 'org::allbinary::game::input::event::GameKeyEventFactory'->getInstance();
        if ($self->getUnitWaypointBehavior()->needToMove()) {
            $self->{rtsLayer2LogHelper}->steeringUp($self);
            if ($self->{showMoreCaptionStates} && !$self->{captionAnimationHelper}->isShowing()) {
                $self->{captionAnimationHelper}->update($org::allbinary::game::layer::unit::UnitLayer::MOVE, $self->{basicColorFactory}->{GREEN});
            }
            $self->getGameKeyEventList()->add($gameKeyEventFactory->getInstanceForKey($self, $javax::microedition::lcdui::Canvas::UP));
        } else {
            $self->{captionAnimationHelper}->update('org::allbinary::string::CommonPhoneStrings'->getInstance()->{FIRE}, $self->{basicColorFactory}->{RED});
            $self->{rtsLayer2LogHelper}->steeringFireOrStop($self);
            $self->allStop();
            $self->getGameKeyEventList()->add($gameKeyEventFactory->getInstanceForKey($self, $javax::microedition::lcdui::Canvas::KEY_NUM0));
            'org::allbinary::game::tracking::TrackingEventHandler'->getInstance()->fireEvent($self->getTrackingEvent());
        }
}


sub move {
    my ($self) = @_;
        try {
            my $velocityProperties = $self->getVehicleProperties()->getVelocityProperties();
            my $velocityXScaled = int($velocityProperties->getVelocityXBasicDecimalP()->getScaled());
            my $velocityYScaled = int($velocityProperties->getVelocityYBasicDecimalP()->getScaled());
            $self->getUnitWaypointBehavior()->move();
            if ($velocityXScaled != 0 || $velocityYScaled != 0) {
                $self->getUnitWaypointBehavior()->setMoving(1);
                my $geographicMapCompositeInterface = $self->{allBinaryGameLayerManagerP};
                my $geographicMapInterface = $geographicMapCompositeInterface->getGeographicMapInterface()->[0];
                $self->{layerPartialCellPositionsUtil}->getAllDXY($geographicMapInterface, $self, $velocityXScaled, $velocityYScaled, 'org::allbinary::game::layer::unit::UnitLayer'->getPartialpositionlist());
                my $cellPosition = 'org::allbinary::media::graphics::geography::map::drop::DropCellPositionHistory'->getInstance()->getCellPositionWithDrop('org::allbinary::game::layer::unit::UnitLayer'->getPartialpositionlist());
                if ($cellPosition == $self->{cellPositionFactory}->{NONE}) {
                    my $tiledLayer = $geographicMapInterface->getAllBinaryTiledLayer();
                    my $tiledLayerUtil = 'org::allbinary::game::layer::TiledLayerUtil'->getInstance();
                    my $x = $self->{x} + $velocityXScaled;
                    my $y = $self->{y} + $velocityYScaled;
                    $x = $tiledLayerUtil->keepOnMapX($tiledLayer, $x, $self->getWidth());
                    $y = $tiledLayerUtil->keepOnMapY($tiledLayer, $y, $self->getHeight());
                    $self->setPosition($x, $y, $self->{z});
                } else {
                    my $allbinaryLayer = 'org::allbinary::media::graphics::geography::map::drop::DropCellPositionHistory'->getInstance()->getLayerInterface($cellPosition);
                    $self->getUnitWaypointBehavior()->setMovingFromStopped(0);
                    $self->getUnitWaypointBehavior()->addBuildingChase($allbinaryLayer, $cellPosition);
                }
            }
            if ($self->getUnitWaypointBehavior()->isMoving()) {
                'org::allbinary::game::tracking::TrackingEventHandler'->getInstance()->fireEvent($self->getTrackingEvent());
            } else {
                $self->getUnitWaypointBehavior()->setMovingFromStopped(0);
            }
            if ($self->getUnitWaypointBehavior()->isMovingFromStopped() && $self->isVisible()) {
                'org::allbinary::media::audio::SecondaryPlayerQueueFactory'->getInstance()->add($self->{moveSoundInterface});
            }
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "move", $e);
        }
}


sub allStop {
    my ($self) = @_;
        my $velocityProperties = $self->getVehicleProperties()->getVelocityProperties();
        $velocityProperties->getVelocityXBasicDecimalP()->setint(0);
        $velocityProperties->getVelocityYBasicDecimalP()->setint(0);
}


sub paint {
    my ($self, $graphics) = @_;
        if ($self->isVisible()) {
            $self->SUPER::paint($graphics);
            my $viewPosition = $self->getViewPosition();
            my $viewX = $viewPosition->getX();
            my $viewY = $viewPosition->getY();
            $self->{decalAnimation}->paintXY($graphics, $viewX, $viewY);
            $self->{rangeAnimation}->paintXY($graphics, $viewX, $viewY);
            $self->{sensorRangeAnimation}->paintXY($graphics, $viewX, $viewY);
            $self->{damageFloatersPaintableInterface}->paint($graphics);
            $self->{healthBar}->paint($graphics);
            $self->{captionAnimationHelper}->paintXY($graphics, $viewX, $viewY);
            $self->{pathAnimation}->paintXY($graphics, $viewX, $viewY);
            $self->{resourceAnimation}->paintXY($graphics, $viewX, $viewY);
        }
}


# throws Exception
sub onBuildingEvent {
    my ($self, $event) = @_;
        my $buildingLayer = $event->getRtsLayer();
        $self->getUnitWaypointBehavior()->moveAwayFromBuilding($buildingLayer);
}


sub getVehicleProperties {
    my ($self) = @_;
        return $self->{vehicleProperties};
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


# throws Exception
sub setDestroyed {
    my ($self, $destroyed) = @_;
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, "setDestroyed");
        $self->SUPER::setDestroyed($destroyed);
        if ($self->isDestroyed()) {
            'org::allbinary::game::layer::waypoint::event::WaypointEventHandlerFactory'->getInstance($self->getGroupInterface()->[0])->removeListener($self->getUnitWaypointBehavior());
            'org::allbinary::game::tracking::TrackingEventHandler'->getInstance()->removeListener($self);
            'org::allbinary::game::layer::building::event::BuildingEventHandler'->getInstance()->removeListener($self);
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


sub getLoad {
    my ($self) = @_;
        return $self->{resourceLoad};
}


# throws Exception
sub clearResourceAnimation {
    my ($self) = @_;
        $self->{resourceAnimation} = 'org::allbinary::animation::NullIndexedAnimationFactory'->getFactoryInstance()->getInstance(0);
}


# throws Exception
sub setLoad {
    my ($self, $resource) = @_;
        if ($resource > 0) {
            $self->{resourceAnimation} = $self->{initResourceAnimation};
        } else {
            $self->clearResourceAnimation();
        }
        $self->{resourceLoad} = $resource;
}


sub addLoad {
    my ($self, $resource) = @_;
        $self->{resourceLoad} += $resource;
}


# throws Exception
sub handleCost {
    my ($self, $ownerLayer) = @_;
        if ($self->getLoad() > 0) {
            $self->{CAPITAL_EVENT}->setValue($self->getLoad());
            'org::allbinary::game::layer::capital::event::CapitalEventHandlerFactory'->getInstance($ownerLayer->getGroupInterface()->[0])->fireEvent($self->{CAPITAL_EVENT});
            $self->setLoad(0);
        }
}


sub createHudPaintable {
    my ($self) = @_;
        my $rtsLayerHudPaintable = 'org::allbinary::game::layer::RTSLayerHudPaintable'->getInstance();
        $rtsLayerHudPaintable->setBasicColorP($self->{allBinaryGameLayerManagerP}->getForegroundBasicColor());
        $rtsLayerHudPaintable->setRtsLayer($self);
        return $rtsLayerHudPaintable;
}


sub getHudPaintable {
    my ($self) = @_;
        my $rtsLayerHudPaintable = 'org::allbinary::game::layer::RTSLayerHudPaintable'->getInstance();
        return $rtsLayerHudPaintable;
}


sub getType {
    my ($self) = @_;
        return 'org::allbinary::game::layer::unit::UnitLayer'->getStaticType();
}


sub getStaticType {
    my ($class) = @_;
        return 1;
}


sub getUnitWaypointBehavior {
    my ($self) = @_;
        return $self->getWaypointBehavior();
}


sub getTrackingEvent {
    my ($self) = @_;
        return $self->{trackingEvent};
}


sub getCaptionAnimationHelper {
    my ($self) = @_;
        return $self->{captionAnimationHelper};
}


sub isSelfUpgradeable {
    my ($self) = @_;
        return 0;
}


sub getMaxResourceLoad {
    my ($self) = @_;
        return $self->{maxResourceLoad};
}


sub getPartialpositionlist {
    my ($class) = @_;
        return $org::allbinary::game::layer::unit::UnitLayer::partialPositionList;
}

# use javax::microedition::lcdui::Canvas;
# use javax::microedition::lcdui::Graphics;
use org::allbinary::J2MEUtil;
use org::allbinary::ag::weapon::media::audio::ExplosionBasicSound;
use org::allbinary::animation::Animation;
use org::allbinary::animation::AnimationInterfaceFactoryInterface;
use org::allbinary::animation::FeaturedAnimationInterfaceFactoryInterfaceFactory;
use org::allbinary::animation::IndexedAnimation;
use org::allbinary::animation::NullAnimationFactory;
use org::allbinary::animation::NullIndexedAnimationFactory;
use org::allbinary::animation::ProceduralAnimationInterfaceFactoryInterface;
use org::allbinary::animation::RotationAnimation;
use org::allbinary::animation::caption::CaptionAnimationHelper;
use org::allbinary::animation::caption::CaptionAnimationHelperBase;
use org::allbinary::animation::vector::AdjustedCircleAnimation;
use org::allbinary::direction::Direction;
use org::allbinary::game::combat::damage::DamageFloaters;
use org::allbinary::game::combat::damage::PtsDamageFloaters;
use org::allbinary::game::combat::weapon::WeaponProperties;
use org::allbinary::game::configuration::feature::Features;
use org::allbinary::game::configuration::feature::GameFeatureFactory;
use org::allbinary::game::graphics::hud::BasicHudFactory;
use org::allbinary::game::health::Health;
use org::allbinary::game::health::HealthBar;
use org::allbinary::game::health::HealthBarTwodAnimation;
use org::allbinary::game::identification::Group;
use org::allbinary::game::identification::GroupCommonFactory;
use org::allbinary::game::input::event::GameKeyEvent;
use org::allbinary::game::input::event::GameKeyEventFactory;
use org::allbinary::game::input::event::GameKeyEventUtil;
use org::allbinary::game::input::form::VisibleCellPositionsSingleton;
use org::allbinary::game::input::form::WaypointRTSFormInput;
use org::allbinary::game::layer::AdvancedRTSGameLayer;
use org::allbinary::game::layer::AdvancedRTSProperties;
use org::allbinary::game::layer::AllBinaryGameLayerManager;
use org::allbinary::game::layer::AllBinaryTiledLayer;
use org::allbinary::game::layer::CaptionResources;
use org::allbinary::game::layer::LinePathRelativeAnimation;
use org::allbinary::game::layer::PathAnimation;
use org::allbinary::game::layer::PathFindingLayerInterface;
use org::allbinary::game::layer::RTSLayer2LogHelper;
use org::allbinary::game::layer::RTSLayer2SelectedLogHelper;
use org::allbinary::game::layer::RTSLayerEvent;
use org::allbinary::game::layer::RTSLayerHudPaintable;
use org::allbinary::game::layer::RTSLayerLogHelper;
use org::allbinary::game::layer::RTSLayerSelectedLogHelper;
use org::allbinary::game::layer::RTSPlayerLayerInterface;
use org::allbinary::game::layer::SelectionHudPaintable;
use org::allbinary::game::layer::SensorActionFactory;
use org::allbinary::game::layer::SteeringVisitor;
use org::allbinary::game::layer::TiledLayerUtil;
use org::allbinary::game::layer::VehicleFrictionProperties;
use org::allbinary::game::layer::VehicleProperties;
use org::allbinary::game::layer::WaypointBehaviorBase;
use org::allbinary::game::layer::building::BuildingLayer;
use org::allbinary::game::layer::building::event::BuildingEventHandler;
use org::allbinary::game::layer::building::event::BuildingEventListenerInterface;
use org::allbinary::game::layer::capital::event::CapitalEvent;
use org::allbinary::game::layer::capital::event::CapitalEventHandlerFactory;
use org::allbinary::game::layer::geographic::map::LayerPartialCellPositionsUtil;
use org::allbinary::game::layer::special::SpecialDownGameInputProcessor;
use org::allbinary::game::layer::special::SpecialFireGameInputProcessor;
use org::allbinary::game::layer::special::SpecialLeftGameInputProcessor;
use org::allbinary::game::layer::special::SpecialRightGameInputProcessor;
use org::allbinary::game::layer::special::SpecialUpGameInputProcessor;
use org::allbinary::game::layer::waypoint::MultipassNoCacheWaypoint;
use org::allbinary::game::layer::waypoint::NoCacheWaypoint;
use org::allbinary::game::layer::waypoint::WaypointBase;
use org::allbinary::game::layer::waypoint::event::WaypointEventHandlerFactory;
use org::allbinary::game::multiplayer::layer::RemoteInfo;
use org::allbinary::game::part::weapon::BasicWeaponPart;
use org::allbinary::game::part::weapon::SalvoInterface;
use org::allbinary::game::physics::velocity::VelocityProperties;
use org::allbinary::game::tracking::TrackingEvent;
use org::allbinary::game::tracking::TrackingEventHandler;
use org::allbinary::game::tracking::TrackingEventListenerInterface;
use org::allbinary::graphics::CellPositionFactory;
use org::allbinary::graphics::GPoint;
use org::allbinary::graphics::Rectangle;
use org::allbinary::graphics::color::BasicColorFactory;
use org::allbinary::graphics::paint::NullPaintable;
use org::allbinary::graphics::paint::Paintable;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::layer::AllBinaryLayerManager;
use org::allbinary::layer::Layer;
use org::allbinary::layer::LayerInterfaceFactoryInterface;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::math::BasicDecimal;
use org::allbinary::logic::math::SmallIntegerSingletonFactory;
use org::allbinary::math::AngleFactory;
use org::allbinary::math::AngleInfo;
use org::allbinary::math::FrameUtil;
use org::allbinary::math::LayerDistanceUtil;
use org::allbinary::math::NamedAngle;
use org::allbinary::media::audio::AttackSound;
use org::allbinary::media::audio::SecondaryPlayerQueueFactory;
use org::allbinary::media::audio::Sound;
use org::allbinary::media::graphics::geography::map::BasicGeographicMap;
use org::allbinary::media::graphics::geography::map::BasicGeographicMapCellPositionFactory;
use org::allbinary::media::graphics::geography::map::GeographicMapCellHistory;
use org::allbinary::media::graphics::geography::map::GeographicMapCellPosition;
use org::allbinary::media::graphics::geography::map::GeographicMapCompositeInterface;
use org::allbinary::media::graphics::geography::map::SimpleGeographicMapCellPositionFactory;
use org::allbinary::media::graphics::geography::map::drop::DropCellPositionHistory;
use org::allbinary::media::graphics::geography::map::racetrack::RaceTrackGeographicMap;
use org::allbinary::string::CommonPhoneStrings;
use org::allbinary::util::ABHashtable;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::util::BasicArrayListS;
use org::allbinary::view::ViewPositionBase;
use org::allbinary::game::layer::unit::CollidableUnitBehavior;
use org::allbinary::game::layer::unit::UnitWaypointBehavior2;

1;

