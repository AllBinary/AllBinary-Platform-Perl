# 
# AllBinary Open License Version 1 
# Copyright (c) 2025 AllBinary 
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

package org::allbinary::game::layer::NullRTSLayer;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::layer::NullPathFindingLayer','org::allbinary::game::layer::RTSPlayerLayerInterface';

our $NULL_RTS_LAYER = 'org::allbinary::game::layer::NullRTSLayer'->new();

sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    return $self;
}


sub getName {
    my ($self) = @_;
        die ("RuntimeException");
}


# throws Exception
sub processInput {
    my ($self, $layerManager) = @_;
        die ("RuntimeException");
}


sub initInputProcessors {
    my ($self) = @_;
        die ("RuntimeException");
}


sub getGameNotificationHud {
    my ($self) = @_;
        die ("RuntimeException");
}


sub getCurrentScrollSelectionForm {
    my ($self) = @_;
        die ("RuntimeException");
}


sub setCurrentScrollSelectionForm {
    my ($self, $currentScrollSelectionForm) = @_;
        die ("RuntimeException");
}


sub getBuildingScrollSelectionForm {
    my ($self) = @_;
        die ("RuntimeException");
}


sub getPlayerGameInput {
    my ($self) = @_;
        die ("RuntimeException");
}


sub onEvent {
    my ($self, $eventObject) = @_;
        die ("RuntimeException");
}


# throws Exception
sub onDestroyed {
    my ($self, $destroyedEvent) = @_;
        die ("RuntimeException");
}


# throws Exception
sub processTick {
    my ($self, $allBinaryLayerManager) = @_;
        die ("RuntimeException");
}


sub getCapital {
    my ($self) = @_;
        die ("RuntimeException");
}


sub getRTSFormInput {
    my ($self) = @_;
        return 'org::allbinary::game::input::form::NullRTSFormInputFactory'->getInstance();
}


sub add {
    my ($self, $sound) = @_;
        die ("RuntimeException");
}


sub getPlayerOwnedRTSLayers {
    my ($self) = @_;
        die ("RuntimeException");
}


sub implmentsArtificialIntelligenceCompositeInterface {
    my ($self) = @_;
        die ("RuntimeException");
}

use org::allbinary::game::ag::layer::hud::basic::notification::GameNotificationHud;
use org::allbinary::game::combat::destroy::event::DestroyedEvent;
use org::allbinary::game::input::PlayerGameInput;
use org::allbinary::game::input::form::NullRTSFormInputFactory;
use org::allbinary::game::input::form::RTSFormInput;
use org::allbinary::game::layer::capital::Capital;
use org::allbinary::graphics::form::ScrollSelectionForm;
use org::allbinary::layer::AllBinaryLayerManager;
use org::allbinary::logic::util::event::AllBinaryEventObject;
use org::allbinary::media::audio::Sound;
use org::allbinary::game::layer::NullPathFindingLayer;
use org::allbinary::game::layer::RTSPlayerLayerInterface;

1;

