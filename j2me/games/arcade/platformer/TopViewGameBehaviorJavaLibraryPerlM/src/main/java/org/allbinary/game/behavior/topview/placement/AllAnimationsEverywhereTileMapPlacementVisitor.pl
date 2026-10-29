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

package org::allbinary::game::behavior::topview::placement::AllAnimationsEverywhereTileMapPlacementVisitor;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::behavior::topview::placement::TileMapPlacementVisitor';


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    return $self;
}


sub visit {
    my ($self, $lastMap, $mapData) = @_;
        my $size = scalar(@{$mapData});
        my $size2 = scalar(@{$mapData->[0]}) - 7;
        for (my $index = 0; $index < $size; $index++) {
            for (my $index2 = 0; $index2 < $size2; $index2 += 7) {
                $mapData->[$index]->[$index2] = 1;
                $mapData->[$index]->[$index2 + 1] = 17;
                $mapData->[$index]->[$index2 + 2] = 33;
                $mapData->[$index]->[$index2 + 3] = 49;
                $mapData->[$index]->[$index2 + 4] = 65;
                $mapData->[$index]->[$index2 + 5] = 81;
                $mapData->[$index]->[$index2 + 6] = 97;
            }
        }
}

use org::mapeditor::core::TiledMap;
use org::allbinary::game::behavior::topview::placement::TileMapPlacementVisitor;

1;

