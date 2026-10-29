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

package org::allbinary::game::input::RTSPlayerGameInput;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::input::PlayerGameInput';


sub _init_fields {
    my ($self) = @_;
    $self->{inputProcessorArray} = [(undef) x ('org::allbinary::game::input::InputFactory'->getInstance()->{MAX})];
    $self->{removeInputProcessorArray} = [(undef) x ('org::allbinary::game::input::InputFactory'->getInstance()->{MAX})];
    $self->{inputList} = undef;
    $self->{isSingleKeyProcessing} = 'org::allbinary::game::configuration::feature::Features'->getInstance()->isFeature('org::allbinary::game::configuration::feature::InputFeatureFactory'->getInstance()->{SINGLE_KEY_REPEAT_PRESS}) || 'org::allbinary::game::configuration::feature::Features'->getInstance()->isFeature('org::allbinary::game::configuration::feature::InputFeatureFactory'->getInstance()->{SINGLE_KEY_PRESS});
    $self->{gameCanvas} = undef;
    $self->{motionGestureInputList} = 'org::allbinary::util::BasicArrayListD'->new();
    $self->{scrollPlayerGameInput} = undef;
    $self->{selectedRTSLayerPlayerGameInput} = undef;
    $self->{towerInfoPaintable} = undef;
    $self->{rtsPlayerLayerInterface} = undef;
    $self->{layerPositionFinderInterface} = undef;
    $self->{selectedRtsFormInput} = 'org::allbinary::game::input::form::NullRTSFormInputFactory'->getInstance();
}


sub new {
    my ($class, $gameCanvas, $inputList, $playerInputId, $towerInfoPaintable, $rtsPlayerLayerInterface, $layerPositionFinderInterface, $selectRTSLayerVisitorFactoryInterface) = @_;
    my $self = $class->SUPER::new($inputList, 'org::allbinary::util::BasicArrayListD'->new(), $playerInputId);
    $self->_init_fields();
        # super(...) made $self above
        $self->initInputProcessors();
        $self->{gameCanvas} = $gameCanvas;
        $self->{inputList} = $inputList;
        $self->{towerInfoPaintable} = $towerInfoPaintable;
        $self->{rtsPlayerLayerInterface} = $rtsPlayerLayerInterface;
        $self->{selectedRTSLayerPlayerGameInput} = 'org::allbinary::game::input::SelectedRTSLayersPlayerGameInput'->new($self->getRTSLayerInfoPaintable(), $self->getRtsPlayerLayerInterface(), $self->{inputList}, $playerInputId, $selectRTSLayerVisitorFactoryInterface);
        if ($self->{rtsPlayerLayerInterface} != $org::allbinary::game::layer::NullRTSLayer::NULL_RTS_LAYER) {
            $self->setSelectedRtsFormInput($self->{rtsPlayerLayerInterface}->getRTSFormInput());
        }
        my $geographicMapCompositeInterface = $self->{gameCanvas}->getLayerManager();
        my $geographicMapInterface = $geographicMapCompositeInterface->getGeographicMapInterface()->[0];
        $self->{scrollPlayerGameInput} = 'org::allbinary::game::input::ScrollMapPlayerGameInput'->new($geographicMapInterface, $self->{inputList}, $playerInputId);
        $self->{layerPositionFinderInterface} = $layerPositionFinderInterface;
    return $self;
}


# throws Exception
sub setAllBinaryGameLayerManager {
    my ($self, $allBinaryGameLayerManager) = @_;
        $self->{selectedRTSLayerPlayerGameInput}->setAllBinaryGameLayerManager($allBinaryGameLayerManager);
        if ($self->{selectedRtsFormInput} != 'org::allbinary::game::input::form::NullRTSFormInputFactory'->getInstance()) {
            $self->{selectedRtsFormInput}->setAllBinaryGameLayerManager($allBinaryGameLayerManager);
        }
}


sub onDisplayChangeEvent {
    my ($self, $displayChangeEvent) = @_;
        try {
            $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, "onDisplayChangeEvent");
            $self->getRTSLayerInfoPaintable()->update();
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "onDisplayChangeEvent", $e);
        }
}


