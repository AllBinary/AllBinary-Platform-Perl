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

package org::allbinary::game::layer::AllBinaryGameLayerManager;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::layer::AllBinaryLayerManager';

our $NULL_ALLBINARY_LAYER_MANAGER = 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT};
our $ID = 'org::allbinary::logic::math::SmallIntegerSingletonFactory'->getInstance()->getAt(22);

sub _init_fields {
    my ($self) = @_;
    $self->{backgroundBasicColor} = undef;
    $self->{foregroundBasicColor} = undef;
    $self->{gameInfo} = undef;
    $self->{playerGameInputCompositeInterface} = $org::allbinary::game::input::NullPlayerGameInputComposite::NULL_PLAYER_GAME_INPUT_COMPOSITE;
}


sub getNullInstance {
    my ($class) = @_;
        if ($org::allbinary::game::layer::AllBinaryGameLayerManager::NULL_ALLBINARY_LAYER_MANAGER == 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT}) {
            $org::allbinary::game::layer::AllBinaryGameLayerManager::NULL_ALLBINARY_LAYER_MANAGER = 'org::allbinary::game::layer::AllBinaryGameLayerManager'->new('org::allbinary::graphics::color::BasicColorFactory'->getInstance()->{BLACK}, 'org::allbinary::graphics::color::BasicColorFactory'->getInstance()->{WHITE}, $org::allbinary::game::GameInfo::NONE);
        }
        return $org::allbinary::game::layer::AllBinaryGameLayerManager::NULL_ALLBINARY_LAYER_MANAGER;
}


sub new {
    my ($class, $backgroundBasicColor, $foregroundBasicColor, $gameInfo) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{backgroundBasicColor} = $backgroundBasicColor;
        $self->{foregroundBasicColor} = $foregroundBasicColor;
        my $itemColorFactory = 'org::allbinary::graphics::ItemColorFactory'->getInstance();
        $itemColorFactory->{INVERT_PAINT} = int($self->{backgroundBasicColor});
        $itemColorFactory->{PAINT} = int($self->{foregroundBasicColor});
        $self->{gameInfo} = $gameInfo;
    return $self;
}


sub getLayerManager {
    my ($self) = @_;
        return $self;
}


sub init {
    my ($self) = @_;
}


sub getBackgroundBasicColor {
    my ($self) = @_;
        return $self->{backgroundBasicColor};
}


sub setBackgroundBasicColor {
    my ($self, $backgroundBasicColor) = @_;
        $self->{backgroundBasicColor} = $backgroundBasicColor;
        'org::allbinary::graphics::ItemColorFactory'->getInstance()->{INVERT_PAINT} = int($self->{backgroundBasicColor});
}


sub getForegroundBasicColor {
    my ($self) = @_;
        return $self->{foregroundBasicColor};
}


sub setForegroundBasicColor {
    my ($self, $foregroundBasicColor) = @_;
        $self->{foregroundBasicColor} = $foregroundBasicColor;
        'org::allbinary::graphics::ItemColorFactory'->getInstance()->{PAINT} = int($self->{foregroundBasicColor});
}


sub getGameInfo {
    my ($self) = @_;
        return $self->{gameInfo};
}


sub setGameInfo {
    my ($self, $gameInfo) = @_;
        $self->{gameInfo} = $gameInfo;
}


sub setLayerProcessorList {
    my ($self, $list) = @_;
        my $layerProcessorInterfaceArray = [(undef) x ($list->size())];
        my $size = scalar(@{$layerProcessorInterfaceArray});
        for (my $index = 0; $index < $size; $index++) {
            $layerProcessorInterfaceArray->[$index] = $list->{objectArray}->[$index];
        }
        $self->setLayerProcessorArray($layerProcessorInterfaceArray);
}


sub setPlayerGameInputCompositeInterface {
    my ($self, $playerGameInputCompositeInterface) = @_;
        $self->{playerGameInputCompositeInterface} = $playerGameInputCompositeInterface;
}


sub getPlayerGameInputCompositeInterface {
    my ($self) = @_;
        return $self->{playerGameInputCompositeInterface};
}

use org::allbinary::game::GameInfo;
use org::allbinary::game::input::NullPlayerGameInputComposite;
use org::allbinary::game::input::PlayerGameInputCompositeInterface;
use org::allbinary::graphics::ItemColorFactory;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::graphics::color::BasicColorFactory;
use org::allbinary::layer::AllBinaryLayerManager;
use org::allbinary::layer::LayerProcessor;
use org::allbinary::logic::NullUtil;
use org::allbinary::logic::math::SmallIntegerSingletonFactory;
use org::allbinary::util::BasicArrayList;

1;

