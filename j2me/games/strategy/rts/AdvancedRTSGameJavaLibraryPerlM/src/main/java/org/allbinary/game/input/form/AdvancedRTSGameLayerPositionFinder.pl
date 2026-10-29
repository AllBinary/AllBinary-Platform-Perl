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

package org::allbinary::game::input::form::AdvancedRTSGameLayerPositionFinder;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::input::LayerPositionFinderInterface';

our $instance = 'org::allbinary::game::input::form::AdvancedRTSGameLayerPositionFinder'->new();


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::input::form::AdvancedRTSGameLayerPositionFinder::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getLayerInterface {
    my ($self, $geographicMapCellPosition) = @_;
        my $layerInterface = 'org::allbinary::media::graphics::geography::map::drop::DropCellPositionHistory'->getInstance()->getLayerInterface($geographicMapCellPosition);
        if ($layerInterface == $org::allbinary::layer::AllBinaryLayer::NULL_ALLBINARY_LAYER) {
            $layerInterface = 'org::allbinary::game::layer::waypoint::WaypointCellPositionHistory'->getInstance()->getLayerInterface($geographicMapCellPosition);
        }
        return $layerInterface;
}

use org::allbinary::game::input::LayerPositionFinderInterface;
use org::allbinary::game::layer::waypoint::WaypointCellPositionHistory;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::media::graphics::geography::map::GeographicMapCellPosition;
use org::allbinary::media::graphics::geography::map::drop::DropCellPositionHistory;

1;

