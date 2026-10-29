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

package org::allbinary::game::input::form::BuildingRTSFormInput;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::input::form::RTSFormInput';


sub _init_fields {
    my ($self) = @_;
    $self->{isUnitProducer} = undef;
    $self->{buildOnPathGameNotificationEvent} = undef;
    $self->{spotTakenGameNotificationEvent} = undef;
    $self->{selectBuildSpotGameNotificationEvent} = undef;
    $self->{roadCollisionGameNotificationEvent} = undef;
    $self->{noMoneyGameNotificationEvent} = undef;
    $self->{buildingCollisionGameNotificationEvent} = undef;
    $self->{structureToCloseCollisionGameNotificationEvent} = undef;
    $self->{buildingGameNotificationEvent} = undef;
    $self->{mapEdgeGameNotificationEvent} = undef;
    $self->{dropCellPositionHistory} = 'org::allbinary::media::graphics::geography::map::drop::DropCellPositionHistory'->getInstance();
}


sub new {
    my ($class, $groupInterface, $isUnitProducer) = @_;
    my $self = $class->SUPER::new($groupInterface);
    $self->_init_fields();
        # super(...) made $self above
        $self->{isUnitProducer} = $isUnitProducer;
        my $smallIntegerSingletonFactory = 'org::allbinary::logic::math::SmallIntegerSingletonFactory'->getInstance();
        my $basicColorFactory = 'org::allbinary::graphics::color::BasicColorFactory'->getInstance();
        $self->{buildOnPathGameNotificationEvent} = 'org::allbinary::game::layer::hud::event::GameNotificationEvent'->new($self, 'org::allbinary::game::layer::RTSGameStrings'->getInstance()->{BUILD_ON_PATH}, $smallIntegerSingletonFactory->getAt(2), $basicColorFactory->{PINK}, 'org::allbinary::logic::java::bool::BooleanFactory'->getInstance()->{FALSE});
        $self->{spotTakenGameNotificationEvent} = 'org::allbinary::game::layer::hud::event::GameNotificationEvent'->new($self, 'org::allbinary::game::layer::RTSGameStrings'->getInstance()->{SPOT_TAKEN}, $smallIntegerSingletonFactory->getAt(2), $basicColorFactory->{PINK}, 'org::allbinary::logic::java::bool::BooleanFactory'->getInstance()->{FALSE});
        $self->{selectBuildSpotGameNotificationEvent} = 'org::allbinary::game::layer::hud::event::GameNotificationEvent'->new($self, 'org::allbinary::game::layer::RTSGameStrings'->getInstance()->{SELECT_BUILD_SPOT}, $smallIntegerSingletonFactory->getAt(2), $basicColorFactory->{PINK}, 'org::allbinary::logic::java::bool::BooleanFactory'->getInstance()->{FALSE});
        $self->{roadCollisionGameNotificationEvent} = 'org::allbinary::game::layer::hud::event::GameNotificationEvent'->new($self, 'org::allbinary::game::layer::RTSGameStrings'->getInstance()->{ROAD_COLLISION}, $smallIntegerSingletonFactory->getAt(2), $basicColorFactory->{PINK}, 'org::allbinary::logic::java::bool::BooleanFactory'->getInstance()->{FALSE});
        $self->{noMoneyGameNotificationEvent} = 'org::allbinary::game::layer::hud::event::GameNotificationEvent'->new($self, 'org::allbinary::game::layer::RTSGameStrings'->getInstance()->{NO_MONEY}, $smallIntegerSingletonFactory->getAt(2), $basicColorFactory->{PINK}, 'org::allbinary::logic::java::bool::BooleanFactory'->getInstance()->{FALSE});
        $self->{buildingCollisionGameNotificationEvent} = 'org::allbinary::game::layer::hud::event::GameNotificationEvent'->new($self, 'org::allbinary::game::layer::RTSGameStrings'->getInstance()->{BUILDING_COLLISION}, $smallIntegerSingletonFactory->getAt(2), $basicColorFactory->{PINK}, 'org::allbinary::logic::java::bool::BooleanFactory'->getInstance()->{FALSE});
        $self->{structureToCloseCollisionGameNotificationEvent} = 'org::allbinary::game::layer::hud::event::GameNotificationEvent'->new($self, 'org::allbinary::game::layer::RTSGameStrings'->getInstance()->{STRUCTURE_TO_CLOSE}, $smallIntegerSingletonFactory->getAt(2), $basicColorFactory->{PINK}, 'org::allbinary::logic::java::bool::BooleanFactory'->getInstance()->{FALSE});
        $self->{buildingGameNotificationEvent} = 'org::allbinary::game::layer::hud::event::GameNotificationEvent'->new($self, 'org::allbinary::game::layer::RTSGameStrings'->getInstance()->{BUILDING}, $smallIntegerSingletonFactory->getAt(2), $basicColorFactory->{PINK}, 'org::allbinary::logic::java::bool::BooleanFactory'->getInstance()->{FALSE});
        $self->{mapEdgeGameNotificationEvent} = 'org::allbinary::game::layer::hud::event::GameNotificationEvent'->new($self, 'org::allbinary::game::layer::RTSGameStrings'->getInstance()->{MAP_EDGE}, $smallIntegerSingletonFactory->getAt(2), $basicColorFactory->{PINK}, 'org::allbinary::logic::java::bool::BooleanFactory'->getInstance()->{FALSE});
    return $self;
}


