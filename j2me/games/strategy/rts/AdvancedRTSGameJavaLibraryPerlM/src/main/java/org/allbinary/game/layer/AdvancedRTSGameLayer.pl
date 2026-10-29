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

package org::allbinary::game::layer::AdvancedRTSGameLayer;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::layer::RTSLayer','org::allbinary::game::combat::destroy::event::DestroyedEventListenerInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{shakeListener} = undef;
    $self->{vibration} = undef;
    $self->{duration} = undef;
    $self->{parentLayer} = $org::allbinary::game::layer::NullPathFindingLayer::NULL_PATH_FINDING_LAYER;
    $self->{waypointBehaviorBase} = 'org::allbinary::game::tick::NullTickable'->getInstance();
}


# throws Exception
sub createSimulated {
    my ($class) = @_;
        my $nullAnimationInterfaceFactoryInterface = 'org::allbinary::animation::NullAnimationFactory'->getFactoryInstance();
        my $nullIndexedAnimationInterfaceFactoryInterface = 'org::allbinary::animation::NullIndexedAnimationFactory'->getFactoryInstance();
        return 'org::allbinary::game::layer::AdvancedRTSGameLayer'->new($org::allbinary::game::multiplayer::layer::RemoteInfo::REMOTE_INFO, $org::allbinary::game::layer::NullPathFindingLayer::NULL_PATH_FINDING_LAYER, 'org::allbinary::game::layer::AdvancedRTSProperties'->createPropertiesSimulated(), 'org::allbinary::game::identification::GroupFactory'->getInstance()->{NULL_GROUP_ARRAY}, 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, $org::allbinary::game::health::Health::NULL_HEALTH, 'org::allbinary::game::input::form::NullRTSFormInputFactory'->getInstance(), $nullAnimationInterfaceFactoryInterface, $nullIndexedAnimationInterfaceFactoryInterface, $nullAnimationInterfaceFactoryInterface, $nullAnimationInterfaceFactoryInterface, $nullIndexedAnimationInterfaceFactoryInterface, 'org::allbinary::animation::NullIndexedAnimationFactory'->getFactoryInstance(), $org::allbinary::graphics::RectangleFactory::SINGLETON, 0, 0, 'org::allbinary::game::view::TileLayerPositionIntoViewPosition'->new());
}


sub new {
    my ($class, $remoteInfo, $parentLayer, $advancedRTSProperties, $groupInterface, $rootName, $name, $healthInterface, $rtsFormInput, $animationInterfaceFactoryInterface, $emptyAnimationInterfaceFactoryInterface, $baseAnimationInterfaceFactoryInterface, $buildAnimationInterfaceFactoryInterface, $verticleBuildAnimationInterfaceFactoryInterface, $proceduralAnimationInterfaceFactoryInterface, $rectangle, $x, $y, $viewPosition) = @_;
    my $self = $class->SUPER::new($remoteInfo, $groupInterface, $rootName, $name, $healthInterface, $rtsFormInput, $animationInterfaceFactoryInterface, $emptyAnimationInterfaceFactoryInterface, $baseAnimationInterfaceFactoryInterface, $buildAnimationInterfaceFactoryInterface, $verticleBuildAnimationInterfaceFactoryInterface, $proceduralAnimationInterfaceFactoryInterface, $rectangle, $x, $y, $viewPosition);
    $self->_init_fields();
        # super(...) made $self above
        $self->setVisible(0);
        $self->setWaypointBehavior('org::allbinary::game::layer::WaypointBehaviorBase'->new());
        $self->{shakeListener} = $advancedRTSProperties->{shakeListener};
        $self->{vibration} = $advancedRTSProperties->{vibration};
        $self->{duration} = $advancedRTSProperties->{duration};
        $self->setParentLayer($parentLayer);
    return $self;
}


# throws Exception
sub updateWaypointBehavior {
    my ($self, $geographicMapInterface) = @_;
        $self->SUPER::updateWaypointBehavior($geographicMapInterface);
        $self->getWaypointBehavior()->getWaypoint()->setAllBinaryGameLayerManager($self->{allBinaryGameLayerManagerP});
}


