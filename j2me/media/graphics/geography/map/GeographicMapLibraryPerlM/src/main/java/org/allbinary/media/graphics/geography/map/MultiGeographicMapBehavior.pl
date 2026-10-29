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

package org::allbinary::media::graphics::geography::map::MultiGeographicMapBehavior;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


# throws Exception
sub getCellTypeAt {
    my ($self, $geographicMapInterfaceArray, $geographicMapCellTypeArray, $geographicMapCellPosition) = @_;
        my $size = scalar(@{$geographicMapInterfaceArray});
        my $cellType = $org::allbinary::media::graphics::geography::map::GeographicMapCellType::NULL_GEOGRAPHIC_MAP_CELL_TYPE;
        for (my $index = $size; --$index >= 0; ) {
            $cellType = $geographicMapInterfaceArray->[$index]->getCellTypeAt($geographicMapCellPosition);
            $geographicMapCellTypeArray->[$index] = $cellType;
        }
        return $geographicMapCellTypeArray;
}

use org::allbinary::media::graphics::geography::map::GeographicMapCellType;

1;

