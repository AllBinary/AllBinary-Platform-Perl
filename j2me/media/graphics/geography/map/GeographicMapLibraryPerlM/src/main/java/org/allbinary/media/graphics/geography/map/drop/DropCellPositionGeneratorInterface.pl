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
package org::allbinary::media::graphics::geography::map::drop::DropCellPositionGeneratorInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub getName {
    my ($self) = @_;
    die "abstract method getName";
}


# throws Exception
sub update {
    my ($self, $allBinaryGameLayerManager, $geographicMapInterface) = @_;
    die "abstract method update";
}


# throws Exception
sub processTick {
    my ($self, $allBinaryLayerManager) = @_;
    die "abstract method processTick";
}


# throws Exception
sub isDropAllowedAt {
    my ($self, $geographicMapCellPosition) = @_;
    die "abstract method isDropAllowedAt";
}

use org::allbinary::game::layer::AllBinaryGameLayerManager;
use org::allbinary::layer::AllBinaryLayerManager;
use org::allbinary::media::graphics::geography::map::BasicGeographicMap;
use org::allbinary::media::graphics::geography::map::GeographicMapCellPosition;

1;