# throws Exception
sub left {
    my ($self) = @_;
        $self->{rtsPlayerLayerInterface}->getCurrentScrollSelectionForm()->processInputKey($javax::microedition::lcdui::Canvas::LEFT);
}


# throws Exception
sub right {
    my ($self) = @_;
        $self->{rtsPlayerLayerInterface}->getCurrentScrollSelectionForm()->processInputKey($javax::microedition::lcdui::Canvas::RIGHT);
}


sub initInputProcessors {
    my ($self) = @_;
        $self->{inputProcessorArray}->[$javax::microedition::lcdui::Canvas::LEFT] = 'org::allbinary::game::input::RTSPlayerLeftGameInputProcessor'->new($self);
        $self->{inputProcessorArray}->[$javax::microedition::lcdui::Canvas::KEY_NUM0] = $self->{inputProcessorArray}->[$javax::microedition::lcdui::Canvas::LEFT];
        $self->{inputProcessorArray}->[$javax::microedition::lcdui::Canvas::RIGHT] = 'org::allbinary::game::input::RTSPlayerRightGameInputProcessor'->new($self);
        $self->{inputProcessorArray}->[$javax::microedition::lcdui::Canvas::KEY_POUND] = $self->{inputProcessorArray}->[$javax::microedition::lcdui::Canvas::RIGHT];
        $self->{removeInputProcessorArray}->[$javax::microedition::lcdui::Canvas::KEY_NUM1] = 'org::allbinary::game::input::RTSPlayerFireGameInputProcessor'->new($self);
        $self->{removeInputProcessorArray}->[$javax::microedition::lcdui::Canvas::KEY_NUM3] = $self->{removeInputProcessorArray}->[$javax::microedition::lcdui::Canvas::KEY_NUM1];
        $self->{removeInputProcessorArray}->[$javax::microedition::lcdui::Canvas::KEY_NUM3] = $self->{removeInputProcessorArray}->[$javax::microedition::lcdui::Canvas::KEY_NUM1];
        $self->{removeInputProcessorArray}->[$javax::microedition::lcdui::Canvas::LEFT] = $self->{removeInputProcessorArray}->[$javax::microedition::lcdui::Canvas::KEY_NUM1];
        $self->{removeInputProcessorArray}->[$javax::microedition::lcdui::Canvas::RIGHT] = $self->{removeInputProcessorArray}->[$javax::microedition::lcdui::Canvas::KEY_NUM1];
        $self->{removeInputProcessorArray}->[$javax::microedition::lcdui::Canvas::KEY_NUM0] = $self->{removeInputProcessorArray}->[$javax::microedition::lcdui::Canvas::KEY_NUM1];
        $self->{removeInputProcessorArray}->[$javax::microedition::lcdui::Canvas::KEY_POUND] = $self->{removeInputProcessorArray}->[$javax::microedition::lcdui::Canvas::KEY_NUM1];
        'org::allbinary::game::input::GameInputProcessorUtil'->init($self->{inputProcessorArray});
        'org::allbinary::game::input::GameInputProcessorUtil'->init($self->{removeInputProcessorArray});
}


# throws Exception
sub processInput {
    my ($self, $layerManager) = @_;
        try {
            $self->processMotionInput($layerManager);
            my $size = $self->{inputList}->size();
            my $key = 0;
            for (my $index = 0; $index < $size; $index++) {
                my $gameKeyEvent = $self->{inputList}->get($index);
                $key = $gameKeyEvent->getKey();
                $self->getScrollPlayerGameInput()->processInputKey($key);
                $self->getSelectedBuildingPlayerGameInput()->processInputKey($key);
                $self->{inputProcessorArray}->[$key]->processEvent($layerManager, $gameKeyEvent);
                $self->{removeInputProcessorArray}->[$key]->processEvent($layerManager, $gameKeyEvent);
            }
            if ($self->isIsSingleKeyProcessing()) {
                $self->clear();
            } else {
                $self->update();
            }
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{gameInputStrings}->{PROCESS_INPUT}, $e);
        }
}


