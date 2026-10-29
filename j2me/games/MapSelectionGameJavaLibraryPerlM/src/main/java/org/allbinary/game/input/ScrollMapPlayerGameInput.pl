#
# AllBinary Open License Version 1
# Copyright (c) 2011 AllBinary
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

package org::allbinary::game::input::ScrollMapPlayerGameInput;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use POSIX ();
use parent -norequire,'org::allbinary::game::input::PlayerGameInput';


sub _init_fields {
    my ($self) = @_;
    $self->{inputProcessorArray} = [(undef) x ('org::allbinary::game::input::InputFactory'->getInstance()->{MAX})];
    $self->{border} = 150;
    $self->{inputList} = undef;
    $self->{isSingleKeyProcessing} = 'org::allbinary::game::configuration::feature::Features'->getInstance()->isFeature('org::allbinary::game::configuration::feature::InputFeatureFactory'->getInstance()->{SINGLE_KEY_REPEAT_PRESS}) || 'org::allbinary::game::configuration::feature::Features'->getInstance()->isFeature('org::allbinary::game::configuration::feature::InputFeatureFactory'->getInstance()->{SINGLE_KEY_PRESS});
    $self->{geographicMapInterface} = undef;
    $self->{maxBottom} = 0;
    $self->{maxRight} = 0;
    $self->{scrollMapEvent} = 'org::allbinary::layer::event::ScrollMapEvent'->new($self);
}


sub new {
    my ($class, $geographicMapInterface, $list, $playerInputId) = @_;
    my $self = $class->SUPER::new($list, 'org::allbinary::util::BasicArrayListD'->new(), $playerInputId);
    $self->_init_fields();
        # super(...) made $self above
        $self->initInputProcessors();
        $self->{geographicMapInterface} = $geographicMapInterface;
        $self->{inputList} = $list;
        $self->init();
    return $self;
}


# throws Exception
sub move {
    my ($self, $dx, $dy) = @_;
        my $terrainTiledLayer = $self->{geographicMapInterface}->getAllBinaryTiledLayer();
        $terrainTiledLayer->moveDXY(-$dx, -$dy);
        $self->{scrollMapEvent}->setDxDy(-$dx, -$dy);
        'org::allbinary::layer::event::ScrollMapEventHandler'->getInstance()->fireEvent($self->{scrollMapEvent});
}


sub init {
    my ($self) = @_;
        $self->{maxBottom} = $self->getSpecialHeight();
        $self->{maxRight} = $self->getSpecialWidth();
}


# throws Exception
sub scrollMiddleX {
    my ($self) = @_;
        my $terrainTiledLayer = $self->{geographicMapInterface}->getAllBinaryTiledLayer();
        my $displayInfo = 'org::allbinary::graphics::displayable::DisplayInfoSingleton'->getInstance();
        $self->move(-$terrainTiledLayer->getXP(), 0);
        if ($terrainTiledLayer->getWidth() < $displayInfo->getLastWidth()) {
            my $diffX = (POSIX::floor((($displayInfo->getLastWidth() - $terrainTiledLayer->getWidth())) / (2 ** (1))));
            $self->move(-$diffX, 0);
        } else {
            my $diffX = (POSIX::floor((($terrainTiledLayer->getWidth() - $displayInfo->getLastWidth())) / (2 ** (1))));
            $self->move($diffX, 0);
        }
}


# throws Exception
sub scrollY {
    my ($self, $anchor) = @_;
        my $terrainTiledLayer = $self->{geographicMapInterface}->getAllBinaryTiledLayer();
        my $displayInfo = 'org::allbinary::graphics::displayable::DisplayInfoSingleton'->getInstance();
        if ($anchor == $javax::microedition::lcdui::Graphics::TOP) {
            $self->{logUtil}->putF("Top", $self, "scrollY");
        } elsif ($anchor == $javax::microedition::lcdui::Graphics::BOTTOM) {
            $self->{logUtil}->putF("Bottom", $self, "scrollY");
            my $diffY = ($terrainTiledLayer->getHeight() - $displayInfo->getLastHeight());
            $self->move(0, $diffY);
        } elsif ($anchor == $javax::microedition::lcdui::Graphics::VCENTER) {
            $self->{logUtil}->putF("Center", $self, "scrollY");
            my $diffY = ($terrainTiledLayer->getHeight() - $displayInfo->getLastHeight()) / 2;
            $self->move(0, $diffY);
        } else {
            die ("No Such Anchor Supported");
        }
}


# throws Exception
sub up {
    my ($self) = @_;
        my $y = $self->{geographicMapInterface}->getAllBinaryTiledLayer()->getYP() - 10;
        if ($self->keepOnMapMinY($y)) {
            $self->move(0, -10);
        }
}


# throws Exception
sub down {
    my ($self) = @_;
        my $y = -$self->{geographicMapInterface}->getAllBinaryTiledLayer()->getYP() + 10;
        if ($self->keepOnMapMaxY($y)) {
            $self->move(0, 10);
        }
}


# throws Exception
sub right {
    my ($self) = @_;
        my $x = $self->{geographicMapInterface}->getAllBinaryTiledLayer()->getYP() + 10;
        if ($self->keepOnMapMinX($x)) {
            $self->move(10, 0);
        }
}