sub initVisibility {
    my ($self, $rtsPlayerLayerInterface) = @_;
        my $advancedRTSPlayerLayerInterface = $rtsPlayerLayerInterface;
        if ($advancedRTSPlayerLayerInterface->isLocalPlayer() || $advancedRTSPlayerLayerInterface->getGameType() == 'org::allbinary::game::GameTypeFactory'->getInstance()->{BOT}) {
            $self->setVisible(1);
        } else {
            $self->setVisible(0);
        }
}


# throws Exception
sub construct {
    my ($self, $rtsPlayerLayerInterface) = @_;
        $self->SUPER::construct($rtsPlayerLayerInterface);
        $self->initVisibility($rtsPlayerLayerInterface);
        'org::allbinary::game::layer::building::event::BuildingEventHandler'->getInstance()->addListenerInterface($self->getWaypointBehavior()->getWaypoint());
}


# throws Exception
sub setDestroyed {
    my ($self, $destroyed) = @_;
        $self->SUPER::setDestroyed($destroyed);
        if ($self->isDestroyed()) {
            'org::allbinary::game::layer::building::event::BuildingEventHandler'->getInstance()->removeListener($self->getWaypointBehavior()->getWaypoint());
            'org::allbinary::game::layer::building::event::BuildingEventHandler'->getInstance()->removeListener($self);
            'org::allbinary::game::combat::destroy::event::DestroyedEventHandler'->getInstance()->addListener($self);
            'org::allbinary::game::layer::RTSLayerUtil'->getInstance()->destroyAndClear($self->getWaypointBehavior()->getOwnedWaypointList());
        }
}


sub getParentLayer {
    my ($self) = @_;
        return $self->{parentLayer};
}


sub setParentLayer {
    my ($self, $parentLayer) = @_;
        $self->{parentLayer} = $parentLayer;
}


sub getWaypointBehavior {
    my ($self) = @_;
        return $self->{waypointBehaviorBase};
}


sub setWaypointBehavior {
    my ($self, $unitWaypointHelper) = @_;
        $self->{waypointBehaviorBase} = $unitWaypointHelper;
}


sub getWaypointLogHelper {
    my ($self) = @_;
        return $self->{waypointLogHelperP};
}


sub getWaypoint2LogHelper {
    my ($self) = @_;
        return $self->{waypoint2LogHelperP};
}


sub getWaypointRunnableLogHelper {
    my ($self) = @_;
        return $self->{waypointRunnableLogHelperP};
}


sub shouldAddWaypointFromBuilding {
    my ($self) = @_;
        if ($self->{parentLayer} != $org::allbinary::game::layer::NullPathFindingLayer::NULL_PATH_FINDING_LAYER) {
            my $parentAdvancedRTSGameLayer = $self->{parentLayer};
            if ($parentAdvancedRTSGameLayer->getType() != 'org::allbinary::game::layer::unit::UnitLayer'->getStaticType()) {
                return 1;
            }
        }
        return 0;
}


sub isWaypointListEmptyOrOnlyTargets {
    my ($self) = @_;
        if ($self->getType() != 'org::allbinary::game::layer::unit::UnitLayer'->getStaticType()) {
            return 1;
        }
        return 0;
}


