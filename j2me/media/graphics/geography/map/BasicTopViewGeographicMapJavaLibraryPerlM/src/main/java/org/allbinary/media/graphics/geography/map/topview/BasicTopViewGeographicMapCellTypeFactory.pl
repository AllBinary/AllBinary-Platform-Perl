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

package org::allbinary::media::graphics::geography::map::topview::BasicTopViewGeographicMapCellTypeFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::media::graphics::geography::map::GeographicMapCellTypeFactory';


sub _init_fields {
    my ($self) = @_;
    $self->{BLOCK_CELL_TYPE} = undef;
    $self->{OFF_MAP_CELL_TYPE} = undef;
    $self->{FLOOR_CELL_TYPE} = undef;
    $self->{DOOR_CELL_TYPE} = undef;
    $self->{STAIRS_UP_CELL_TYPE} = undef;
    $self->{STAIRS_DOWN_CELL_TYPE} = undef;
    $self->{OTHER_CELL_TYPE} = undef;
    $self->{maxTileId} = undef;
}


sub new {
    my ($class, $tileTypeToTileIdsMap, $maxTileId) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
        $self->{logUtil}->putF($commonStrings->{START}, $self, $commonStrings->{CONSTRUCTOR});
        $self->{maxTileId} = $maxTileId;
        my $basicTopViewGeographicMapStrings = 'org::allbinary::media::graphics::geography::map::topview::BasicTopViewGeographicMapStrings'->getInstance();
        my $geographicMapCellTypeFactory = 'org::allbinary::media::graphics::geography::map::GeographicMapCellTypeFactory'->getInstance();
        my $geographicMapCellTypeArray = $geographicMapCellTypeFactory->getGeographicMapCellTypeArray();
        my $type = 0;
        if (!defined($geographicMapCellTypeArray->[$type])) {
            'org::allbinary::media::graphics::geography::map::racetrack::RaceTrackGeographicMapCellType'->new('org::allbinary::string::CommonStrings'->getInstance()->{UNKNOWN}, $type, 999, 0);
        } else {
        }
        my $BLOCK_CELL_TYPE = 'org::allbinary::media::graphics::geography::map::topview::BasicTopViewGeographicMapCellType'->createType($basicTopViewGeographicMapStrings->{DEFAULT}, 1, 1);
        my $OFF_MAP_CELL_TYPE = $BLOCK_CELL_TYPE;
        my $FLOOR_CELL_TYPE = $BLOCK_CELL_TYPE;
        my $DOOR_CELL_TYPE = $BLOCK_CELL_TYPE;
        my $STAIRS_UP_CELL_TYPE = $BLOCK_CELL_TYPE;
        my $STAIRS_DOWN_CELL_TYPE = $BLOCK_CELL_TYPE;
        my $OTHER_CELL_TYPE = $BLOCK_CELL_TYPE;
        my $keyArray = 'org::allbinary::util::HashtableUtil'->getInstance()->getKeysAsArray($tileTypeToTileIdsMap);
        my $size = scalar(@{$keyArray});
        my $idsWithTypeList = undef;
        my $key = undef;
        my $basicPlatormGeographicMapCellType = undef;
        for (my $index = 0; $index < $size; $index++) {
            $key = $keyArray->[$index];
            $idsWithTypeList = $tileTypeToTileIdsMap->get($key);
            if (($key eq $basicTopViewGeographicMapStrings->{WALL})) {
                $basicPlatormGeographicMapCellType = 'org::allbinary::media::graphics::geography::map::topview::BasicTopViewGeographicMapCellType'->new($basicTopViewGeographicMapStrings->{WALL}, $idsWithTypeList, 1000);
                $BLOCK_CELL_TYPE = $basicPlatormGeographicMapCellType;
            } elsif (($key eq $basicTopViewGeographicMapStrings->{OFF_MAP})) {
                $basicPlatormGeographicMapCellType = 'org::allbinary::media::graphics::geography::map::topview::BasicTopViewGeographicMapCellType'->new($basicTopViewGeographicMapStrings->{OFF_MAP}, $idsWithTypeList, 1001);
                $OFF_MAP_CELL_TYPE = $basicPlatormGeographicMapCellType;
            } elsif (($key eq $basicTopViewGeographicMapStrings->{FLOOR})) {
                $basicPlatormGeographicMapCellType = 'org::allbinary::media::graphics::geography::map::topview::BasicTopViewGeographicMapCellType'->new($basicTopViewGeographicMapStrings->{FLOOR}, $idsWithTypeList, 1);
                $FLOOR_CELL_TYPE = $basicPlatormGeographicMapCellType;
            } elsif (($key eq $basicTopViewGeographicMapStrings->{DOOR})) {
                $basicPlatormGeographicMapCellType = 'org::allbinary::media::graphics::geography::map::topview::BasicTopViewGeographicMapCellType'->new($basicTopViewGeographicMapStrings->{DOOR}, $idsWithTypeList, 1);
                $DOOR_CELL_TYPE = $basicPlatormGeographicMapCellType;
            } elsif (($key eq $basicTopViewGeographicMapStrings->{STAIRS_UP})) {
                $basicPlatormGeographicMapCellType = 'org::allbinary::media::graphics::geography::map::topview::BasicTopViewGeographicMapCellType'->new($basicTopViewGeographicMapStrings->{STAIRS_UP}, $idsWithTypeList, 1);
                $STAIRS_UP_CELL_TYPE = $basicPlatormGeographicMapCellType;
            } elsif (($key eq $basicTopViewGeographicMapStrings->{STAIRS_DOWN})) {
                $basicPlatormGeographicMapCellType = 'org::allbinary::media::graphics::geography::map::topview::BasicTopViewGeographicMapCellType'->new($basicTopViewGeographicMapStrings->{STAIRS_DOWN}, $idsWithTypeList, 1);
                $STAIRS_DOWN_CELL_TYPE = $basicPlatormGeographicMapCellType;
            } elsif (($key eq $basicTopViewGeographicMapStrings->{OTHER})) {
                $basicPlatormGeographicMapCellType = 'org::allbinary::media::graphics::geography::map::topview::BasicTopViewGeographicMapCellType'->new($basicTopViewGeographicMapStrings->{OTHER}, $idsWithTypeList, 1);
                $OTHER_CELL_TYPE = $basicPlatormGeographicMapCellType;
            }
        }
        $self->{BLOCK_CELL_TYPE} = $BLOCK_CELL_TYPE;
        $self->{OFF_MAP_CELL_TYPE} = $OFF_MAP_CELL_TYPE;
        $self->{FLOOR_CELL_TYPE} = $FLOOR_CELL_TYPE;
        $self->{DOOR_CELL_TYPE} = $DOOR_CELL_TYPE;
        $self->{STAIRS_UP_CELL_TYPE} = $STAIRS_UP_CELL_TYPE;
        $self->{STAIRS_DOWN_CELL_TYPE} = $STAIRS_DOWN_CELL_TYPE;
        $self->{OTHER_CELL_TYPE} = $OTHER_CELL_TYPE;
        $type = $self->{maxTileId} - 1;
        if (!defined($geographicMapCellTypeArray->[$type])) {
            'org::allbinary::media::graphics::geography::map::racetrack::RaceTrackGeographicMapCellType'->new($commonStrings->{START}, $type, 1, 0);
        } else {
        }
        $type = $self->{maxTileId} - 2;
        if (!defined($geographicMapCellTypeArray->[$type])) {
            'org::allbinary::media::graphics::geography::map::racetrack::RaceTrackGeographicMapCellType'->new($commonStrings->{START}, $type, 1, 0);
        } else {
        }
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
        return $self->{FLOOR_CELL_TYPE}->getTypes()->[0];
}


