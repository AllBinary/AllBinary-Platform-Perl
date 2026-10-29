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

# Java interface
package org::allbinary::game::behavior::topview::TopViewCharacterInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub terrainMove {
    my ($self, $geographicMapInterfaceArray, $geographicMapCellTypeArray, $x, $y) = @_;
    die "abstract method terrainMove";
}


# throws Exception
sub terrainEvent {
    my ($self, $x, $y, $geographicMapInterfaceArray, $geographicMapCellTypeArray, $geographicMapCellPosition) = @_;
    die "abstract method terrainEvent";
}


sub move {
    my ($self) = @_;
    die "abstract method move";
}


sub upp {
    my ($self) = @_;
    die "abstract method upp";
}


sub leftp {
    my ($self) = @_;
    die "abstract method leftp";
}


sub rightp {
    my ($self) = @_;
    die "abstract method rightp";
}


# throws Exception
sub reset {
    my ($self) = @_;
    die "abstract method reset";
}

use org::allbinary::media::graphics::geography::map::BasicGeographicMap;
use org::allbinary::media::graphics::geography::map::GeographicMapCellPosition;
use org::allbinary::media::graphics::geography::map::GeographicMapCellType;

1;

