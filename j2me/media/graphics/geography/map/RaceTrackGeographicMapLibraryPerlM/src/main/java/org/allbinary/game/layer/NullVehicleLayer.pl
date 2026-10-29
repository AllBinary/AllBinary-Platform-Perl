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

package org::allbinary::game::layer::NullVehicleLayer;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::layer::VehicleLayerInterface';

our $NULL_VEHICLE_LAYER = 'org::allbinary::game::layer::NullVehicleLayer'->new();

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getName {
    my ($self) = @_;
        die ("RuntimeException");
}


sub getGroupInterface {
    my ($self) = @_;
        die ("RuntimeException");
}


sub setPosition {
    my ($self, $x, $y, $z) = @_;
        die ("RuntimeException");
}


sub getHeight {
    my ($self) = @_;
        die ("RuntimeException");
}


sub getWidth {
    my ($self) = @_;
        die ("RuntimeException");
}


sub getHalfHeight {
    my ($self) = @_;
        die ("RuntimeException");
}


sub getHalfWidth {
    my ($self) = @_;
        die ("RuntimeException");
}


sub getXP {
    my ($self) = @_;
        die ("RuntimeException");
}


sub getYP {
    my ($self) = @_;
        die ("RuntimeException");
}


sub getZP {
    my ($self) = @_;
        die ("RuntimeException");
}


sub getX2 {
    my ($self) = @_;
        die ("RuntimeException");
}


sub getY2 {
    my ($self) = @_;
        die ("RuntimeException");
}


sub getZ2 {
    my ($self) = @_;
        die ("RuntimeException");
}


sub isVisible {
    my ($self) = @_;
        die ("RuntimeException");
}


sub moveDXYZ {
    my ($self, $dx, $dy, $dz) = @_;
        die ("RuntimeException");
}


sub setVisible {
    my ($self, $visible) = @_;
        die ("RuntimeException");
}


sub implmentsTickableInterface {
    my ($self) = @_;
        die ("RuntimeException");
}


sub implmentsCollidableInterface {
    my ($self) = @_;
        die ("RuntimeException");
}


sub implmentsGameInputInterface {
    my ($self) = @_;
        die ("RuntimeException");
}


sub implmentsArtificialIntelligenceCompositeInterface {
    my ($self) = @_;
        die ("RuntimeException");
}


sub getType {
    my ($self) = @_;
        die ("RuntimeException");
}


sub getVehicleProperties {
    my ($self) = @_;
        die ("RuntimeException");
}


sub getGameKeyEventList {
    my ($self) = @_;
        die ("RuntimeException");
}


sub getSpeedBasicDecimal {
    my ($self) = @_;
        die ("RuntimeException");
}


sub isReadyForExplosion {
    my ($self) = @_;
        die ("RuntimeException");
}


sub getRotationAnimationInterface {
    my ($self) = @_;
        die ("RuntimeException");
}


sub setRotationAnimationInterface {
    my ($self, $animationInterface) = @_;
        die ("RuntimeException");
}


sub isDestroyed {
    my ($self) = @_;
        die ("RuntimeException");
}


sub isFinish {
    my ($self) = @_;
        die ("RuntimeException");
}


sub getFinalPosition {
    my ($self) = @_;
        die ("RuntimeException");
}


# throws Exception
sub handleFinish {
    my ($self) = @_;
        die ("RuntimeException");
}


sub getGeographicMapCellPositionTracking {
    my ($self) = @_;
        die ("RuntimeException");
}


sub getGeographicMapCellHistoryArray {
    my ($self) = @_;
        die ("RuntimeException");
}


sub setGeographicMapCellHistoryArray {
    my ($self, $geographicMapCellHistory) = @_;
        die ("RuntimeException");
}


sub paint {
    my ($self, $graphics) = @_;
}


sub paintThreed {
    my ($self, $graphics) = @_;
}

# use javax::microedition::lcdui::Graphics;
use org::allbinary::animation::RotationAnimation;
use org::allbinary::game::identification::Group;
use org::allbinary::logic::math::BasicDecimal;
use org::allbinary::media::graphics::geography::map::GeographicMapCellHistory;
use org::allbinary::media::graphics::geography::map::GeographicMapCellPositionTracking;
use org::allbinary::util::BasicArrayList;
use org::allbinary::game::layer::VehicleLayerInterface;

1;

