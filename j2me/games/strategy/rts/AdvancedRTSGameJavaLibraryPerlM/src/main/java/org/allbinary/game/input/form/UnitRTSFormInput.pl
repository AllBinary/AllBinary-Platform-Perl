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

package org::allbinary::game::input::form::UnitRTSFormInput;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::input::form::RTSFormInput';

our $DECAL_ID = 'org::allbinary::logic::math::SmallIntegerSingletonFactory'->getInstance()->getAt(23);

sub _init_fields {
    my ($self) = @_;
    $self->{noMoneyGameNotificationEvent} = undef;
    $self->{newUnitGameNotificationEvent} = undef;
}


sub new {
    my ($class, $groupInterface) = @_;
    my $self = $class->SUPER::new($groupInterface);
    $self->_init_fields();
        # super(...) made $self above
        my $smallIntegerSingletonFactory = 'org::allbinary::logic::math::SmallIntegerSingletonFactory'->getInstance();
        my $basicColorFactory = 'org::allbinary::graphics::color::BasicColorFactory'->getInstance();
        $self->{noMoneyGameNotificationEvent} = 'org::allbinary::game::layer::hud::event::GameNotificationEvent'->new($self, 'org::allbinary::game::layer::RTSGameStrings'->getInstance()->{NO_MONEY}, $smallIntegerSingletonFactory->getAt(2), $basicColorFactory->{WHITE}, 'org::allbinary::logic::java::bool::BooleanFactory'->getInstance()->{FALSE});
        $self->{newUnitGameNotificationEvent} = 'org::allbinary::game::layer::hud::event::GameNotificationEvent'->new($self, 'org::allbinary::game::layer::RTSGameStrings'->getInstance()->{NEW_UNIT}, $smallIntegerSingletonFactory->getAt(2), $basicColorFactory->{WHITE}, 'org::allbinary::logic::java::bool::BooleanFactory'->getInstance()->{FALSE});
        $self->getHashtable()->put($org::allbinary::game::layer::waypoint::WorkWaypoint::ID, $smallIntegerSingletonFactory->getAt(50));
    return $self;
}


# throws Exception
sub setAllBinaryGameLayerManager {
    my ($self, $allBinaryGameLayerManager) = @_;
        $self->SUPER::setAllBinaryGameLayerManager($allBinaryGameLayerManager);
        my $geographicMapCompositeInterface = $allBinaryGameLayerManager;
        my $geographicMapInterface = $geographicMapCompositeInterface->getGeographicMapInterface()->[0];
        $self->{noMoneyGameNotificationEvent}->setBasicColorP($geographicMapInterface->getForegroundBasicColor());
        $self->{newUnitGameNotificationEvent}->setBasicColorP($geographicMapInterface->getForegroundBasicColor());
}


# throws Exception
sub processGameSpecific {
    my ($self, $associatedRtsLayer, $rtsPlayerLayerInterface, $layerManager, $item, $itemIndex) = @_;
        $self->SUPER::process($layerManager);
        my $associatedRtsLayer2 = $associatedRtsLayer;
        my $geographicMapCellPositionArea = $associatedRtsLayer2->{geographicMapCellPositionAreaBase};
        my $geographicMapCellPosition = $geographicMapCellPositionArea->getNextSurroundingGeographicMapCellPosition();
        $self->getHashtable()->put($org::allbinary::layer::Layer::ID, $associatedRtsLayer);
        $self->getHashtable()->put($org::allbinary::game::input::form::UnitRTSFormInput::DECAL_ID, ($rtsPlayerLayerInterface)->getDecalBasicColor());
        if ($self->{newUnconstructedRTSLayerInterfaceArray}->[$itemIndex] == 'org::allbinary::game::layer::special::CollidableDestroyableDamageableLayer'->getNullInstance()) {
            $self->{newUnconstructedRTSLayerInterfaceArray}->[$itemIndex] = $self->getInstance($layerManager, $item, $geographicMapCellPosition);
        } else {
            my $cellPoint = $geographicMapCellPosition->getPoint();
            my $rtsLayer = $self->{newUnconstructedRTSLayerInterfaceArray}->[$itemIndex];
            $rtsLayer->setPosition($cellPoint->getX(), $cellPoint->getY(), $rtsLayer->getZP());
            my $geographicMapCompositeInterface = $rtsLayer->{allBinaryGameLayerManagerP};
            my $geographicMapInterface = $geographicMapCompositeInterface->getGeographicMapInterface()->[0];
            $rtsLayer->{geographicMapCellPositionAreaBase}->update($geographicMapInterface);
        }
        my $cellPoint = $geographicMapCellPosition->getMidPoint();
        my $rtsLayer = $self->{newUnconstructedRTSLayerInterfaceArray}->[$itemIndex];
        $rtsLayer->setPosition($cellPoint->getX() - $rtsLayer->getHalfWidth(), $cellPoint->getY() - $rtsLayer->getHalfHeight(), $rtsLayer->getZP());
        $self->attemptBuild($associatedRtsLayer2, $rtsPlayerLayerInterface, $layerManager, $rtsLayer, $itemIndex);
}


