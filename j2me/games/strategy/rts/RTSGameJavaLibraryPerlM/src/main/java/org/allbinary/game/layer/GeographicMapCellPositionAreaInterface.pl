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

# Java interface
package org::allbinary::game::layer::GeographicMapCellPositionAreaInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub getNextSurroundingGeographicMapCellPosition {
    my ($self) = @_;
    die "abstract method getNextSurroundingGeographicMapCellPosition";
}


sub getOccupyingGeographicMapCellPositionList {
    my ($self) = @_;
    die "abstract method getOccupyingGeographicMapCellPositionList";
}


sub getSurroundingGeographicMapCellPositionList {
    my ($self) = @_;
    die "abstract method getSurroundingGeographicMapCellPositionList";
}


# throws Exception
sub update {
    my ($self, $geographicMapInterface) = @_;
    die "abstract method update";
}

use org::allbinary::media::graphics::geography::map::BasicGeographicMap;
use org::allbinary::media::graphics::geography::map::GeographicMapCellPosition;
use org::allbinary::util::BasicArrayList;

1;

