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

# Java interface
package org::allbinary::game::layer::PathFindingLayerInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::layer::waypoint::WaypointLayerInterface','org::allbinary::game::input::GameKeyEventSourceInterface','org::allbinary::game::identification::GroupInterfaceCompositeInterface','org::allbinary::game::combat::destroy::DestroyableInterface';



# throws Exception
sub getEndGeographicMapCellPositionList {
    my ($self) = @_;
    die "abstract method getEndGeographicMapCellPositionList";
}


sub shouldHandleStartSameAsEnd {
    my ($self) = @_;
    die "abstract method shouldHandleStartSameAsEnd";
}


sub getGeographicMapCellPositionArea {
    my ($self) = @_;
    die "abstract method getGeographicMapCellPositionArea";
}


sub getHudPaintable {
    my ($self) = @_;
    die "abstract method getHudPaintable";
}


# throws Exception
sub handleCost {
    my ($self, $ownerLayer) = @_;
    die "abstract method handleCost";
}


sub getParentLayer {
    my ($self) = @_;
    die "abstract method getParentLayer";
}


sub getRTSLayer2LogHelper {
    my ($self) = @_;
    die "abstract method getRTSLayer2LogHelper";
}


# throws Exception
sub setTarget {
    my ($self, $targetGameLayer) = @_;
    die "abstract method setTarget";
}

use org::allbinary::game::combat::destroy::DestroyableInterface;
use org::allbinary::game::identification::GroupInterfaceCompositeInterface;
use org::allbinary::game::input::GameKeyEventSourceInterface;
use org::allbinary::game::layer::waypoint::WaypointLayerInterface;
use org::allbinary::util::BasicArrayList;

1;

