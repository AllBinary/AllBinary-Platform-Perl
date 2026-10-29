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

package org::allbinary::game::input::HumanRTSPlayerGameInput;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::input::RTSPlayerGameInput','org::allbinary::input::motion::gesture::observer::BaseMotionGestureEventListener';


sub _init_fields {
    my ($self) = @_;
    $self->{isDragging} = 0;
    $self->{gameStateFactory} = 'org::allbinary::game::state::GameStateFactory'->getInstance();
    $self->{rectangleCollisionUtil} = 'org::allbinary::math::RectangleCollisionUtil'->getInstance();
    $self->{touchMotionGestureFactory} = 'org::allbinary::input::motion::gesture::TouchMotionGestureFactory'->getInstance();
    $self->{PRESSED} = $self->{touchMotionGestureFactory}->{PRESSED};
    $self->{RELEASED} = $self->{touchMotionGestureFactory}->{RELEASED};
    $self->{touchButtonsBuilderFactory} = undef;
    $self->{notYoursGameNotificationEvent} = undef;
    $self->{selectedRtsLayer} = 'org::allbinary::game::layer::special::CollidableDestroyableDamageableLayer'->getNullInstance();
    $self->{startPoint} = 'org::allbinary::graphics::PointFactory'->getInstance()->{ZERO_ZERO};
    $self->{endPoint} = 'org::allbinary::graphics::PointFactory'->getInstance()->{ZERO_ZERO};
    $self->{POSSIBLE} = "Possible: ";
    $self->{AT} = "At: ";
    $self->{METHOD} = "makeSelection";
    $self->{ADDING} = "Adding: ";
    $self->{SPACE} = 'org::allbinary::string::CommonSeps'->getInstance()->{SPACE};
    $self->{multiSelectPaintable} = 'org::allbinary::game::layer::MultiSelectPaintable'->new();
}


sub new {
    my ($class, $gameCanvas, $inputList, $playerInputId, $towerInfoPaintable, $rtsPlayerLayerInterface, $layerPositionFinderInterface, $selectRTSLayerVisitorFactoryInterface, $touchButtonsBuilderFactory) = @_;
    my $self = $class->SUPER::new($gameCanvas, $inputList, $playerInputId, $towerInfoPaintable, $rtsPlayerLayerInterface, $layerPositionFinderInterface, $selectRTSLayerVisitorFactoryInterface);
    $self->_init_fields();
        # super(...) made $self above
        $self->{touchButtonsBuilderFactory} = $touchButtonsBuilderFactory;
        my $basicColorFactory = 'org::allbinary::graphics::color::BasicColorFactory'->getInstance();
        $self->{notYoursGameNotificationEvent} = 'org::allbinary::game::layer::hud::event::GameNotificationEvent'->new($self, 'org::allbinary::game::layer::RTSGameStrings'->getInstance()->{NOT_YOURS}, 'org::allbinary::logic::math::SmallIntegerSingletonFactory'->getInstance()->getAt(2), $basicColorFactory->{PINK}, 'org::allbinary::logic::java::bool::BooleanFactory'->getInstance()->{FALSE});
        'org::allbinary::input::motion::gesture::observer::BasicMotionGesturesHandler'->getInstance()->addListenerInterface($self);
    return $self;
}


# throws Exception
sub setAllBinaryGameLayerManager {
    my ($self, $allBinaryGameLayerManager) = @_;
        my $geographicMapCompositeInterface = $allBinaryGameLayerManager;
        my $geographicMapInterface = $geographicMapCompositeInterface->getGeographicMapInterface()->[0];
        $self->{notYoursGameNotificationEvent}->setBasicColorP($geographicMapInterface->getForegroundBasicColor());
}


