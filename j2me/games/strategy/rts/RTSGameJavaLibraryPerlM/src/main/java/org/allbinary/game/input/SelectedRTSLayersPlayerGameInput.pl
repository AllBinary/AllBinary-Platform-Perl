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

package org::allbinary::game::input::SelectedRTSLayersPlayerGameInput;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::input::PlayerGameInput';


sub _init_fields {
    my ($self) = @_;
    $self->{inputProcessorArray} = [(undef) x ('org::allbinary::game::input::InputFactory'->getInstance()->{MAX})];
    $self->{list} = undef;
    $self->{isSingleKeyProcessing} = 'org::allbinary::game::configuration::feature::Features'->getInstance()->isFeature('org::allbinary::game::configuration::feature::InputFeatureFactory'->getInstance()->{SINGLE_KEY_REPEAT_PRESS}) || 'org::allbinary::game::configuration::feature::Features'->getInstance()->isFeature('org::allbinary::game::configuration::feature::InputFeatureFactory'->getInstance()->{SINGLE_KEY_PRESS});
    $self->{selectedRTSLayersList} = 'org::allbinary::util::BasicArrayListD'->new();
    $self->{preSelectedRTSLayersList} = 'org::allbinary::util::BasicArrayListD'->new();
    $self->{paintSelectedRTSLayersList} = 'org::allbinary::util::BasicArrayListUtil'->getInstance()->getImmutableInstance();
    $self->{rtsPlayerLayerInterface} = undef;
    $self->{selectRTSLayerVisitorInterface} = undef;
    $self->{upgradeGameNotificationEvent} = undef;
    $self->{noMoneyGameNotificationEvent} = undef;
    $self->{downgradeGameNotificationEvent} = undef;
}


sub new {
    my ($class, $towerInfoPaintable, $rtsPlayerLayerInterface, $list, $playerInputId, $selectRTSLayerVisitorFactoryInterface) = @_;
    my $self = $class->SUPER::new($list, 'org::allbinary::util::BasicArrayListD'->new(), $playerInputId);
    $self->_init_fields();
        # super(...) made $self above
        $self->initInputProcessors();
        $self->{rtsPlayerLayerInterface} = $rtsPlayerLayerInterface;
        $self->{list} = $list;
        $self->{selectRTSLayerVisitorInterface} = $selectRTSLayerVisitorFactoryInterface->create($self);
        my $smallIntegerSingletonFactory = 'org::allbinary::logic::math::SmallIntegerSingletonFactory'->getInstance();
        my $basicColorFactory = 'org::allbinary::graphics::color::BasicColorFactory'->getInstance();
        $self->{upgradeGameNotificationEvent} = 'org::allbinary::game::layer::hud::event::GameNotificationEvent'->new($self, 'org::allbinary::game::layer::RTSGameStrings'->getInstance()->{UPGRADE}, $smallIntegerSingletonFactory->getAt(2), $basicColorFactory->{PINK}, 'org::allbinary::logic::java::bool::BooleanFactory'->getInstance()->{FALSE});
        $self->{noMoneyGameNotificationEvent} = 'org::allbinary::game::layer::hud::event::GameNotificationEvent'->new($self, 'org::allbinary::game::layer::RTSGameStrings'->getInstance()->{NO_MONEY}, $smallIntegerSingletonFactory->getAt(2), $basicColorFactory->{PINK}, 'org::allbinary::logic::java::bool::BooleanFactory'->getInstance()->{FALSE});
        $self->{downgradeGameNotificationEvent} = 'org::allbinary::game::layer::hud::event::GameNotificationEvent'->new($self, 'org::allbinary::game::layer::RTSGameStrings'->getInstance()->{DOWNGRADE}, $smallIntegerSingletonFactory->getAt(2), $basicColorFactory->{PINK}, 'org::allbinary::logic::java::bool::BooleanFactory'->getInstance()->{FALSE});
    return $self;
}


