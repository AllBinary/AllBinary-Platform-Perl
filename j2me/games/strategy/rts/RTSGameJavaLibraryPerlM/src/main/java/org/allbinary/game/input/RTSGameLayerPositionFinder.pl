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

package org::allbinary::game::input::RTSGameLayerPositionFinder;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::input::LayerPositionFinderInterface';

our $instance = 'org::allbinary::game::input::RTSGameLayerPositionFinder'->new();


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::input::RTSGameLayerPositionFinder::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getLayerInterface {
    my ($self, $geographicMapCellPosition) = @_;
        return 'org::allbinary::media::graphics::geography::map::drop::DropCellPositionHistory'->getInstance()->getLayerInterface($geographicMapCellPosition);
}

use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::media::graphics::geography::map::GeographicMapCellPosition;
use org::allbinary::media::graphics::geography::map::drop::DropCellPositionHistory;
use org::allbinary::game::input::LayerPositionFinderInterface;

1;