# throws Exception
sub processDraggingMotionInput {
    my ($self, $layerManager) = @_;
        my $motionGestureEvent = $self->getMotionGestureInputList()->get($self->getMotionGestureInputList()->size() - 1);
        my $motionGestureInput = $motionGestureEvent->getMotionGesture();
        my $rtsFormInput = $self->getSelectedRtsFormInput();
        if ($motionGestureInput == $self->{PRESSED}) {
            my $point = $motionGestureEvent->getCurrentPoint();
            if ($self->getRtsPlayerLayerInterface()->getCurrentScrollSelectionForm()->isInForm($point)) {
                $self->{isDragging} = $rtsFormInput->processSticky($self->getSelectedRtsLayer(), $self->getRtsPlayerLayerInterface(), $layerManager, $point);
            }
        } elsif ($motionGestureInput == $self->{RELEASED}) {
            my $point = $motionGestureEvent->getCurrentPoint();
            if ($self->getRtsPlayerLayerInterface()->getCurrentScrollSelectionForm()->isInForm($point)) {
                $rtsFormInput->processAtPoint($self->getSelectedRtsLayer(), $self->getRtsPlayerLayerInterface(), $layerManager, $point);
            } elsif ($rtsFormInput->isStickyItemSelected()) {
                my $previousRtsFormInput = $rtsFormInput;
                $self->select($motionGestureEvent);
                $self->getSelectedBuildingPlayerGameInput()->selectAllPreselected();
                $previousRtsFormInput->processAtPoint($self->getSelectedRtsLayer(), $self->getRtsPlayerLayerInterface(), $layerManager, $point);
                $self->getSelectedBuildingPlayerGameInput()->deselectAllPreselected();
            } else {
                $self->select($motionGestureEvent);
            }
            $rtsFormInput->setStickyItemSelected(0);
            $rtsFormInput->setSelectedStickyItem('org::allbinary::graphics::form::item::ABCustomItem'->getNullInstance());
            $rtsFormInput->setSelectedStickyItemIndex(-1);
            return 1;
        }
        return 0;
}


sub makeSelection {
    my ($self) = @_;
        my $rtsLayerList = $self->getRtsPlayerLayerInterface()->getPlayerOwnedRTSLayers()->{rtsLayerList};
        my $rectX1 = $self->{startPoint}->getX();
        my $rectY1 = $self->{startPoint}->getY();
        my $rectX2 = $self->{endPoint}->getX();
        my $rectY2 = $self->{endPoint}->getY();
        if ($rectX1 > $rectX2) {
            $rectX2 = $rectX1;
            $rectX1 = $self->{endPoint}->getX();
        }
        if ($rectY1 > $rectY2) {
            $rectY2 = $rectY1;
            $rectY1 = $self->{endPoint}->getY();
        }
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($self->{AT});
        $stringBuffer->appendint($rectX1);
        $stringBuffer->append($self->{SPACE});
        $stringBuffer->appendint($rectY1);
        $stringBuffer->append($self->{SPACE});
        $stringBuffer->appendint($rectX2);
        $stringBuffer->append($self->{SPACE});
        $stringBuffer->appendint($rectY2);
        $self->{logUtil}->putF($stringBuffer->toString(), $self, $self->{METHOD});
        my $rtsLayer = undef;
        for (my $index = $rtsLayerList->size() - 1; $index >= 0; $index--) {
            $rtsLayer = $rtsLayerList->get($index);
            $stringBuffer->delete(0, $stringBuffer->length());
            my $viewPosition = $rtsLayer->getViewPosition();
            $stringBuffer->append($self->{POSSIBLE});
            $stringBuffer->append($rtsLayer->getName());
            $stringBuffer->append($self->{SPACE});
            $stringBuffer->append($self->{AT});
            $stringBuffer->appendint(int(($viewPosition->getX() + $rtsLayer->getHalfWidth())));
            $stringBuffer->append($self->{SPACE});
            $stringBuffer->appendint(int(($viewPosition->getY() + $rtsLayer->getHalfHeight())));
            $self->{logUtil}->putF($stringBuffer->toString(), $self, $self->{METHOD});
            if ($self->{rectangleCollisionUtil}->isInside($rectX1, $rectY1, $rectX2, $rectY2, $viewPosition->getX() + $rtsLayer->getHalfWidth(), $viewPosition->getY() + $rtsLayer->getHalfHeight())) {
                $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append($self->{ADDING})->append($rtsLayer->getName())->toString(), $self, $self->{METHOD});
                $rtsLayer->select();
                $self->getSelectedBuildingPlayerGameInput()->addSelectedRTSLayer($rtsLayer);
            }
        }
        my $gameLayer = $self->getSelectedBuildingPlayerGameInput()->getLastSelectedRtsLayer();
        if ($gameLayer != 'org::allbinary::game::layer::special::CollidableDestroyableDamageableLayer'->getNullInstance()) {
            my $lastRTSLayer = $gameLayer;
            if ($lastRTSLayer->getScrollSelectionForm() != 'org::allbinary::graphics::form::ScrollSelectionForm'->getNullScrollSelectionForm()) {
                $self->updateForm($lastRTSLayer->getScrollSelectionForm(), $lastRTSLayer->getRTSFormInput());
                $self->setSelectedRtsLayer($lastRTSLayer);
            }
        }
        $self->updatePaintable();
}


