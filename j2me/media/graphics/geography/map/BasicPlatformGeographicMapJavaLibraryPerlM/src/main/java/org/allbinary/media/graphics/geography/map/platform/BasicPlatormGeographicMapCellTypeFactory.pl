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

package org::allbinary::media::graphics::geography::map::platform::BasicPlatormGeographicMapCellTypeFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::media::graphics::geography::map::GeographicMapCellTypeFactory';


sub _init_fields {
    my ($self) = @_;
    $self->{enumerationUtil} = 'org::allbinary::util::EnumerationUtil'->getInstance();
    $self->{BLOCK_CELL_TYPE} = undef;
    $self->{JUMP_THRU_CELL_TYPE} = undef;
    $self->{LADDER_CELL_TYPE} = undef;
    $self->{maxTileId} = undef;
}


sub new {
    my ($class, $tileTypeToTileIdsMap, $maxTileId) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
        $self->{logUtil}->putF($commonStrings->{START}, $self, $commonStrings->{INIT});
        $self->{maxTileId} = $maxTileId;
        'org::allbinary::media::graphics::geography::map::GeographicMapCellType'->new(0, 0);
        my $BLOCK_CELL_TYPE = 'org::allbinary::media::graphics::geography::map::platform::BasicPlatormGeographicMapCellType'->createType(1);
        my $JUMP_THRU_CELL_TYPE = $BLOCK_CELL_TYPE;
        my $LADDER_CELL_TYPE = $BLOCK_CELL_TYPE;
        my $PLATFORM = "Platform";
        my $JUMP_TRHU = "JumpThru";
        my $LADDER = "Ladder";
        my $enumeration = $tileTypeToTileIdsMap->keys();
        my $idsWithTypeList = undef;
        my $key = undef;
        my $basicPlatormGeographicMapCellType = undef;
        while ($self->{enumerationUtil}->hasMoreElements($enumeration)) {
            $key = $self->{enumerationUtil}->nextElement($enumeration);
            $self->{logUtil}->putF($key, $self, $commonStrings->{INIT});
            $idsWithTypeList = $tileTypeToTileIdsMap->get($key);
            $basicPlatormGeographicMapCellType = 'org::allbinary::media::graphics::geography::map::platform::BasicPlatormGeographicMapCellType'->new($idsWithTypeList);
            if (($key eq $PLATFORM)) {
                $BLOCK_CELL_TYPE = $basicPlatormGeographicMapCellType;
            }
            if (($key eq $JUMP_TRHU)) {
                $JUMP_THRU_CELL_TYPE = $basicPlatormGeographicMapCellType;
            }
            if (($key eq $LADDER)) {
                $LADDER_CELL_TYPE = $basicPlatormGeographicMapCellType;
            }
        }
        $self->{BLOCK_CELL_TYPE} = $BLOCK_CELL_TYPE;
        $self->{JUMP_THRU_CELL_TYPE} = $JUMP_THRU_CELL_TYPE;
        $self->{LADDER_CELL_TYPE} = $LADDER_CELL_TYPE;
        'org::allbinary::media::graphics::geography::map::GeographicMapCellType'->new($self->{maxTileId} - 1, 0);
        'org::allbinary::media::graphics::geography::map::GeographicMapCellType'->new($self->{maxTileId} - 2, 0);
    return $self;
}


sub getStartType {
    my ($self) = @_;
        return $self->{maxTileId} - 1;
}


sub getEndType {
    my ($self) = @_;
        return $self->{maxTileId} - 2;
}


sub getEmptyType {
    my ($self) = @_;
        return 0;
}


sub isPath {
    my ($self, $cellType) = @_;
        if ($cellType->getType() == 0) {
            return 1;
        }
        return 0;
}

use java::util::Enumeration;
use org::allbinary::string::CommonStrings;
use org::allbinary::media::graphics::geography::map::GeographicMapCellType;
use org::allbinary::media::graphics::geography::map::GeographicMapCellTypeFactory;
use org::allbinary::util::ABHashtable;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::EnumerationUtil;
use org::allbinary::media::graphics::geography::map::platform::BasicPlatormGeographicMapCellType;

1;

