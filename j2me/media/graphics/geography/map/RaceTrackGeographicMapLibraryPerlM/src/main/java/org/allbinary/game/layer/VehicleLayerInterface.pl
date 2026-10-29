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

# Java interface
package org::allbinary::game::layer::VehicleLayerInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::layer::LayerInterface','org::allbinary::game::layer::VehiclePropertiesCompositeInterface';



sub getGameKeyEventList {
    my ($self) = @_;
    die "abstract method getGameKeyEventList";
}


sub getSpeedBasicDecimal {
    my ($self) = @_;
    die "abstract method getSpeedBasicDecimal";
}


sub isReadyForExplosion {
    my ($self) = @_;
    die "abstract method isReadyForExplosion";
}


sub getRotationAnimationInterface {
    my ($self) = @_;
    die "abstract method getRotationAnimationInterface";
}


sub setRotationAnimationInterface {
    my ($self, $animationInterface) = @_;
    die "abstract method setRotationAnimationInterface";
}


sub isDestroyed {
    my ($self) = @_;
    die "abstract method isDestroyed";
}


sub isFinish {
    my ($self) = @_;
    die "abstract method isFinish";
}


sub getFinalPosition {
    my ($self) = @_;
    die "abstract method getFinalPosition";
}


# throws Exception
sub handleFinish {
    my ($self) = @_;
    die "abstract method handleFinish";
}


sub getGeographicMapCellPositionTracking {
    my ($self) = @_;
    die "abstract method getGeographicMapCellPositionTracking";
}


sub getGeographicMapCellHistoryArray {
    my ($self) = @_;
    die "abstract method getGeographicMapCellHistoryArray";
}


sub setGeographicMapCellHistoryArray {
    my ($self, $geographicMapCellHistory) = @_;
    die "abstract method setGeographicMapCellHistoryArray";
}

use org::allbinary::util::BasicArrayList;
use org::allbinary::animation::RotationAnimation;
use org::allbinary::layer::LayerInterface;
use org::allbinary::logic::math::BasicDecimal;
use org::allbinary::media::graphics::geography::map::GeographicMapCellHistory;
use org::allbinary::media::graphics::geography::map::GeographicMapCellPositionTracking;
use org::allbinary::game::layer::VehiclePropertiesCompositeInterface;

1;

