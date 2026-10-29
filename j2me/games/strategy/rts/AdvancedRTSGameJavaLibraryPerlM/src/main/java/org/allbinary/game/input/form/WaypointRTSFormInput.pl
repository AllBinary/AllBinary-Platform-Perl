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

package org::allbinary::game::input::form::WaypointRTSFormInput;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::input::form::RTSFormInput';


sub _init_fields {
    my ($self) = @_;
    $self->{WAYPOINT_EVENT} = 'org::allbinary::game::layer::RTSLayerEvent'->new($org::allbinary::game::layer::NullRTSLayer::NULL_RTS_LAYER);
    $self->{dragToSpotGameNotificationEvent} = undef;
    $self->{spotTakenGameNotificationEvent} = undef;
    $self->{buildingCollisionGameNotificationEvent} = undef;
    $self->{roadCollisionGameNotificationEvent} = undef;
    $self->{newWaypointGameNotificationEvent} = undef;
    $self->{noMoneyGameNotificationEvent} = undef;
    $self->{isPrimaryWaypointCreator} = undef;
    $self->{stickyAssociatedRtsLayer} = $org::allbinary::game::layer::NullPathFindingLayer::NULL_PATH_FINDING_LAYER;
}


sub new {
    my ($class, $groupInterface, $isPrimaryWaypointCreator) = @_;
    my $self = $class->SUPER::new($groupInterface);
    $self->_init_fields();
        # super(...) made $self above
        $self->{isPrimaryWaypointCreator} = $isPrimaryWaypointCreator;
        my $smallIntegerSingletonFactory = 'org::allbinary::logic::math::SmallIntegerSingletonFactory'->getInstance();
        my $basicColorFactory = 'org::allbinary::graphics::color::BasicColorFactory'->getInstance();
        $self->{dragToSpotGameNotificationEvent} = 'org::allbinary::game::layer::hud::event::GameNotificationEvent'->new($self, 'org::allbinary::game::layer::RTSGameStrings'->getInstance()->{DRAG_TO_SPOT}, $smallIntegerSingletonFactory->getAt(2), $basicColorFactory->{WHITE}, 'org::allbinary::logic::java::bool::BooleanFactory'->getInstance()->{FALSE});
        $self->{spotTakenGameNotificationEvent} = 'org::allbinary::game::layer::hud::event::GameNotificationEvent'->new($self, 'org::allbinary::game::layer::RTSGameStrings'->getInstance()->{SPOT_TAKEN}, $smallIntegerSingletonFactory->getAt(2), $basicColorFactory->{WHITE}, 'org::allbinary::logic::java::bool::BooleanFactory'->getInstance()->{FALSE});
        $self->{buildingCollisionGameNotificationEvent} = 'org::allbinary::game::layer::hud::event::GameNotificationEvent'->new($self, 'org::allbinary::game::layer::RTSGameStrings'->getInstance()->{BUILDING_COLLISION}, $smallIntegerSingletonFactory->getAt(2), $basicColorFactory->{WHITE}, 'org::allbinary::logic::java::bool::BooleanFactory'->getInstance()->{FALSE});
        $self->{roadCollisionGameNotificationEvent} = 'org::allbinary::game::layer::hud::event::GameNotificationEvent'->new($self, 'org::allbinary::game::layer::RTSGameStrings'->getInstance()->{ROAD_COLLISION}, $smallIntegerSingletonFactory->getAt(2), $basicColorFactory->{WHITE}, 'org::allbinary::logic::java::bool::BooleanFactory'->getInstance()->{FALSE});
        $self->{newWaypointGameNotificationEvent} = 'org::allbinary::game::layer::hud::event::GameNotificationEvent'->new($self, 'org::allbinary::game::layer::RTSGameStrings'->getInstance()->{NEW_WAYPOINT}, $smallIntegerSingletonFactory->getAt(2), $basicColorFactory->{WHITE}, 'org::allbinary::logic::java::bool::BooleanFactory'->getInstance()->{FALSE});
        $self->{noMoneyGameNotificationEvent} = 'org::allbinary::game::layer::hud::event::GameNotificationEvent'->new($self, 'org::allbinary::game::layer::RTSGameStrings'->getInstance()->{NO_MONEY}, $smallIntegerSingletonFactory->getAt(2), $basicColorFactory->{WHITE}, 'org::allbinary::logic::java::bool::BooleanFactory'->getInstance()->{FALSE});
    return $self;
}