# throws Exception
sub setAllBinaryGameLayerManager {
    my ($self, $allBinaryGameLayerManager) = @_;
        $self->SUPER::setAllBinaryGameLayerManager($allBinaryGameLayerManager);
        my $geographicMapCompositeInterface = $allBinaryGameLayerManager;
        my $geographicMapInterface = $geographicMapCompositeInterface->getGeographicMapInterface()->[0];
        $self->{buildOnPathGameNotificationEvent}->setBasicColorP($geographicMapInterface->getForegroundBasicColor());
        $self->{spotTakenGameNotificationEvent}->setBasicColorP($geographicMapInterface->getForegroundBasicColor());
        $self->{selectBuildSpotGameNotificationEvent}->setBasicColorP($geographicMapInterface->getForegroundBasicColor());
        $self->{roadCollisionGameNotificationEvent}->setBasicColorP($geographicMapInterface->getForegroundBasicColor());
        $self->{noMoneyGameNotificationEvent}->setBasicColorP($geographicMapInterface->getForegroundBasicColor());
        $self->{buildingCollisionGameNotificationEvent}->setBasicColorP($geographicMapInterface->getForegroundBasicColor());
        $self->{structureToCloseCollisionGameNotificationEvent}->setBasicColorP($geographicMapInterface->getForegroundBasicColor());
        $self->{buildingGameNotificationEvent}->setBasicColorP($geographicMapInterface->getForegroundBasicColor());
        $self->{mapEdgeGameNotificationEvent}->setBasicColorP($geographicMapInterface->getForegroundBasicColor());
}


# throws Exception
sub processGameSpecific {
    my ($self, $associatedRtsLayer, $rtsPlayerLayerInterface, $layerManager, $item, $itemIndex) = @_;
        $self->SUPER::process($layerManager);
        $self->buildFromMotionInput($rtsPlayerLayerInterface, $layerManager, $item, $itemIndex);
}


sub isPositionBlocked {
    my ($self) = @_;
        return $self->{dropCellPositionHistory}->isCellPositionWithDrop($self->getSelectedGeographicCellPosition());
}


sub isDemoLocked {
    my ($self, $item) = @_;
        my $factoryItem = $item;
        my $layerInterfaceFactoryInterface = $factoryItem->getLayerInterfaceFactoryInterface();
        if ('org::allbinary::logic::system::security::licensing::LockedUtil'->getInstance()->isLocked() && $layerInterfaceFactoryInterface->isDemoLocked()) {
            return 1;
        } else {
            return 0;
        }
}