# throws Exception
sub processMotionInput {
    my ($self, $layerManager) = @_;
}


# throws Exception
sub select {
    my ($self, $motionGestureEvent) = @_;
        my $point = $motionGestureEvent->getCurrentPoint();
        my $geographicMapCompositeInterface = $self->{gameCanvas}->getLayerManager();
        my $geographicMapInterface = $geographicMapCompositeInterface->getGeographicMapInterface()->[0];
        my $allBinaryTiledLayer = $geographicMapInterface->getAllBinaryTiledLayer();
        my $x = $point->getX() + $allBinaryTiledLayer->getXP();
        my $y = $point->getY() + $allBinaryTiledLayer->getYP();
        my $geographicMapCellPosition = $geographicMapInterface->getCellPositionAtXYNoThrow($x, $y);
        if ($geographicMapCellPosition != $org::allbinary::media::graphics::geography::map::SimpleGeographicMapCellPositionFactory::NULL_GEOGRAPHIC_MAP_CELL_POSITION) {
            'org::allbinary::media::audio::SecondaryPlayerQueueFactory'->getInstance()->add('org::allbinary::media::audio::SelectSound'->getInstance());
            my $layer = $self->{layerPositionFinderInterface}->getLayerInterface($geographicMapCellPosition);
            if ($layer == $org::allbinary::layer::AllBinaryLayer::NULL_ALLBINARY_LAYER) {
                $layer = 'org::allbinary::game::layer::special::CollidableDestroyableDamageableLayer'->getNullInstance();
            } else {
                $geographicMapCellPosition = $geographicMapInterface->getCellPositionAtXY($layer->getXP(), $layer->getYP());
            }
            my $foundRTSLayer = $layer;
            $self->setSelectedRTSLayer($foundRTSLayer, $geographicMapCellPosition);
        } else {
            my $commonLabels = 'org::allbinary::string::CommonLabels'->getInstance();
            $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append("Off Of Map -")->append($commonLabels->{WIDTH_LABEL})->appendint(int($allBinaryTiledLayer->getWidth()))->append($commonLabels->{HEIGHT_LABEL})->appendint(int($allBinaryTiledLayer->getHeight()))->toString(), $self, "select");
        }
}


# throws Exception
sub setSelectedRTSLayer {
    my ($self, $rtsLayer, $geographicMapCellPosition) = @_;
        $self->getSelectedBuildingPlayerGameInput()->setSelectedRTSLayer($rtsLayer);
}


sub paint {
    my ($self, $graphics) = @_;
        my $geographicMapCellPosition = $self->getSelectedRtsFormInput()->getSelectedGeographicCellPosition();
        my $geographicMapCompositeInterface = $self->{gameCanvas}->getLayerManager();
        my $geographicMapInterface = $geographicMapCompositeInterface->getGeographicMapInterface()->[0];
        my $allBinaryTiledLayer = $geographicMapInterface->getAllBinaryTiledLayer();
        $graphics->setColor(int('org::allbinary::graphics::color::BasicColorFactory'->getInstance()->{GREEN}));
        my $list = $self->getSelectedBuildingPlayerGameInput()->getPaintSelectedRTSLayersList();
        my $width = 0;
        my $height = 0;
        if ($list->size() > 0) {
            for (my $index = $list->size() - 1; $index >= 0; $index--) {
                my $rtsLayer = $list->get($index);
                $width = $rtsLayer->getWidth();
                $height = $rtsLayer->getHeight();
                $graphics->drawRect($rtsLayer->getXP() - $allBinaryTiledLayer->getXP(), $rtsLayer->getYP() - $allBinaryTiledLayer->getYP(), $width, $height);
            }
        } elsif ($geographicMapCellPosition != $org::allbinary::media::graphics::geography::map::SimpleGeographicMapCellPositionFactory::NULL_GEOGRAPHIC_MAP_CELL_POSITION) {
            my $point = $geographicMapCellPosition->getPoint();
            $width = $allBinaryTiledLayer->getCellWidth();
            $height = $allBinaryTiledLayer->getCellHeight();
            $graphics->drawRect($point->getX() - $allBinaryTiledLayer->getXP(), $point->getY() - $allBinaryTiledLayer->getYP(), $width, $height);
        }
}


