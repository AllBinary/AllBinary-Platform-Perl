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

package org::allbinary::media::graphics::geography::pathfinding::PathFindingNodeCostInfoFactoryBase;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::media::graphics::geography::pathfinding::PathFindingNodeCostInfoFactoryBaseInterface';

our $NULL_PATH_FINDING_NODE_COST_INFO_FACTORY_BASE = 'org::allbinary::media::graphics::geography::pathfinding::PathFindingNodeCostInfoFactoryBase'->new();

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


# throws Exception
sub create {
    my ($self, $geographicMapInterface, $comingFromGeographicMapCellPosition, $geographicMapCellPosition, $costFromStart, $costToEnd) = @_;
        die ("RuntimeException");
}


# throws Exception
sub getTotalCost {
    my ($self, $geographicMapInterface, $comingFromGeographicMapCellPosition, $geographicMapCellPosition) = @_;
        die ("RuntimeException");
}

use org::allbinary::media::graphics::geography::map::BasicGeographicMap;
use org::allbinary::media::graphics::geography::map::GeographicMapCellPosition;
use org::allbinary::media::graphics::geography::pathfinding::PathFindingNodeCostInfoFactoryBaseInterface;

1;