# throws Exception
sub setAllBinaryGameLayerManager {
    my ($self, $allBinaryGameLayerManager) = @_;
        my $geographicMapCompositeInterface = $allBinaryGameLayerManager;
        my $geographicMapInterface = $geographicMapCompositeInterface->getGeographicMapInterface()->[0];
        $self->{upgradeGameNotificationEvent}->setBasicColorP($geographicMapInterface->getForegroundBasicColor());
        $self->{noMoneyGameNotificationEvent}->setBasicColorP($geographicMapInterface->getForegroundBasicColor());
        $self->{downgradeGameNotificationEvent}->setBasicColorP($geographicMapInterface->getForegroundBasicColor());
}


sub isSelected {
    my ($self, $rtsLayer) = @_;
        if ($self->{selectedRTSLayersList}->contains($rtsLayer)) {
            return 1;
        } else {
            return 0;
        }
}


# throws Exception
sub upgrade {
    my ($self) = @_;
        my $anyChanged = 0;
        for (my $index = $self->{selectedRTSLayersList}->size() - 1; $index >= 0; $index--) {
            my $rtsLayer = $self->{selectedRTSLayersList}->get($index);
            if ($rtsLayer->isUpgradeable()) {
                my $capital = $self->{rtsPlayerLayerInterface}->getCapital();
                my $upgradeCost = $rtsLayer->getUpgradeCost();
                if ($upgradeCost <= $capital->getTotalMoney()) {
                    $anyChanged = 1;
                    $self->{rtsPlayerLayerInterface}->add('org::allbinary::media::audio::UpgradeSound'->getInstance());
                    $rtsLayer->upgrade();
                    $capital->removeMoney($upgradeCost);
                    if (!$self->{rtsPlayerLayerInterface}->implmentsArtificialIntelligenceCompositeInterface()) {
                        'org::allbinary::game::layer::hud::event::GameNotificationEventHandler'->getInstance()->fireEvent($self->{upgradeGameNotificationEvent});
                    }
                } else {
                    $self->{rtsPlayerLayerInterface}->add('org::allbinary::media::audio::ErrorSound'->getInstance());
                    if (!$self->{rtsPlayerLayerInterface}->implmentsArtificialIntelligenceCompositeInterface()) {
                        'org::allbinary::game::layer::hud::event::GameNotificationEventHandler'->getInstance()->fireEvent($self->{noMoneyGameNotificationEvent});
                    }
                }
            }
        }
        if ($anyChanged) {
            my $rtsPlayerGameInput = ($self->{rtsPlayerLayerInterface}->getPlayerGameInput());
            $rtsPlayerGameInput->updatePaintable();
        }
}


# throws Exception
sub downgrade {
    my ($self) = @_;
        my $anyChanged = 0;
        for (my $index = $self->{selectedRTSLayersList}->size(); --$index >= 0; ) {
            my $rtsLayer = $self->{selectedRTSLayersList}->get($index);
            if ($rtsLayer->isDowngradeable()) {
                $anyChanged = 1;
                $self->{rtsPlayerLayerInterface}->add('org::allbinary::media::audio::DowngradeSound'->getInstance());
                my $downgradeCost = $rtsLayer->getDowngradeCost();
                $rtsLayer->downgrade();
                my $capital = $self->{rtsPlayerLayerInterface}->getCapital();
                $capital->addMoney($downgradeCost);
                if (!$self->{rtsPlayerLayerInterface}->implmentsArtificialIntelligenceCompositeInterface()) {
                    'org::allbinary::game::layer::hud::event::GameNotificationEventHandler'->getInstance()->fireEvent($self->{downgradeGameNotificationEvent});
                }
            }
        }
        if ($anyChanged) {
            my $rtsPlayerGameInput = ($self->{rtsPlayerLayerInterface}->getPlayerGameInput());
            $rtsPlayerGameInput->updatePaintable();
        }
}


