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

# Java interface
package org::allbinary::game::layer::AdvancedRTSPlayerLayerInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::layer::RTSPlayerLayerInterface';



sub getAdvancedPlayerOwnedRTSLayers {
    my ($self) = @_;
    die "abstract method getAdvancedPlayerOwnedRTSLayers";
}


sub isLocalPlayer {
    my ($self) = @_;
    die "abstract method isLocalPlayer";
}


sub getGameType {
    my ($self) = @_;
    die "abstract method getGameType";
}


sub getDecalBasicColor {
    my ($self) = @_;
    die "abstract method getDecalBasicColor";
}

use org::allbinary::game::GameType;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::game::layer::RTSPlayerLayerInterface;

1;