# throws Exception
sub processSelectionBoxMotionInput {
    my ($self, $layerManager) = @_;
        for (my $index = $self->getMotionGestureInputList()->size() - 1; $index >= 0; $index--) {
            my $motionGestureEvent = $self->getMotionGestureInputList()->get($index);
            my $motionGestureInput = $motionGestureEvent->getMotionGesture();
            my $point = $motionGestureEvent->getCurrentPoint();
            if ($motionGestureInput == $self->{touchMotionGestureFactory}->{PRESSED}) {
                $self->{startPoint} = $point;
                $self->{endPoint} = $point;
            } elsif ($motionGestureInput == $self->{touchMotionGestureFactory}->{RELEASED}) {
                $self->{endPoint} = $point;
                $self->makeSelection();
                $self->{startPoint} = 'org::allbinary::graphics::PointFactory'->getInstance()->{ZERO_ZERO};
                $self->{endPoint} = 'org::allbinary::graphics::PointFactory'->getInstance()->{ZERO_ZERO};
            } else {
                $self->{endPoint} = $point;
            }
        }
}


# throws Exception
sub processMotionInput {
    my ($self, $layerManager) = @_;
        if ($self->getMotionGestureInputList()->size() > 0) {
            my $endDrag = $self->processDraggingMotionInput($layerManager);
            if (!$self->{isDragging}) {
                $self->processSelectionBoxMotionInput($layerManager);
            }
            if ($endDrag) {
                $self->{isDragging} = 0;
            }
        }
        $self->getMotionGestureInputList()->clear();
}


sub setSelectedRtsFormInput {
    my ($self, $selectedRtsFormInput) = @_;
        my $logUtil = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
        $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append('org::allbinary::string::CommonLabels'->getInstance()->{START})->append('org::allbinary::logic::string::StringUtil'->getInstance()->toString($selectedRtsFormInput))->toString(), $self, "setSelectedRtsFormInput");
        $self->SUPER::setSelectedRtsFormInput($selectedRtsFormInput);
        $self->setSelectedRtsLayer('org::allbinary::game::layer::special::CollidableDestroyableDamageableLayer'->getNullInstance());
}


sub updateFormForLayer {
    my ($self, $rtsLayer) = @_;
        my $scrollSelectionForm = $rtsLayer->getScrollSelectionForm();
        if ($scrollSelectionForm != 'org::allbinary::graphics::form::ScrollSelectionForm'->getNullScrollSelectionForm() && $self->getRtsPlayerLayerInterface()->getGroupInterface()->[0] == $rtsLayer->getGroupInterface()->[0]) {
            $self->updateForm($scrollSelectionForm, $rtsLayer->getRTSFormInput());
            $self->getSelectedBuildingPlayerGameInput()->setSelectedRTSLayer('org::allbinary::game::layer::special::CollidableDestroyableDamageableLayer'->getNullInstance());
            $self->setSelectedRtsLayer($rtsLayer);
        } else {
            $self->getRtsPlayerLayerInterface()->setCurrentScrollSelectionForm($self->getRtsPlayerLayerInterface()->getBuildingScrollSelectionForm());
            $self->setSelectedRtsFormInput($self->getRtsPlayerLayerInterface()->getRTSFormInput());
            $self->getSelectedBuildingPlayerGameInput()->setSelectedRTSLayer('org::allbinary::game::layer::special::CollidableDestroyableDamageableLayer'->getNullInstance());
        }
}


sub updateForm {
    my ($self, $scrollSelectionForm, $rtfFormInput) = @_;
        $self->getRtsPlayerLayerInterface()->setCurrentScrollSelectionForm($scrollSelectionForm);
        $self->setSelectedRtsFormInput($rtfFormInput);
}