# throws Exception
sub buildFromMotionInput {
    my ($self, $rtsPlayerLayerInterface, $layerManager, $item, $itemIndex) = @_;
        my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
        $self->{logUtil}->putF($commonStrings->{START}, $self, "buildFromMotionInput");
        if (!defined($layerManager)) {
            die ("RuntimeException");
        }
        my $geographicMapCompositeInterface = $layerManager;
        my $geographicMapInterface = $geographicMapCompositeInterface->getGeographicMapInterface()->[0];
        if ($self->isDemoLocked($item)) {
            $rtsPlayerLayerInterface->add('org::allbinary::media::audio::ErrorSound'->getInstance());
            'org::allbinary::logic::system::security::licensing::LockedFeatureNotificationUtil'->getInstance()->fireWithColor($geographicMapInterface->getForegroundBasicColor());
            return;
        }
        my $geographicMapCellPosition = $self->getSelectedGeographicCellPosition();
        if ($geographicMapCellPosition != $org::allbinary::media::graphics::geography::map::SimpleGeographicMapCellPositionFactory::NULL_GEOGRAPHIC_MAP_CELL_POSITION) {
            if (!$self->isPositionBlocked()) {
                my $geographicMapCellType = $geographicMapInterface->getCellTypeAt($geographicMapCellPosition);
                my $raceTrackGeographicMapCellTypeFactory = $geographicMapInterface->getGeographicMapCellTypeFactory();
                if (!$raceTrackGeographicMapCellTypeFactory->isPath($geographicMapCellType)) {
                    if ($self->{newUnconstructedRTSLayerInterfaceArray}->[$itemIndex] == 'org::allbinary::game::layer::special::CollidableDestroyableDamageableLayer'->getNullInstance()) {
                        $self->{newUnconstructedRTSLayerInterfaceArray}->[$itemIndex] = $self->getInstance($layerManager, $item, $geographicMapCellPosition);
                    } else {
                        my $rtsLayer = $self->{newUnconstructedRTSLayerInterfaceArray}->[$itemIndex];
                        my $cellPoint = $geographicMapCellPosition->getPoint();
                        $rtsLayer->setPosition($cellPoint->getX(), $cellPoint->getY(), $cellPoint->getZ());
                        $rtsLayer->{geographicMapCellPositionAreaBase}->update($geographicMapInterface);
                    }
                    my $rtsLayer = $self->{newUnconstructedRTSLayerInterfaceArray}->[$itemIndex];
                    $self->attemptBuild($rtsPlayerLayerInterface, $layerManager, $rtsLayer, $itemIndex);
                } else {
                    $rtsPlayerLayerInterface->add('org::allbinary::media::audio::ErrorSound'->getInstance());
                    if (!$rtsPlayerLayerInterface->implmentsArtificialIntelligenceCompositeInterface()) {
                        'org::allbinary::game::layer::hud::event::GameNotificationEventHandler'->getInstance()->fireEvent($self->{buildOnPathGameNotificationEvent});
                    }
                }
            } else {
                $rtsPlayerLayerInterface->add('org::allbinary::media::audio::ErrorSound'->getInstance());
                if (!$rtsPlayerLayerInterface->implmentsArtificialIntelligenceCompositeInterface()) {
                    'org::allbinary::game::layer::hud::event::GameNotificationEventHandler'->getInstance()->fireEvent($self->{spotTakenGameNotificationEvent});
                }
            }
        } else {
            $rtsPlayerLayerInterface->add('org::allbinary::media::audio::ErrorSound'->getInstance());
            if (!$rtsPlayerLayerInterface->implmentsArtificialIntelligenceCompositeInterface()) {
                'org::allbinary::game::layer::hud::event::GameNotificationEventHandler'->getInstance()->fireEvent($self->{selectBuildSpotGameNotificationEvent});
            }
        }
}