sub initInputProcessors {
    my ($self) = @_;
        $self->{inputProcessorArray}->[$javax::microedition::lcdui::Canvas::KEY_NUM1] = 'org::allbinary::game::input::SelectedRTSLayersPlayerUpgradeGameInputProcessor'->new($self);
        $self->{inputProcessorArray}->[$javax::microedition::lcdui::Canvas::KEY_NUM3] = 'org::allbinary::game::input::SelectedRTSLayersPlayerDowngradeGameInputProcessor'->new($self);
        'org::allbinary::game::input::GameInputProcessorUtil'->init($self->{inputProcessorArray});
}


# throws Exception
sub processInputKey {
    my ($self, $key) = @_;
        if (defined($self->{selectedRTSLayersList})) {
            $self->{inputProcessorArray}->[$key]->processEvent('org::allbinary::game::layer::AllBinaryGameLayerManager'->getNullInstance(), $org::allbinary::game::input::event::GameKeyEvent::NONE);
        }
}


# throws Exception
sub processInput {
    my ($self, $layerManager) = @_;
        try {
            my $size = $self->{list}->size();
            my $key = 0;
            for (my $index = 0; $index < $size; $index++) {
                my $gameKeyEvent = $self->{list}->get($index);
                $key = $gameKeyEvent->getKey();
                $self->processInputKey($key);
            }
            if ($self->{isSingleKeyProcessing}) {
                $self->clear();
            } else {
                $self->update();
            }
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{gameInputStrings}->{PROCESS_INPUT}, $e);
        }
}


sub getSelectedBasicArrayList {
    my ($self) = @_;
        return $self->{selectedRTSLayersList};
}


sub addSelectedRTSLayer {
    my ($self, $selectedLayer) = @_;
        $self->{paintSelectedRTSLayersList} = 'org::allbinary::util::BasicArrayListUtil'->getInstance()->getImmutableInstance();
        if ($selectedLayer == 'org::allbinary::game::layer::special::CollidableDestroyableDamageableLayer'->getNullInstance()) {
            $self->deselectAll();
            $self->{selectedRTSLayersList}->clear();
        } else {
            if (!$self->{selectedRTSLayersList}->contains($selectedLayer)) {
                $self->{selectedRTSLayersList}->add($selectedLayer);
            }
        }
        $self->{paintSelectedRTSLayersList} = $self->{selectedRTSLayersList};
}


sub setSelectedRTSLayer {
    my ($self, $selectedLayer) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append("Selected Layer: ");
        if (defined($selectedLayer)) {
            $stringBuffer->append($selectedLayer->getName());
        }
        $self->{logUtil}->putF($stringBuffer->toString(), $self, "setSelectedRTSLayer");
        $self->{paintSelectedRTSLayersList} = 'org::allbinary::util::BasicArrayListUtil'->getInstance()->getImmutableInstance();
        $self->{selectRTSLayerVisitorInterface}->visit($selectedLayer);
        $self->deselectAll();
        if ($self->{selectedRTSLayersList}->size() > 0) {
            $self->getPreSelectedRTSLayersList()->clear();
            my $tempList = $self->getPreSelectedRTSLayersList();
            $self->{preSelectedRTSLayersList} = $self->{selectedRTSLayersList};
            $self->{selectedRTSLayersList} = $tempList;
            $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append("Preselected: ")->append($self->{preSelectedRTSLayersList}->toString())->toString(), $self, "setSelectedRTSLayer");
        }
        if ($selectedLayer != 'org::allbinary::game::layer::special::CollidableDestroyableDamageableLayer'->getNullInstance()) {
            $self->{selectedRTSLayersList}->add($selectedLayer);
        }
        $self->{paintSelectedRTSLayersList} = $self->{selectedRTSLayersList};
}