# throws Exception
sub left {
    my ($self) = @_;
        my $x = -$self->{geographicMapInterface}->getAllBinaryTiledLayer()->getYP() - 10;
        if ($self->keepOnMapMaxX($x)) {
            $self->move(-10, 0);
        }
}


sub initInputProcessors {
    my ($self) = @_;
        $self->{inputProcessorArray}->[$javax::microedition::lcdui::Canvas::UP] = 'org::allbinary::game::input::ScrollMapUpGameInputProcessor'->new($self);
        $self->{inputProcessorArray}->[$javax::microedition::lcdui::Canvas::DOWN] = 'org::allbinary::game::input::ScrollMapDownGameInputProcessor'->new($self);
        $self->{inputProcessorArray}->[$javax::microedition::lcdui::Canvas::KEY_NUM9] = 'org::allbinary::game::input::ScrollMapRightGameInputProcessor'->new($self);
        $self->{inputProcessorArray}->[$javax::microedition::lcdui::Canvas::KEY_NUM7] = 'org::allbinary::game::input::ScrollMapLeftGameInputProcessor'->new($self);
        'org::allbinary::game::input::GameInputProcessorUtil'->init($self->{inputProcessorArray});
}


# throws Exception
sub processInputKey {
    my ($self, $key) = @_;
        $self->{inputProcessorArray}->[$key]->processEvent('org::allbinary::game::layer::AllBinaryGameLayerManager'->getNullInstance(), $org::allbinary::game::input::event::GameKeyEvent::NONE);
}


# throws Exception
sub processInput {
    my ($self, $layerManager) = @_;
        try {
            my $size = $self->{inputList}->size();
            my $key = 0;
            for (my $index = 0; $index < $size; $index++) {
                my $gameKeyEvent = $self->{inputList}->get($index);
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


sub getSpecialHeight {
    my ($self) = @_;
        my $terrainTiledLayer = $self->{geographicMapInterface}->getAllBinaryTiledLayer();
        my $displayInfo = 'org::allbinary::graphics::displayable::DisplayInfoSingleton'->getInstance();
        if ($terrainTiledLayer->getHeight() > $displayInfo->getLastHeight()) {
            return $terrainTiledLayer->getHeight() - $displayInfo->getLastHeight();
        } else {
            return $displayInfo->getLastHeight() - $terrainTiledLayer->getHeight() + $terrainTiledLayer->getCellHeight();
        }
}


sub getSpecialWidth {
    my ($self) = @_;
        my $terrainTiledLayer = $self->{geographicMapInterface}->getAllBinaryTiledLayer();
        my $displayInfo = 'org::allbinary::graphics::displayable::DisplayInfoSingleton'->getInstance();
        if ($terrainTiledLayer->getWidth() > $displayInfo->getLastWidth()) {
            return $terrainTiledLayer->getWidth() - $displayInfo->getLastWidth();
        } else {
            return $displayInfo->getLastWidth() - $terrainTiledLayer->getWidth() + $terrainTiledLayer->getCellWidth();
        }
}


sub keepOnMapMaxY {
    my ($self, $newY) = @_;
        my $y = $self->{geographicMapInterface}->getAllBinaryTiledLayer()->getYP();
        if ($y > $self->{maxBottom} + $self->{border}) {
            return 0;
        } else {
            return 1;
        }
}


sub keepOnMapMinY {
    my ($self, $newY) = @_;
        my $y = $self->{geographicMapInterface}->getAllBinaryTiledLayer()->getYP();
        if ($y < -$self->{border}) {
            return 0;
        } else {
            return 1;
        }
}


sub keepOnMapMaxX {
    my ($self, $newX) = @_;
        my $x = $self->{geographicMapInterface}->getAllBinaryTiledLayer()->getXP();
        if ($x < -$self->{maxRight} - $self->{border}) {
            return 0;
        } else {
            return 1;
        }
}


sub keepOnMapMinX {
    my ($self, $newX) = @_;
        my $x = $self->{geographicMapInterface}->getAllBinaryTiledLayer()->getXP();
        if ($x > $self->{border}) {
            return 0;
        } else {
            return 1;
        }
}

# use javax::microedition::lcdui::Canvas;
# use javax::microedition::lcdui::Graphics;
use org::allbinary::util::BasicArrayList;
use org::allbinary::game::configuration::feature::Features;
use org::allbinary::game::configuration::feature::InputFeatureFactory;
use org::allbinary::game::input::event::GameKeyEvent;
use org::allbinary::game::layer::AllBinaryGameLayerManager;
use org::allbinary::game::layer::AllBinaryTiledLayer;
use org::allbinary::graphics::displayable::DisplayInfoSingleton;
use org::allbinary::layer::AllBinaryLayerManager;
use org::allbinary::layer::event::ScrollMapEvent;
use org::allbinary::layer::event::ScrollMapEventHandler;
use org::allbinary::media::graphics::geography::map::BasicGeographicMap;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::game::input::PlayerGameInput;
use org::allbinary::game::input::InputFactory;
use org::allbinary::game::input::ScrollMapUpGameInputProcessor;
use org::allbinary::game::input::ScrollMapDownGameInputProcessor;
use org::allbinary::game::input::ScrollMapRightGameInputProcessor;
use org::allbinary::game::input::ScrollMapLeftGameInputProcessor;
use org::allbinary::game::input::GameInputProcessorUtil;

1;