# throws Exception
sub setAllBinaryGameLayerManager {
    my ($self, $allBinaryGameLayerManager) = @_;
        $self->SUPER::setAllBinaryGameLayerManager($allBinaryGameLayerManager);
        my $geographicMapCompositeInterface = $allBinaryGameLayerManager;
        my $geographicMapInterface = $geographicMapCompositeInterface->getGeographicMapInterface()->[0];
        $self->{dragToSpotGameNotificationEvent}->setBasicColorP($geographicMapInterface->getForegroundBasicColor());
        $self->{spotTakenGameNotificationEvent}->setBasicColorP($geographicMapInterface->getForegroundBasicColor());
        $self->{buildingCollisionGameNotificationEvent}->setBasicColorP($geographicMapInterface->getForegroundBasicColor());
        $self->{roadCollisionGameNotificationEvent}->setBasicColorP($geographicMapInterface->getForegroundBasicColor());
        $self->{newWaypointGameNotificationEvent}->setBasicColorP($geographicMapInterface->getForegroundBasicColor());
        $self->{noMoneyGameNotificationEvent}->setBasicColorP($geographicMapInterface->getForegroundBasicColor());
}


# throws Exception
sub processAtPoint {
    my ($self, $associatedRtsLayer, $rtsPlayerLayerInterface, $layerManager, $point) = @_;
        $self->SUPER::process($layerManager);
        if ($self->isStickyItemSelected() || $associatedRtsLayer == 'org::allbinary::game::layer::special::CollidableDestroyableDamageableLayer'->getNullInstance()) {
            if ($self->isStickyItemSelected() && $associatedRtsLayer == 'org::allbinary::game::layer::special::CollidableDestroyableDamageableLayer'->getNullInstance()) {
                my $geographicMapCompositeInterface = $layerManager;
                my $geographicMapInterface = $geographicMapCompositeInterface->getGeographicMapInterface()->[0];
                my $allBinaryTiledLayer = $geographicMapInterface->getAllBinaryTiledLayer();
                my $x = $point->getX() + $allBinaryTiledLayer->getXP();
                my $y = $point->getY() + $allBinaryTiledLayer->getYP();
                my $geographicMapCellPosition = $geographicMapInterface->getCellPositionAtXY($x, $y);
                $self->processCellPosition($rtsPlayerLayerInterface, $layerManager, $geographicMapCellPosition);
            } else {
                if (!$rtsPlayerLayerInterface->implmentsArtificialIntelligenceCompositeInterface()) {
                    'org::allbinary::game::layer::hud::event::GameNotificationEventHandler'->getInstance()->fireEvent($self->{dragToSpotGameNotificationEvent});
                }
            }
        } else {
            if (!$rtsPlayerLayerInterface->implmentsArtificialIntelligenceCompositeInterface()) {
                'org::allbinary::game::layer::hud::event::GameNotificationEventHandler'->getInstance()->fireEvent($self->{spotTakenGameNotificationEvent});
            }
        }
}


# throws Exception
sub processCellPosition {
    my ($self, $rtsPlayerLayerInterface, $layerManager, $geographicMapCellPosition) = @_;
        my $itemIndex = $self->getSelectedStickyItemIndex();
        if ($self->{newUnconstructedRTSLayerInterfaceArray}->[$itemIndex] == 'org::allbinary::game::layer::special::CollidableDestroyableDamageableLayer'->getNullInstance()) {
            $self->{newUnconstructedRTSLayerInterfaceArray}->[$itemIndex] = $self->getInstance($layerManager, $self->getSelectedStickyItem(), $geographicMapCellPosition);
        } else {
            my $cellPoint = $geographicMapCellPosition->getPoint();
            my $rtsLayer = $self->{newUnconstructedRTSLayerInterfaceArray}->[$itemIndex];
            $rtsLayer->setPosition($cellPoint->getX(), $cellPoint->getY(), $rtsLayer->getZP());
            my $geographicMapCompositeInterface = $rtsLayer->{allBinaryGameLayerManagerP};
            my $geographicMapInterface = $geographicMapCompositeInterface->getGeographicMapInterface()->[0];
            $rtsLayer->{geographicMapCellPositionAreaBase}->update($geographicMapInterface);
        }
        $self->attemptBuild($rtsPlayerLayerInterface, $layerManager, $self->{newUnconstructedRTSLayerInterfaceArray}->[$itemIndex], $itemIndex);
}


