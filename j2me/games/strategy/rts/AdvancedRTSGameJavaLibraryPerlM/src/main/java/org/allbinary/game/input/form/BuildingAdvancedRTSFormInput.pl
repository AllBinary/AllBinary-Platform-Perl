# 
# AllBinary Open License Version 1 
# Copyright (c) 2002 AllBinary 
#  
# By agreeing to this license you and any business entity you represent are 
# legally bound to the AllBinary Open License Version 1 legal agreement. 
#  
# You may obtain the AllBinary Open License Version 1 legal agreement from 
# AllBinary or the root directory of AllBinary's AllBinary Platform repository. 
#  
# Created By: Travis Berthelot  
# Generated Code Do Not Modify

package org::allbinary::game::input::form::BuildingAdvancedRTSFormInput;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::input::form::BuildingRTSFormInput';


sub _init_fields {
    my ($self) = @_;
    $self->{atLeastOneHouseGameNotificationEvent} = undef;
    $self->{BUILD_BUILDING_RTS_LAYER_EVENT} = 'org::allbinary::game::layer::RTSLayerEvent'->new($org::allbinary::game::layer::NullPathFindingLayer::NULL_PATH_FINDING_LAYER);
}


sub new {
    my ($class, $groupInterface, $isUnitProducer) = @_;
    my $self = $class->SUPER::new($groupInterface, $isUnitProducer);
    $self->_init_fields();
        # super(...) made $self above
        my $basicColorFactory = 'org::allbinary::graphics::color::BasicColorFactory'->getInstance();
        $self->{atLeastOneHouseGameNotificationEvent} = 'org::allbinary::game::layer::hud::event::GameNotificationEvent'->new($self, "Build At Least One House First", 'org::allbinary::logic::math::SmallIntegerSingletonFactory'->getInstance()->getAt(2), $basicColorFactory->{WHITE}, 'org::allbinary::logic::java::bool::BooleanFactory'->getInstance()->{FALSE});
    return $self;
}


# throws Exception
sub setAllBinaryGameLayerManager {
    my ($self, $allBinaryGameLayerManager) = @_;
        $self->SUPER::setAllBinaryGameLayerManager($allBinaryGameLayerManager);
        my $geographicMapCompositeInterface = $allBinaryGameLayerManager;
        my $geographicMapInterface = $geographicMapCompositeInterface->getGeographicMapInterface()->[0];
        $self->{atLeastOneHouseGameNotificationEvent}->setBasicColorP($geographicMapInterface->getForegroundBasicColor());
}


sub isPositionBlocked {
    my ($self) = @_;
        if ('org::allbinary::media::graphics::geography::map::drop::DropCellPositionHistory'->getInstance()->isCellPositionWithDrop($self->getSelectedGeographicCellPosition()) || 'org::allbinary::game::layer::waypoint::WaypointCellPositionHistory'->getInstance()->isCellPositionWithDrop($self->getSelectedGeographicCellPosition())) {
            return 1;
        } else {
            return 0;
        }
}


# throws Exception
sub isBuildAttemptValid {
    my ($self, $rtsPlayerLayerInterface, $layerInterface) = @_;
        my $advancedRTSPlayerLayerInterface = $rtsPlayerLayerInterface;
        my $advancedPlayerOwnedRTSLayers = $advancedRTSPlayerLayerInterface->getAdvancedPlayerOwnedRTSLayers();
        my $totalHouses = $advancedPlayerOwnedRTSLayers->getHouseList()->size();
        if ($totalHouses < 1 && $layerInterface->getName()->indexOf(" House") < 0) {
            $rtsPlayerLayerInterface->add('org::allbinary::media::audio::ErrorSound'->getInstance());
            if (!$rtsPlayerLayerInterface->implmentsArtificialIntelligenceCompositeInterface()) {
                'org::allbinary::game::layer::hud::event::GameNotificationEventHandler'->getInstance()->fireEvent($self->{atLeastOneHouseGameNotificationEvent});
            }
            return 0;
        }
        return $self->SUPER::isBuildAttemptValid($rtsPlayerLayerInterface, $layerInterface);
}


# throws Exception
sub add {
    my ($self, $rtsPlayerLayerInterface, $layerManager, $layerInterface) = @_;
        $self->{BUILD_BUILDING_RTS_LAYER_EVENT}->setRtsLayer($layerInterface);
        'org::allbinary::game::layer::building::event::BuildingEventHandler'->getInstance()->fireEvent($self->{BUILD_BUILDING_RTS_LAYER_EVENT});
        if (($rtsPlayerLayerInterface)->isLocalPlayer()) {
            'org::allbinary::game::layer::building::event::LocalPlayerBuildingEventHandler'->getInstance()->fireEvent($self->{BUILD_BUILDING_RTS_LAYER_EVENT});
        }
        $self->SUPER::add($rtsPlayerLayerInterface, $layerManager, $layerInterface);
}

use org::allbinary::game::layer::AdvancedPlayerOwnedRTSLayers;
use org::allbinary::game::layer::AdvancedRTSPlayerLayerInterface;
use org::allbinary::game::layer::RTSLayer;
use org::allbinary::game::layer::RTSLayerEvent;
use org::allbinary::game::layer::RTSPlayerLayerInterface;
use org::allbinary::game::layer::building::event::BuildingEventHandler;
use org::allbinary::game::layer::building::event::LocalPlayerBuildingEventHandler;
use org::allbinary::game::layer::waypoint::WaypointCellPositionHistory;
use org::allbinary::logic::java::bool::BooleanFactory;
use org::allbinary::game::identification::Group;
use org::allbinary::game::layer::AllBinaryGameLayerManager;
use org::allbinary::game::layer::NullPathFindingLayer;
use org::allbinary::game::layer::hud::event::GameNotificationEvent;
use org::allbinary::game::layer::hud::event::GameNotificationEventHandler;
use org::allbinary::graphics::color::BasicColorFactory;
use org::allbinary::layer::AllBinaryLayerManager;
use org::allbinary::logic::math::SmallIntegerSingletonFactory;
use org::allbinary::media::audio::ErrorSound;
use org::allbinary::media::graphics::geography::map::BasicGeographicMap;
use org::allbinary::media::graphics::geography::map::GeographicMapCompositeInterface;
use org::allbinary::media::graphics::geography::map::drop::DropCellPositionHistory;
use org::allbinary::game::input::form::BuildingRTSFormInput;

1;

