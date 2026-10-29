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

package org::allbinary::game::layer::GeographicMapCellPositionAreaBase;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::layer::GeographicMapCellPositionAreaInterface';

our $NULL_GEOGRPAHIC_MAP_POSITION_AREA_BASE = 'org::allbinary::game::layer::GeographicMapCellPositionAreaBase'->new();

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getNextSurroundingGeographicMapCellPosition {
    my ($self) = @_;
        die ("RuntimeException");
}


sub getOccupyingGeographicMapCellPositionList {
    my ($self) = @_;
        die ("RuntimeException");
}


sub getSurroundingGeographicMapCellPositionList {
    my ($self) = @_;
        die ("RuntimeException");
}


# throws Exception
sub update {
    my ($self, $geographicMapInterface) = @_;
        die ("RuntimeException");
}

use org::allbinary::media::graphics::geography::map::BasicGeographicMap;
use org::allbinary::media::graphics::geography::map::GeographicMapCellPosition;
use org::allbinary::util::BasicArrayList;
use org::allbinary::game::layer::GeographicMapCellPositionAreaInterface;

1;