# throws Exception
sub processStickyGameSpecific {
    my ($self, $associatedRtsLayer, $rtsPlayerLayerInterface, $layerManager, $item, $index) = @_;
        $self->{logUtil}->putF("Set Sticking Item: " . $item, $self, "processSticky");
        $self->setSelectedStickyItem($item);
        $self->setSelectedStickyItemIndex($index);
        $self->setStickyItemSelected(1);
        $self->{stickyAssociatedRtsLayer} = $associatedRtsLayer;
        $self->getHashtable()->put($org::allbinary::layer::Layer::ID, $associatedRtsLayer);
}


# throws Exception
sub attemptBuild {
    my ($self, $rtsPlayerLayerInterface, $layerManager, $layerInterface, $itemIndex) = @_;
        $self->{logUtil}->putF("Layer: " . $layerInterface, $self, "attemptBuild");
        if (!defined($layerInterface)) {
            $self->{logUtil}->put("Layer was null", $self, "attemptBuild", ("Exception"));
            return 0;
        }
        my $geographicMapCellPositionArea = $layerInterface->{geographicMapCellPositionAreaBase};
        my $list = $geographicMapCellPositionArea->getOccupyingGeographicMapCellPositionList();
        if ('org::allbinary::media::graphics::geography::map::drop::DropCellPositionHistory'->getInstance()->anyCellPositionWithDrop($list) || 'org::allbinary::game::layer::waypoint::WaypointCellPositionHistory'->getInstance()->anyCellPositionWithDrop($list)) {
            $rtsPlayerLayerInterface->add('org::allbinary::media::audio::ErrorSound'->getInstance());
            if (!$rtsPlayerLayerInterface->implmentsArtificialIntelligenceCompositeInterface()) {
                'org::allbinary::game::layer::hud::event::GameNotificationEventHandler'->getInstance()->fireEvent($self->{buildingCollisionGameNotificationEvent});
            }
            return 0;
        }
        my $geographicMapCompositeInterface = $layerManager;
        my $geographicMapInterface = $geographicMapCompositeInterface->getGeographicMapInterface()->[0];
        my $raceTrackGeographicMapCellTypeFactory = $geographicMapInterface->getGeographicMapCellTypeFactory();
        my $geographicMapCellType = undef;
        for (my $index = $list->size(); --$index >= 0; ) {
            $geographicMapCellType = $geographicMapInterface->getCellTypeAt($list->get($index));
            if ($raceTrackGeographicMapCellTypeFactory->isPath($geographicMapCellType)) {
                $rtsPlayerLayerInterface->add('org::allbinary::media::audio::ErrorSound'->getInstance());
                if (!$rtsPlayerLayerInterface->implmentsArtificialIntelligenceCompositeInterface()) {
                    'org::allbinary::game::layer::hud::event::GameNotificationEventHandler'->getInstance()->fireEvent($self->{roadCollisionGameNotificationEvent});
                }
                return 0;
            }
        }
        my $cost = $layerInterface->getCost();
        my $capital = $rtsPlayerLayerInterface->getCapital();
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append("Trying to Build: ");
        $stringBuffer->append($layerInterface->getName());
        $stringBuffer->append(" for: \$");
        $stringBuffer->appendint($cost);
        $stringBuffer->append(" with ");
        $stringBuffer->appendint(int($capital->getTotalMoney()));
        $self->{logUtil}->putF($stringBuffer->toString(), $self, "attemptBuild");
        if ($cost <= $capital->getTotalMoney()) {
            $layerInterface->construct($rtsPlayerLayerInterface);
            $self->{newUnconstructedRTSLayerInterfaceArray}->[$itemIndex] = 'org::allbinary::game::layer::special::CollidableDestroyableDamageableLayer'->getNullInstance();
            $capital->removeMoney($cost);
            'org::allbinary::game::layer::waypoint::WaypointCellPositionHistory'->getInstance()->addList($list, $layerInterface);
            my $geographicMapCellPosition = $geographicMapInterface->getCellPositionAtXY($layerInterface->getXP(), $layerInterface->getYP());
            my $waypointLayer = $layerInterface;
            $self->addWayPoint($waypointLayer);
            my $rtsPlayerGameInput = $rtsPlayerLayerInterface->getPlayerGameInput();
            $rtsPlayerGameInput->setSelectedRTSLayer($layerInterface, $geographicMapCellPosition);
            my $advancedRTSPlayerLayerInterface = $rtsPlayerLayerInterface;
            $advancedRTSPlayerLayerInterface->getAdvancedPlayerOwnedRTSLayers()->addWaypoint($layerInterface);
            $layerManager->append($layerInterface);
            my $waypointAvancedRTSGameLayer = $waypointLayer;
            $rtsPlayerLayerInterface->add($waypointAvancedRTSGameLayer->getWaypointBehavior()->getWaypoint()->getSound());
            if (!$rtsPlayerLayerInterface->implmentsArtificialIntelligenceCompositeInterface()) {
                'org::allbinary::game::layer::hud::event::GameNotificationEventHandler'->getInstance()->fireEvent($self->{newWaypointGameNotificationEvent});
            }
            return 1;
        } else {
            $rtsPlayerLayerInterface->add('org::allbinary::media::audio::ErrorSound'->getInstance());
            if (!$rtsPlayerLayerInterface->implmentsArtificialIntelligenceCompositeInterface()) {
                'org::allbinary::game::layer::hud::event::GameNotificationEventHandler'->getInstance()->fireEvent($self->{noMoneyGameNotificationEvent});
            }
            return 0;
        }
}


