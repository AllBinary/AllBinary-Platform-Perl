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

package org::allbinary::game::behavior::topview::TopViewCharacterBehavior;
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
sub terrainEvent {
    my ($self, $layer, $direction, $x, $y, $geographicMapInterfaceArray, $geographicMapCellPosition) = @_;
}


sub terrainMove {
    my ($self, $layer, $geographicMapInterfaceArray, $x, $y) = @_;
}


sub hasSolidBlock {
    my ($self, $geographicMapInterfaceArray, $geographicMapCellTypeArray) = @_;
        my $size = scalar(@{$geographicMapInterfaceArray});
        my $basicTopViewGeographicMapCellTypeFactory = undef;
        for (my $index = 0; $index < $size; $index++) {
            $basicTopViewGeographicMapCellTypeFactory = $geographicMapInterfaceArray->[$index]->getGeographicMapCellTypeFactory();
            if ($basicTopViewGeographicMapCellTypeFactory->{BLOCK_CELL_TYPE}->isType($geographicMapCellTypeArray->[$index])) {
                return 1;
            }
        }
        return 0;
}

use org::allbinary::direction::Direction;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::media::graphics::geography::map::BasicGeographicMap;
use org::allbinary::media::graphics::geography::map::GeographicMapCellPosition;
use org::allbinary::media::graphics::geography::map::GeographicMapCellType;
use org::allbinary::media::graphics::geography::map::topview::BasicTopViewGeographicMapCellTypeFactory;

1;