sub updatePaintable {
    my ($self) = @_;
}


sub getSelectedBuildingPlayerGameInput {
    my ($self) = @_;
        return $self->{selectedRTSLayerPlayerGameInput};
}


sub getSelectedRtsFormInput {
    my ($self) = @_;
        return $self->{selectedRtsFormInput};
}


sub setSelectedRtsFormInput {
    my ($self, $selectedRtsFormInput) = @_;
        $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append("RTSFormInput: ")->append('org::allbinary::logic::string::StringUtil'->getInstance()->toString($selectedRtsFormInput))->toString(), $self, "setSelectedRtsFormInput");
        $self->{selectedRtsFormInput} = $selectedRtsFormInput;
}


sub getRtsPlayerLayerInterface {
    my ($self) = @_;
        return $self->{rtsPlayerLayerInterface};
}


sub getRTSLayerInfoPaintable {
    my ($self) = @_;
        return $self->{towerInfoPaintable};
}


sub getMotionGestureInputList {
    my ($self) = @_;
        return $self->{motionGestureInputList};
}


sub getGameCanvas {
    my ($self) = @_;
        return $self->{gameCanvas};
}


sub isIsSingleKeyProcessing {
    my ($self) = @_;
        return $self->{isSingleKeyProcessing};
}


sub getScrollPlayerGameInput {
    my ($self) = @_;
        return $self->{scrollPlayerGameInput};
}

# use javax::microedition::lcdui::Canvas;
# use javax::microedition::lcdui::Graphics;
use org::allbinary::game::input::form::RTSFormInput;
use org::allbinary::game::layer::RTSLayer;
use org::allbinary::game::layer::RTSLayerInfoPaintable;
use org::allbinary::game::layer::RTSPlayerLayerInterface;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::game::configuration::feature::Features;
use org::allbinary::game::configuration::feature::InputFeatureFactory;
use org::allbinary::game::displayable::canvas::AllBinaryGameCanvas;
use org::allbinary::game::input::event::GameKeyEvent;
use org::allbinary::game::input::form::NullRTSFormInputFactory;
use org::allbinary::game::layer::AllBinaryGameLayerManager;
use org::allbinary::game::layer::AllBinaryTiledLayer;
use org::allbinary::game::layer::NullRTSLayer;
use org::allbinary::game::layer::special::CollidableDestroyableDamageableLayer;
use org::allbinary::graphics::GPoint;
use org::allbinary::graphics::color::BasicColorFactory;
use org::allbinary::graphics::displayable::event::DisplayChangeEvent;
use org::allbinary::input::motion::gesture::observer::MotionGestureEvent;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::layer::AllBinaryLayerManager;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::media::audio::SecondaryPlayerQueueFactory;
use org::allbinary::media::audio::SelectSound;
use org::allbinary::media::graphics::geography::map::BasicGeographicMap;
use org::allbinary::media::graphics::geography::map::GeographicMapCellPosition;
use org::allbinary::media::graphics::geography::map::GeographicMapCompositeInterface;
use org::allbinary::media::graphics::geography::map::SimpleGeographicMapCellPositionFactory;
use org::allbinary::string::CommonLabels;
use org::allbinary::game::input::PlayerGameInput;
use org::allbinary::game::input::InputFactory;
use org::allbinary::game::input::SelectedRTSLayersPlayerGameInput;
use org::allbinary::game::input::ScrollMapPlayerGameInput;
use org::allbinary::game::input::RTSPlayerLeftGameInputProcessor;
use org::allbinary::game::input::RTSPlayerRightGameInputProcessor;
use org::allbinary::game::input::RTSPlayerFireGameInputProcessor;
use org::allbinary::game::input::GameInputProcessorUtil;

1;