# throws Exception
sub setSelectedRTSLayer {
    my ($self, $rtSLayer, $geographicMapCellPosition) = @_;
        if ($rtSLayer != 'org::allbinary::game::layer::special::CollidableDestroyableDamageableLayer'->getNullInstance() && $self->getRtsPlayerLayerInterface()->getGroupInterface()->[0] != $rtSLayer->getGroupInterface()->[0]) {
            $self->getRtsPlayerLayerInterface()->add('org::allbinary::media::audio::ErrorSound'->getInstance());
            'org::allbinary::game::layer::hud::event::GameNotificationEventHandler'->getInstance()->fireEvent($self->{notYoursGameNotificationEvent});
            return;
        }
        my $gameCanvas = $self->getGameCanvas();
        if ($rtSLayer != 'org::allbinary::game::layer::special::CollidableDestroyableDamageableLayer'->getNullInstance()) {
            $self->getRtsPlayerLayerInterface()->add('org::allbinary::media::audio::SelectBuildingSound'->getInstance());
            my $rtsLayer = $rtSLayer;
            $rtsLayer->select();
            $self->updateFormForLayer($rtsLayer);
            if ($gameCanvas->getGameState() == $self->{gameStateFactory}->{PLAYING_GAME_STATE}) {
                if ($rtsLayer->isSelfUpgradeable()) {
                    $gameCanvas->updateCurrentTouchInputFactory('org::allbinary::input::motion::button::RTSTouchButtonsBuilder'->new());
                } else {
                    $gameCanvas->updateCurrentTouchInputFactory('org::allbinary::input::motion::button::NoBuildingSelectedTouchButtonsBuilder'->new());
                }
            } else {
                my $endLevelTouchButtonsBuilder = 'org::allbinary::input::motion::button::EndLevelTouchButtonsBuilder'->new();
                if (defined($self->{touchButtonsBuilderFactory})) {
                    $endLevelTouchButtonsBuilder->add($self->{touchButtonsBuilderFactory}->getInstance());
                }
                $gameCanvas->updateCurrentTouchInputFactory($endLevelTouchButtonsBuilder);
            }
        } else {
            $self->{logUtil}->putF("Set Player Default Form", $self, "setSelectedRTSLayer");
            $self->getRtsPlayerLayerInterface()->setCurrentScrollSelectionForm($self->getRtsPlayerLayerInterface()->getBuildingScrollSelectionForm());
            $self->setSelectedRtsFormInput($self->getRtsPlayerLayerInterface()->getRTSFormInput());
            $self->getSelectedBuildingPlayerGameInput()->setSelectedRTSLayer('org::allbinary::game::layer::special::CollidableDestroyableDamageableLayer'->getNullInstance());
            if ($gameCanvas->getGameState() == $self->{gameStateFactory}->{PLAYING_GAME_STATE}) {
                $gameCanvas->updateCurrentTouchInputFactory('org::allbinary::input::motion::button::NoBuildingSelectedTouchButtonsBuilder'->new());
            } else {
                my $endLevelNoBuildingSelectedTouchButtonsBuilder = 'org::allbinary::input::motion::button::EndLevelNoBuildingSelectedTouchButtonsBuilder'->new();
                if (defined($self->{touchButtonsBuilderFactory})) {
                    $endLevelNoBuildingSelectedTouchButtonsBuilder->add($self->{touchButtonsBuilderFactory}->getInstance());
                }
                $gameCanvas->updateCurrentTouchInputFactory($endLevelNoBuildingSelectedTouchButtonsBuilder);
            }
        }
        $self->getSelectedRtsFormInput()->setSelectedGeographicCellPosition($geographicMapCellPosition);
        $self->getSelectedBuildingPlayerGameInput()->setSelectedRTSLayer($rtSLayer);
        $self->updatePaintable();
}


sub updatePaintable {
    my ($self) = @_;
        my $list = $self->getSelectedBuildingPlayerGameInput()->getSelectedBasicArrayList();
        if ($list->size() > 1) {
            my $geographicMapCompositeInterface = $self->getGameCanvas();
            my $geographicMapInterface = $geographicMapCompositeInterface->getGeographicMapInterface()->[0];
            $self->{multiSelectPaintable}->setBasicColorP($geographicMapInterface->getForegroundBasicColor());
            $self->{multiSelectPaintable}->update($list);
            $self->getRTSLayerInfoPaintable()->updateRTSLayerInfoSelection($self->{multiSelectPaintable});
        } elsif ($list->size() == 1) {
            my $rtsLayer = $list->get(0);
            $self->getRTSLayerInfoPaintable()->updateRTSLayerInfoSelection($rtsLayer->createHudPaintable());
        } else {
            $self->getRTSLayerInfoPaintable()->updateRTSLayerInfoInit('org::allbinary::graphics::paint::NullInitUpdatePaintable'->getInstance());
        }
}


