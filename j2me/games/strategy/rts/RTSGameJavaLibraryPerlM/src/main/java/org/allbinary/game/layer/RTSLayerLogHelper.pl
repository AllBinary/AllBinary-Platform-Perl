# 
# AllBinary Open License Version 1 
# Copyright (c) 2022 AllBinary 
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

package org::allbinary::game::layer::RTSLayerLogHelper;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::game::layer::RTSLayerLogHelper'->new();

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::layer::RTSLayerLogHelper::instance;
}


sub setClosestGeographicMapCellHistory {
    my ($self, $associatedAdvancedRTSGameLayer, $pathsList) = @_;
}


sub trackTo {
    my ($self, $associatedAdvancedRTSGameLayer, $nextUnvisitedPathGeographicMapCellPosition, $dx, $dy, $reason) = @_;
}


sub turnTo {
    my ($self, $associatedAdvancedRTSGameLayer, $dx, $dy, $angleInfo, $angle, $movementAngle, $evading, $targetAngle) = @_;
}


sub doneMoving {
    my ($self, $associatedAdvancedRTSGameLayer) = @_;
}


sub closeEnough {
    my ($self, $associatedAdvancedRTSGameLayer) = @_;
}


sub movingLeft {
    my ($self, $associatedAdvancedRTSGameLayer) = @_;
}


sub movingRight {
    my ($self, $associatedAdvancedRTSGameLayer) = @_;
}


sub movingUp {
    my ($self, $associatedAdvancedRTSGameLayer) = @_;
}


sub movingDown {
    my ($self, $associatedAdvancedRTSGameLayer) = @_;
}


sub currentMoveEnded {
    my ($self, $associatedAdvancedRTSGameLayer) = @_;
}


sub evade {
    my ($self, $associatedAdvancedRTSGameLayer) = @_;
}


sub rotateLeft {
    my ($self, $associatedAdvancedRTSGameLayer) = @_;
}


sub rotateRight {
    my ($self, $associatedAdvancedRTSGameLayer) = @_;
}


sub handle {
    my ($self, $associatedAdvancedRTSGameLayer, $movementAngle) = @_;
}


sub noRotation {
    my ($self, $associatedAdvancedRTSGameLayer) = @_;
}


sub notOnPath {
    my ($self, $associatedAdvancedRTSGameLayer, $geographicMapCellHistory, $currentGeographicMapCellPosition, $pathList) = @_;
}

use org::allbinary::math::AngleInfo;
use org::allbinary::math::NamedAngle;
use org::allbinary::media::graphics::geography::map::GeographicMapCellHistory;
use org::allbinary::media::graphics::geography::map::GeographicMapCellPosition;
use org::allbinary::util::BasicArrayList;

1;