sub isPath {
    my ($self, $cellType) = @_;
        if ($self->{FLOOR_CELL_TYPE}->isType($cellType)) {
            return 1;
        }
        return 0;
}


sub toString {
    my ($self) = @_;
        return 'org::allbinary::logic::string::StringMaker'->new()->append("key: WALL/BLOCK_CELL_TYPE: ")->append($self->{BLOCK_CELL_TYPE}->toString())->append("key: FLOOR_CELL_TYPE: ")->append($self->{FLOOR_CELL_TYPE}->toString())->append("key: OTHER_CELL_TYPE: ")->append($self->{OTHER_CELL_TYPE}->toString())->append("key: OFF_MAP_CELL_TYPE: ")->append($self->{OFF_MAP_CELL_TYPE}->toString())->append("key: DOOR_CELL_TYPE: ")->append($self->{DOOR_CELL_TYPE}->toString())->append("key: STAIRS_DOWN_CELL_TYPE: ")->append($self->{STAIRS_DOWN_CELL_TYPE}->toString())->append("key: STAIRS_UP_CELL_TYPE: ")->append($self->{STAIRS_UP_CELL_TYPE}->toString())->toString();
}

use org::allbinary::string::CommonStrings;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::media::graphics::geography::map::GeographicMapCellType;
use org::allbinary::media::graphics::geography::map::GeographicMapCellTypeFactory;
use org::allbinary::media::graphics::geography::map::racetrack::RaceTrackGeographicMapCellType;
use org::allbinary::util::ABHashtable;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::HashtableUtil;
use org::allbinary::media::graphics::geography::map::topview::BasicTopViewGeographicMapStrings;
use org::allbinary::media::graphics::geography::map::topview::BasicTopViewGeographicMapCellType;

1;