# throws Exception
sub buildingChase {
    my ($self, $allbinaryLayer, $cellPosition) = @_;
        my $geographicMapCellPosition = $self->getCurrentGeographicMapCellPosition();
        my $buildingDirection = 'org::allbinary::media::graphics::geography::map::GeographicMapDirectionUtil'->getInstance()->getDirectionFromCellPositionToAdjacentCellPosition($geographicMapCellPosition, $cellPosition);
        my $angleInfo = $self->getRotationAnimationInterface()->getAngleInfoP();
        my $angle = 'org::allbinary::math::FrameUtil'->getInstance()->adjustAngleToFrameAngle($angleInfo->getAngle() + 90);
        my $gameKeyEventFactory = 'org::allbinary::game::input::event::GameKeyEventFactory'->getInstance();
        if ($buildingDirection == 'org::allbinary::direction::DirectionFactory'->getInstance()->{UP}) {
            $self->{rtsLayer2LogHelper}->buildingAbove($self);
            if ($angle > 180 && $angle < 360) {
                $self->{rtsLayer2LogHelper}->buildingChaseLeft($self, $angle);
                $self->getGameKeyEventList()->add($gameKeyEventFactory->getInstanceForKey($self, $javax::microedition::lcdui::Canvas::LEFT));
                if ($angle <= 190) {
                    return 1;
                }
            } else {
                $self->{rtsLayer2LogHelper}->buildingChaseRight($self, $angle);
                $self->getGameKeyEventList()->add($gameKeyEventFactory->getInstanceForKey($self, $javax::microedition::lcdui::Canvas::RIGHT));
                if ($angle >= 170) {
                    return 1;
                }
            }
        } elsif ($buildingDirection == 'org::allbinary::direction::DirectionFactory'->getInstance()->{DOWN}) {
            $self->{rtsLayer2LogHelper}->buildingDown($self);
            if ($angle > 180 && $angle < 360) {
                $self->{rtsLayer2LogHelper}->buildingChaseLeft($self, $angle);
                $self->getGameKeyEventList()->add($gameKeyEventFactory->getInstanceForKey($self, $javax::microedition::lcdui::Canvas::RIGHT));
                if ($angle > 315) {
                    return 1;
                }
            } else {
                $self->{rtsLayer2LogHelper}->buildingChaseRight($self, $angle);
                $self->getGameKeyEventList()->add($gameKeyEventFactory->getInstanceForKey($self, $javax::microedition::lcdui::Canvas::LEFT));
                if ($angle < 45) {
                    return 1;
                }
            }
        } elsif ($buildingDirection == 'org::allbinary::direction::DirectionFactory'->getInstance()->{LEFT}) {
            $self->{rtsLayer2LogHelper}->buildingLeft();
            if ($angle > 90 && $angle < 270) {
                $self->{rtsLayer2LogHelper}->buildingChaseDown($self, $angle);
                $self->getGameKeyEventList()->add($gameKeyEventFactory->getInstanceForKey($self, $javax::microedition::lcdui::Canvas::LEFT));
                if ($angle < 135) {
                    return 1;
                }
            } else {
                $self->{rtsLayer2LogHelper}->buildingChaseUp($self, $angle);
                $self->getGameKeyEventList()->add($gameKeyEventFactory->getInstanceForKey($self, $javax::microedition::lcdui::Canvas::RIGHT));
                if ($angle > 45) {
                    return 1;
                }
            }
        } elsif ($buildingDirection == 'org::allbinary::direction::DirectionFactory'->getInstance()->{RIGHT}) {
            $self->{rtsLayer2LogHelper}->buildingRight();
            if ($angle > 90 && $angle < 270) {
                $self->{rtsLayer2LogHelper}->buildingChaseDown($self, $angle);
                $self->getGameKeyEventList()->add($gameKeyEventFactory->getInstanceForKey($self, $javax::microedition::lcdui::Canvas::RIGHT));
                if ($angle > 225) {
                    return 1;
                }
            } else {
                $self->{rtsLayer2LogHelper}->buildingChaseUp($self, $angle);
                $self->getGameKeyEventList()->add($gameKeyEventFactory->getInstanceForKey($self, $javax::microedition::lcdui::Canvas::LEFT));
                if ($angle < 315 && $angle > 180) {
                    return 1;
                }
            }
        } else {
            return 1;
        }
        return 0;
}


# throws Exception
sub getSurroundingGeographicMapCellPositionList {
    my ($self) = @_;
        my $geographicMapCompositeInterface = $self->{allBinaryGameLayerManagerP};
        my $geographicMapInterface = $geographicMapCompositeInterface->getGeographicMapInterface()->[0];
        $self->{geographicMapCellPositionAreaBase}->update($geographicMapInterface);
        return $self->{geographicMapCellPositionAreaBase}->getSurroundingGeographicMapCellPositionList();
}