# throws Exception
sub attemptBuild {
    my ($self, $associatedRtsLayer, $rtsPlayerLayerInterface, $layerManager, $layerInterface, $itemIndex) = @_;
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
            $rtsPlayerLayerInterface->add('org::allbinary::media::audio::BuildingSound'->getInstance());
            $capital->removeMoney($cost);
            'org::allbinary::game::input::form::AssignWaypointsUtil'->getInstance()->set($layerInterface, $associatedRtsLayer);
            $layerManager->appendAt($layerInterface, $org::allbinary::game::input::form::PlayersSingletonFactory::total);
            my $advancedRTSPlayerLayerInterface = $rtsPlayerLayerInterface;
            my $advancedPlayerOwnedRTSLayers = $advancedRTSPlayerLayerInterface->getAdvancedPlayerOwnedRTSLayers();
            $advancedPlayerOwnedRTSLayers->addUnit($layerInterface);
            if (!$rtsPlayerLayerInterface->implmentsArtificialIntelligenceCompositeInterface()) {
                'org::allbinary::game::layer::hud::event::GameNotificationEventHandler'->getInstance()->fireEvent($self->{newUnitGameNotificationEvent});
            }
        } else {
            $rtsPlayerLayerInterface->add('org::allbinary::media::audio::ErrorSound'->getInstance());
            if (!$rtsPlayerLayerInterface->implmentsArtificialIntelligenceCompositeInterface()) {
                'org::allbinary::game::layer::hud::event::GameNotificationEventHandler'->getInstance()->fireEvent($self->{noMoneyGameNotificationEvent});
            }
        }
}

use org::allbinary::graphics::form::item::ABCustomItem;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::game::layer::AdvancedPlayerOwnedRTSLayers;
use org::allbinary::game::layer::AdvancedRTSGameLayer;
use org::allbinary::game::layer::AdvancedRTSPlayerLayerInterface;
use org::allbinary::game::layer::RTSGameStrings;
use org::allbinary::game::layer::RTSLayer;
use org::allbinary::game::layer::RTSPlayerLayerInterface;
use org::allbinary::game::layer::capital::Capital;
use org::allbinary::game::layer::unit::UnitLayer;
use org::allbinary::game::layer::waypoint::WorkWaypoint;
use org::allbinary::media::audio::BuildingSound;
use org::allbinary::logic::java::bool::BooleanFactory;
use org::allbinary::game::identification::Group;
use org::allbinary::game::layer::AllBinaryGameLayerManager;
use org::allbinary::game::layer::GeographicMapCellPositionAreaBase;
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
use org::allbinary::media::graphics::geography::map::GeographicMapCompositeInterface;
use org::allbinary::game::input::form::RTSFormInput;
use org::allbinary::game::input::form::AssignWaypointsUtil;
use org::allbinary::game::input::form::PlayersSingletonFactory;

1;