# throws Exception
sub attemptBuild {
    my ($self, $rtsPlayerLayerInterface, $layerManager, $layerInterface, $itemIndex) = @_;
        $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append("Layer: ")->append('org::allbinary::logic::string::StringUtil'->getInstance()->toString($layerInterface))->toString(), $self, "attemptBuild");
        my $geographicMapCellPositionArea = $layerInterface->{geographicMapCellPositionAreaBase};
        my $occupyList = $geographicMapCellPositionArea->getOccupyingGeographicMapCellPositionList();
        if (!$self->isBuildAttemptValid($rtsPlayerLayerInterface, $layerInterface)) {
            return 0;
        }
        my $geographicMapCellType = undef;
        for (my $index = $occupyList->size() - 1; $index >= 0; $index--) {
            my $geographicMapCompositeInterface = $layerManager;
            my $geographicMapInterface = $geographicMapCompositeInterface->getGeographicMapInterface()->[0];
            $geographicMapCellType = $geographicMapInterface->getCellTypeAt($occupyList->get($index));
            my $raceTrackGeographicMapCellTypeFactory = $geographicMapInterface->getGeographicMapCellTypeFactory();
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
            $self->add($rtsPlayerLayerInterface, $layerManager, $layerInterface);
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
sub isBuildAttemptValid {
    my ($self, $rtsPlayerLayerInterface, $layerInterface) = @_;
        my $geographicMapCellPositionArea = $layerInterface->{geographicMapCellPositionAreaBase};
        my $occupyList = $geographicMapCellPositionArea->getOccupyingGeographicMapCellPositionList();
        if ($self->{dropCellPositionHistory}->anyCellPositionWithDrop($occupyList)) {
            $rtsPlayerLayerInterface->add('org::allbinary::media::audio::ErrorSound'->getInstance());
            if (!$rtsPlayerLayerInterface->implmentsArtificialIntelligenceCompositeInterface()) {
                'org::allbinary::game::layer::hud::event::GameNotificationEventHandler'->getInstance()->fireEvent($self->{buildingCollisionGameNotificationEvent});
            }
            return 0;
        }
        if ($self->{isUnitProducer} && $self->{dropCellPositionHistory}->anyCellPositionWithDrop($geographicMapCellPositionArea->getSurroundingGeographicMapCellPositionList())) {
            $rtsPlayerLayerInterface->add('org::allbinary::media::audio::ErrorSound'->getInstance());
            if (!$rtsPlayerLayerInterface->implmentsArtificialIntelligenceCompositeInterface()) {
                'org::allbinary::game::layer::hud::event::GameNotificationEventHandler'->getInstance()->fireEvent($self->{structureToCloseCollisionGameNotificationEvent});
            }
            return 0;
        } else {
            if ($self->isSurroundingCellsOffMap($layerInterface)) {
                $rtsPlayerLayerInterface->add('org::allbinary::media::audio::ErrorSound'->getInstance());
                if (!$rtsPlayerLayerInterface->implmentsArtificialIntelligenceCompositeInterface()) {
                    'org::allbinary::game::layer::hud::event::GameNotificationEventHandler'->getInstance()->fireEvent($self->{mapEdgeGameNotificationEvent});
                }
                return 0;
            }
        }
        return 1;
}


# throws Exception
sub add {
    my ($self, $rtsPlayerLayerInterface, $layerManager, $layerInterface) = @_;
        my $geographicMapCellPositionArea = $layerInterface->{geographicMapCellPositionAreaBase};
        my $occupyList = $geographicMapCellPositionArea->getOccupyingGeographicMapCellPositionList();
        $self->{dropCellPositionHistory}->addAll($occupyList, $layerInterface);
        my $rtsPlayerGameInput = $rtsPlayerLayerInterface->getPlayerGameInput();
        $rtsPlayerGameInput->setSelectedRTSLayer($layerInterface, $self->getSelectedGeographicCellPosition());
        $layerManager->append($layerInterface);
        $rtsPlayerLayerInterface->add('org::allbinary::media::audio::BuildingSound'->getInstance());
        if (!$rtsPlayerLayerInterface->implmentsArtificialIntelligenceCompositeInterface()) {
            'org::allbinary::game::layer::hud::event::GameNotificationEventHandler'->getInstance()->fireEvent($self->{buildingGameNotificationEvent});
        }
}


sub isSurroundingCellsOffMap {
    my ($self, $layerInterface) = @_;
        my $geographicMapCellPositionArea = $layerInterface->{geographicMapCellPositionAreaBase};
        my $occupyList = $geographicMapCellPositionArea->getOccupyingGeographicMapCellPositionList();
        my $surroundList = $geographicMapCellPositionArea->getSurroundingGeographicMapCellPositionList();
        my $occupySize = $occupyList->size();
        my $surroundSize = $surroundList->size();
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append("occupySize: ");
        $stringBuffer->appendint($occupySize);
        $stringBuffer->append(" surroundSize: ");
        $stringBuffer->appendint($surroundSize);
        $stringBuffer->append(" surroundList: ");
        $stringBuffer->append('org::allbinary::logic::string::StringUtil'->getInstance()->toString($surroundList));
        $self->{logUtil}->putF($stringBuffer->toString(), $self, "isSurroundingCellsOffMap");
        my $isSurroundOffMap = 0;
        if ($occupySize == 1 && $surroundSize != 8) {
            $isSurroundOffMap = 1;
        } elsif ($occupySize == 4 && $surroundSize != 12) {
            $isSurroundOffMap = 1;
        }
        if ($occupySize == 0 || $isSurroundOffMap) {
            return 1;
        } else {
            return 0;
        }
}

use org::allbinary::game::input::RTSPlayerGameInput;
use org::allbinary::game::layer::DemoLockedWithCostLayerInterfaceFactoryInterface;
use org::allbinary::game::layer::GeographicMapCellPositionAreaBase;
use org::allbinary::game::layer::RTSGameStrings;
use org::allbinary::game::layer::RTSLayer;
use org::allbinary::game::layer::RTSPlayerLayerInterface;
use org::allbinary::game::layer::capital::Capital;
use org::allbinary::game::layer::item::LayerInterfaceFactoryImageItem;
use org::allbinary::graphics::form::item::ABCustomItem;
use org::allbinary::media::audio::BuildingSound;
use org::allbinary::util::BasicArrayList;
use org::allbinary::string::CommonStrings;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::java::bool::BooleanFactory;
use org::allbinary::logic::system::security::licensing::LockedFeatureNotificationUtil;
use org::allbinary::logic::system::security::licensing::LockedUtil;
use org::allbinary::game::identification::Group;
use org::allbinary::game::layer::AllBinaryGameLayerManager;
use org::allbinary::game::layer::hud::event::GameNotificationEvent;
use org::allbinary::game::layer::hud::event::GameNotificationEventHandler;
use org::allbinary::game::layer::special::CollidableDestroyableDamageableLayer;
use org::allbinary::graphics::GPoint;
use org::allbinary::graphics::color::BasicColorFactory;
use org::allbinary::layer::AllBinaryLayerManager;
use org::allbinary::logic::math::SmallIntegerSingletonFactory;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::media::audio::ErrorSound;
use org::allbinary::media::graphics::geography::map::BasicGeographicMap;
use org::allbinary::media::graphics::geography::map::GeographicMapCellPosition;
use org::allbinary::media::graphics::geography::map::GeographicMapCellType;
use org::allbinary::media::graphics::geography::map::GeographicMapCompositeInterface;
use org::allbinary::media::graphics::geography::map::SimpleGeographicMapCellPositionFactory;
use org::allbinary::media::graphics::geography::map::drop::DropCellPositionHistory;
use org::allbinary::media::graphics::geography::map::racetrack::RaceTrackGeographicMapCellTypeFactory;
use org::allbinary::game::input::form::RTSFormInput;

1;