sub paint {
    my ($self, $graphics) = @_;
        $self->SUPER::paint($graphics);
        if ($self->{startPoint} != 'org::allbinary::graphics::PointFactory'->getInstance()->{ZERO_ZERO} && $self->{endPoint} != 'org::allbinary::graphics::PointFactory'->getInstance()->{ZERO_ZERO}) {
            $graphics->setColor(int('org::allbinary::graphics::color::BasicColorFactory'->getInstance()->{RED}));
            my $rectX1 = $self->{startPoint}->getX();
            my $rectY1 = $self->{startPoint}->getY();
            my $rectX2 = $self->{endPoint}->getX();
            my $rectY2 = $self->{endPoint}->getY();
            if ($rectX1 > $rectX2) {
                $rectX2 = $rectX1;
                $rectX1 = $self->{endPoint}->getX();
            }
            if ($rectY1 > $rectY2) {
                $rectY2 = $rectY1;
                $rectY1 = $self->{endPoint}->getY();
            }
            $graphics->drawRect($rectX1, $rectY1, $rectX2 - $rectX1, $rectY2 - $rectY1);
        }
}


sub onMotionGestureEvent {
    my ($self, $motionGestureEvent) = @_;
        $self->getMotionGestureInputList()->add($motionGestureEvent);
}


sub onScrolledMotionGestureEvent {
    my ($self, $motionGestureEvent) = @_;
}


sub getSelectedRtsLayer {
    my ($self) = @_;
        return $self->{selectedRtsLayer};
}


sub setSelectedRtsLayer {
    my ($self, $selectedRtsLayer) = @_;
        $self->{selectedRtsLayer} = $selectedRtsLayer;
}

# use javax::microedition::lcdui::Graphics;
use org::allbinary::game::input::form::RTSFormInput;
use org::allbinary::game::layer::MultiSelectPaintable;
use org::allbinary::game::layer::RTSGameStrings;
use org::allbinary::game::layer::RTSLayer;
use org::allbinary::game::layer::RTSLayerInfoPaintable;
use org::allbinary::game::layer::RTSPlayerLayerInterface;
use org::allbinary::game::state::GameStateFactory;
use org::allbinary::input::motion::button::EndLevelNoBuildingSelectedTouchButtonsBuilder;
use org::allbinary::input::motion::button::EndLevelTouchButtonsBuilder;
use org::allbinary::input::motion::button::NoBuildingSelectedTouchButtonsBuilder;
use org::allbinary::input::motion::button::RTSTouchButtonsBuilder;
use org::allbinary::media::audio::SelectBuildingSound;
use org::allbinary::util::BasicArrayList;
use org::allbinary::string::CommonSeps;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::java::bool::BooleanFactory;
use org::allbinary::game::displayable::canvas::AllBinaryGameCanvas;
use org::allbinary::game::layer::AllBinaryGameLayerManager;
use org::allbinary::game::layer::hud::event::GameNotificationEvent;
use org::allbinary::game::layer::hud::event::GameNotificationEventHandler;
use org::allbinary::game::layer::special::CollidableDestroyableDamageableLayer;
use org::allbinary::graphics::GPoint;
use org::allbinary::graphics::PointFactory;
use org::allbinary::graphics::color::BasicColorFactory;
use org::allbinary::graphics::form::ScrollSelectionForm;
use org::allbinary::graphics::form::item::ABCustomItem;
use org::allbinary::graphics::paint::NullInitUpdatePaintable;
use org::allbinary::input::motion::button::TouchButtonsBuilderFactory;
use org::allbinary::input::motion::gesture::MotionGestureInput;
use org::allbinary::input::motion::gesture::TouchMotionGestureFactory;
use org::allbinary::input::motion::gesture::observer::BaseMotionGestureEventListener;
use org::allbinary::input::motion::gesture::observer::BasicMotionGesturesHandler;
use org::allbinary::input::motion::gesture::observer::MotionGestureEvent;
use org::allbinary::layer::AllBinaryLayerManager;
use org::allbinary::logic::math::SmallIntegerSingletonFactory;
use org::allbinary::string::CommonLabels;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::math::RectangleCollisionUtil;
use org::allbinary::media::audio::ErrorSound;
use org::allbinary::media::graphics::geography::map::BasicGeographicMap;
use org::allbinary::media::graphics::geography::map::GeographicMapCellPosition;
use org::allbinary::media::graphics::geography::map::GeographicMapCompositeInterface;
use org::allbinary::view::ViewPositionBase;
use org::allbinary::game::input::RTSPlayerGameInput;

1;

