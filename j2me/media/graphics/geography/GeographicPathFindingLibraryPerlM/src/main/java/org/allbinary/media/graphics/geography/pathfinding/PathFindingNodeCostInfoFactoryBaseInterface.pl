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
package org::allbinary::media::graphics::geography::pathfinding::PathFindingNodeCostInfoFactoryBaseInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



# throws Exception
sub create {
    my ($self, $geographicMapInterface, $comingFromGeographicMapCellPosition, $geographicMapCellPosition, $costFromStart, $costToEnd) = @_;
    die "abstract method create";
}


# throws Exception
sub getTotalCost {
    my ($self, $geographicMapInterface, $comingFromGeographicMapCellPosition, $geographicMapCellPosition) = @_;
    die "abstract method getTotalCost";
}

use org::allbinary::media::graphics::geography::map::BasicGeographicMap;
use org::allbinary::media::graphics::geography::map::GeographicMapCellPosition;

1;