# throws Exception
sub addWayPoint {
    my ($self, $layerInterface) = @_;
        my $stickyAssociatedAdvandedRtsLayer = $self->{stickyAssociatedRtsLayer};
        my $list = $stickyAssociatedAdvandedRtsLayer->getWaypointBehavior()->getOwnedWaypointList();
        'org::allbinary::game::layer::RTSLayerUtil'->getInstance()->destroyAndClear($list);
        $list->add($layerInterface);
        if ($self->{isPrimaryWaypointCreator}) {
            'org::allbinary::game::input::form::PrimaryWaypointHelper'->getInstance()->setWaypointLayer($layerInterface);
        }
        $self->{WAYPOINT_EVENT}->setRtsLayer($layerInterface);
        'org::allbinary::game::layer::waypoint::event::WaypointEventHandlerFactory'->getInstance($layerInterface->getGroupInterface()->[0])->fireEvent($self->{WAYPOINT_EVENT});
}

use org::allbinary::logic::string::StringMaker;
use org::allbinary::game::input::RTSPlayerGameInput;
use org::allbinary::game::layer::AdvancedRTSGameLayer;
use org::allbinary::game::layer::AdvancedRTSPlayerLayerInterface;
use org::allbinary::game::layer::RTSGameStrings;
use org::allbinary::game::layer::RTSLayer;
use org::allbinary::game::layer::RTSLayerEvent;
use org::allbinary::game::layer::RTSLayerUtil;
use org::allbinary::game::layer::RTSPlayerLayerInterface;
use org::allbinary::game::layer::capital::Capital;
use org::allbinary::game::layer::waypoint::WaypointCellPositionHistory;
use org::allbinary::game::layer::waypoint::WaypointLayer;
use org::allbinary::game::layer::waypoint::event::WaypointEventHandlerFactory;
use org::allbinary::graphics::form::item::ABCustomItem;
use org::allbinary::util::BasicArrayList;
use org::allbinary::logic::java::bool::BooleanFactory;
use org::allbinary::game::identification::Group;
use org::allbinary::game::layer::AllBinaryGameLayerManager;
use org::allbinary::game::layer::AllBinaryTiledLayer;
use org::allbinary::game::layer::GeographicMapCellPositionAreaBase;
use org::allbinary::game::layer::NullPathFindingLayer;
use org::allbinary::game::layer::NullRTSLayer;
use org::allbinary::game::layer::PathFindingLayerInterface;
use org::allbinary::game::layer::hud::event::GameNotificationEvent;
use org::allbinary::game::layer::hud::event::GameNotificationEventHandler;
use org::allbinary::game::layer::special::CollidableDestroyableDamageableLayer;
use org::allbinary::graphics::GPoint;
use org::allbinary::graphics::color::BasicColorFactory;
use org::allbinary::layer::AllBinaryLayerManager;
use org::allbinary::layer::Layer;
use org::allbinary::logic::math::SmallIntegerSingletonFactory;
use org::allbinary::media::audio::ErrorSound;
use org::allbinary::media::graphics::geography::map::BasicGeographicMap;
use org::allbinary::media::graphics::geography::map::GeographicMapCellPosition;
use org::allbinary::media::graphics::geography::map::GeographicMapCellType;
use org::allbinary::media::graphics::geography::map::GeographicMapCompositeInterface;
use org::allbinary::media::graphics::geography::map::drop::DropCellPositionHistory;
use org::allbinary::media::graphics::geography::map::racetrack::RaceTrackGeographicMapCellTypeFactory;
use org::allbinary::game::input::form::RTSFormInput;
use org::allbinary::game::input::form::PrimaryWaypointHelper;

1;