sub getLastSelectedRtsLayer {
    my ($self) = @_;
        if ($self->isAnyRTSLayerSelected()) {
            return $self->{selectedRTSLayersList}->get($self->{selectedRTSLayersList}->size() - 1);
        } else {
            return 'org::allbinary::game::layer::special::CollidableDestroyableDamageableLayer'->getNullInstance();
        }
}


sub selectAllPreselected {
    my ($self) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append("Select all Preselected: ");
        $stringBuffer->append($self->{preSelectedRTSLayersList}->toString());
        $self->{logUtil}->putF($stringBuffer->toString(), $self, "selectAllPreselected");
        for (my $index = $self->{preSelectedRTSLayersList}->size() - 1; $index >= 0; $index--) {
            my $rtsLayer = $self->{preSelectedRTSLayersList}->get($index);
            $rtsLayer->select();
        }
}


sub deselectAllPreselected {
    my ($self) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append("Deselect all Preselected: ");
        $stringBuffer->append($self->{preSelectedRTSLayersList}->toString());
        $self->{logUtil}->putF($stringBuffer->toString(), $self, "deselectAllPreselected");
        for (my $index = $self->{preSelectedRTSLayersList}->size() - 1; $index >= 0; $index--) {
            my $rtsLayer = $self->{preSelectedRTSLayersList}->get($index);
            $rtsLayer->deselect();
        }
        $self->{preSelectedRTSLayersList}->clear();
}


sub deselectAll {
    my ($self) = @_;
        for (my $index = $self->{selectedRTSLayersList}->size() - 1; $index >= 0; $index--) {
            my $rtsLayer = $self->{selectedRTSLayersList}->get($index);
            $rtsLayer->deselect();
        }
}


sub isAnyRTSLayerSelected {
    my ($self) = @_;
        if ($self->{selectedRTSLayersList}->size() == 0) {
            return 0;
        }
        return 1;
}


sub getPaintSelectedRTSLayersList {
    my ($self) = @_;
        return $self->{paintSelectedRTSLayersList};
}


sub getPreSelectedRTSLayersList {
    my ($self) = @_;
        return $self->{preSelectedRTSLayersList};
}

# use javax::microedition::lcdui::Canvas;
use org::allbinary::game::layer::RTSGameStrings;
use org::allbinary::game::layer::RTSLayer;
use org::allbinary::game::layer::RTSLayerInfoPaintable;
use org::allbinary::game::layer::RTSPlayerLayerInterface;
use org::allbinary::game::layer::capital::Capital;
use org::allbinary::media::audio::DowngradeSound;
use org::allbinary::media::audio::UpgradeSound;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::util::BasicArrayListUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::java::bool::BooleanFactory;
use org::allbinary::game::configuration::feature::Features;
use org::allbinary::game::configuration::feature::InputFeatureFactory;
use org::allbinary::game::input::event::GameKeyEvent;
use org::allbinary::game::layer::AllBinaryGameLayerManager;
use org::allbinary::game::layer::hud::event::GameNotificationEvent;
use org::allbinary::game::layer::hud::event::GameNotificationEventHandler;
use org::allbinary::game::layer::special::CollidableDestroyableDamageableLayer;
use org::allbinary::graphics::color::BasicColorFactory;
use org::allbinary::layer::AllBinaryLayerManager;
use org::allbinary::logic::util::visitor::Visitor;
use org::allbinary::logic::math::SmallIntegerSingletonFactory;
use org::allbinary::media::audio::ErrorSound;
use org::allbinary::media::graphics::geography::map::BasicGeographicMap;
use org::allbinary::media::graphics::geography::map::GeographicMapCompositeInterface;
use org::allbinary::game::input::PlayerGameInput;
use org::allbinary::game::input::InputFactory;
use org::allbinary::game::input::SelectedRTSLayersPlayerUpgradeGameInputProcessor;
use org::allbinary::game::input::SelectedRTSLayersPlayerDowngradeGameInputProcessor;
use org::allbinary::game::input::GameInputProcessorUtil;

1;