sub setSelected {
    my ($self, $selected) = @_;
        $self->SUPER::setSelected($selected);
        if ($self->{debug}) {
            if ($selected) {
                $self->{waypointLogHelperP} = 'org::allbinary::game::layer::waypoint::WaypointSelectedLogHelper'->getInstance();
                $self->{waypoint2LogHelperP} = 'org::allbinary::game::layer::waypoint::Waypoint2SelectedLogHelper'->getInstance();
                $self->{waypointRunnableLogHelperP} = 'org::allbinary::game::layer::waypoint::WaypointRunnableSelectedLogHelper'->getInstance();
            } else {
                $self->{waypointLogHelperP} = 'org::allbinary::game::layer::waypoint::WaypointLogHelper'->getInstance();
                $self->{waypoint2LogHelperP} = 'org::allbinary::game::layer::waypoint::Waypoint2LogHelper'->getInstance();
                $self->{waypointRunnableLogHelperP} = 'org::allbinary::game::layer::waypoint::WaypointRunnableLogHelper'->getInstance();
            }
        }
}


sub onDestroyed {
    my ($self, $destroyedEvent) = @_;
        try {
            my $layerInterface = $destroyedEvent->getLayerInterface();
            if ($layerInterface == $self) {
                'org::allbinary::game::combat::destroy::event::DestroyedEventHandler'->getInstance()->removeListener($self);
                my $waypoint = $self->getWaypointBehavior()->getWaypoint();
                $waypoint->reset();
            }
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "onDestroyed", $e);
        }
}

# use javax::microedition::lcdui::Canvas;
use org::allbinary::animation::AnimationInterfaceFactoryInterface;
use org::allbinary::animation::NullAnimationFactory;
use org::allbinary::animation::NullIndexedAnimationFactory;
use org::allbinary::animation::ProceduralAnimationInterfaceFactoryInterface;
use org::allbinary::animation::transition::shake::ShakeAnimationListener;
use org::allbinary::direction::Direction;
use org::allbinary::direction::DirectionFactory;
use org::allbinary::game::GameTypeFactory;
use org::allbinary::game::combat::destroy::event::DestroyedEvent;
use org::allbinary::game::combat::destroy::event::DestroyedEventHandler;
use org::allbinary::game::combat::destroy::event::DestroyedEventListenerInterface;
use org::allbinary::game::health::Health;
use org::allbinary::game::identification::Group;
use org::allbinary::game::identification::GroupFactory;
use org::allbinary::game::input::event::GameKeyEventFactory;
use org::allbinary::game::input::form::NullRTSFormInputFactory;
use org::allbinary::game::input::form::RTSFormInput;
use org::allbinary::game::layer::building::event::BuildingEventHandler;
use org::allbinary::game::layer::unit::UnitLayer;
use org::allbinary::game::layer::waypoint::Waypoint2LogHelper;
use org::allbinary::game::layer::waypoint::Waypoint2SelectedLogHelper;
use org::allbinary::game::layer::waypoint::WaypointBase;
use org::allbinary::game::layer::waypoint::WaypointLogHelper;
use org::allbinary::game::layer::waypoint::WaypointRunnableLogHelper;
use org::allbinary::game::layer::waypoint::WaypointRunnableSelectedLogHelper;
use org::allbinary::game::layer::waypoint::WaypointSelectedLogHelper;
use org::allbinary::game::multiplayer::layer::RemoteInfo;
use org::allbinary::game::tick::NullTickable;
use org::allbinary::game::tick::TickableInterface;
use org::allbinary::game::view::TileLayerPositionIntoViewPosition;
use org::allbinary::graphics::Rectangle;
use org::allbinary::graphics::RectangleFactory;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::math::AngleInfo;
use org::allbinary::math::FrameUtil;
use org::allbinary::media::AllBinaryVibrationME;
use org::allbinary::media::graphics::geography::map::BasicGeographicMap;
use org::allbinary::media::graphics::geography::map::GeographicMapCellPosition;
use org::allbinary::media::graphics::geography::map::GeographicMapCompositeInterface;
use org::allbinary::media::graphics::geography::map::GeographicMapDirectionUtil;
use org::allbinary::util::BasicArrayList;
use org::allbinary::view::ViewPositionBase;
use org::allbinary::game::layer::RTSLayer;
use org::allbinary::game::layer::NullPathFindingLayer;
use org::allbinary::game::layer::AdvancedRTSProperties;
use org::allbinary::game::layer::WaypointBehaviorBase;
use org::allbinary::game::layer::RTSLayerUtil;

1;

