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
package org::allbinary::media::graphics::geography::pathfinding::PathFindingNodeCostInfoFactoryInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::media::graphics::geography::pathfinding::PathFindingNodeCostInfoFactoryBaseInterface';



# throws Exception
sub getInstance_j4 {
    my ($self, $comingFromGeographicMapCellPosition, $geographicMapCellPosition, $costFromStart, $costToEnd) = @_;
    die "abstract method getInstance";
}


sub getInstance_j2 {
    my ($self, $comingFromGeographicMapCellPosition, $geographicMapCellPosition) = @_;
    die "abstract method getInstance";
}

sub getInstance {
    my ($invocant, @arguments) = @_;
    return $invocant->getInstance_j4(@arguments) if scalar(@arguments) == 4;
    return $invocant->getInstance_j2(@arguments) if scalar(@arguments) == 2;
    die "No method getInstance takes " . scalar(@arguments) . " arguments";
}


sub getTotalCost {
    my ($self, $comingFromGeographicMapCellPosition, $geographicMapCellPosition) = @_;
    die "abstract method getTotalCost";
}

use org::allbinary::media::graphics::geography::map::GeographicMapCellPosition ();

1;

