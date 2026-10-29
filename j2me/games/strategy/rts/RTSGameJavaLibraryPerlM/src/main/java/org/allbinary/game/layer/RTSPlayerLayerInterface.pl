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

# Java interface
package org::allbinary::game::layer::RTSPlayerLayerInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::ag::layer::hud::basic::notification::GameNotificationHudCompositeInterface','org::allbinary::game::input::BuildMenuCompositeInterface','org::allbinary::game::input::PlayerGameInputCompositeInterface','org::allbinary::game::combat::destroy::event::DestroyedEventListenerInterface','org::allbinary::game::tick::TickableInterface','org::allbinary::game::layer::PathFindingLayerInterface';



sub getCapital {
    my ($self) = @_;
    die "abstract method getCapital";
}


sub getRTSFormInput {
    my ($self) = @_;
    die "abstract method getRTSFormInput";
}


sub add {
    my ($self, $sound) = @_;
    die "abstract method add";
}


sub getPlayerOwnedRTSLayers {
    my ($self) = @_;
    die "abstract method getPlayerOwnedRTSLayers";
}


sub implmentsArtificialIntelligenceCompositeInterface {
    my ($self) = @_;
    die "abstract method implmentsArtificialIntelligenceCompositeInterface";
}

use org::allbinary::game::ag::layer::hud::basic::notification::GameNotificationHudCompositeInterface;
use org::allbinary::game::input::BuildMenuCompositeInterface;
use org::allbinary::game::input::form::RTSFormInput;
use org::allbinary::game::layer::capital::Capital;
use org::allbinary::game::combat::destroy::event::DestroyedEventListenerInterface;
use org::allbinary::game::input::PlayerGameInputCompositeInterface;
use org::allbinary::game::tick::TickableInterface;
use org::allbinary::media::audio::Sound;
use org::allbinary::game::layer::PathFindingLayerInterface;

1;

