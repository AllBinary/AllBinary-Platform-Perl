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

package org::allbinary::media::graphics::geography::map::racetrack::drop::RaceTrackDropCellPositionGenerator;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::media::graphics::geography::map::drop::BaseDropCellPositionGenerator';


sub _init_fields {
    my ($self) = @_;
    $self->{list} = 'org::allbinary::util::BasicArrayListD'->new();
    $self->{timeDelayHelper} = undef;
    $self->{STRAIGHTAWAY} = 4;
    $self->{raceTrackGeographicMap} = $org::allbinary::media::graphics::geography::map::racetrack::NullRaceTrackGeographicMap::NULL_RACE_TRACK_GEOGRAPHIC_MAP;
    $self->{raceTrackGeographicMapCellTypeFactory} = 'org::allbinary::media::graphics::geography::map::GeographicMapCellTypeFactory'->getInstance();
    $self->{basicArrayListUtil} = 'org::allbinary::util::BasicArrayListUtil'->getInstance();
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{timeDelayHelper} = 'org::allbinary::time::TimeDelayHelper'->new(10000);
    return $self;
}


sub init {
    my ($self) = @_;
        $self->{list}->clear();
}


# throws Exception
sub isDropAllowedAt {
    my ($self, $geographicMapCellPosition) = @_;
        my $raceTrackGeographicMapCellType = $self->{raceTrackGeographicMap}->getCellTypeAt($geographicMapCellPosition);
        my $raceTrackGeographicMapCellTypeFactory = $self->{raceTrackGeographicMapCellTypeFactory};
        if ($raceTrackGeographicMapCellType == $raceTrackGeographicMapCellTypeFactory->{HORIZONTAL_STRAIGHT_ROAD_CELL_TYPE} || $raceTrackGeographicMapCellType == $raceTrackGeographicMapCellTypeFactory->{VERTICAL_STRAIGHT_ROAD_CELL_TYPE}) {
            return 1;
        }
        return 0;
}


# throws Exception
sub update {
    my ($self, $allBinaryGameLayerManager, $geographicMapInterface) = @_;
        $self->init();
        my $baseRaceTrackGeographicMap = $geographicMapInterface;
        $self->{raceTrackGeographicMap} = $baseRaceTrackGeographicMap;
        $self->{raceTrackGeographicMapCellTypeFactory} = $baseRaceTrackGeographicMap->getGeographicMapCellTypeFactory();
        my $roadGeographicMapCellHistory = 'org::allbinary::media::graphics::geography::map::racetrack::RaceTrackRoadsGeographicMapCellHistoryFactory'->getInstance();
        my $trackedList = $roadGeographicMapCellHistory->getTracked();
        my $geographicMapCellPosition = undef;
        my $lastIndex = $trackedList->size() - 1;
        my $total = 0;
        my $ahead = 0;
        for (my $index = $lastIndex; $index > 0; $index--) {
            $geographicMapCellPosition = $trackedList->get($index);
            $total = 0;
            $ahead = $index;
            while ($self->isDropAllowedAt($trackedList->get($ahead))) {
                $total++;
                if ($total > $self->{STRAIGHTAWAY}) {
                    $self->{list}->add($geographicMapCellPosition);
                    last;
                }
                $ahead++;
                if ($ahead > $lastIndex) {
                    last;
                }
            }
        }
        my $size = $self->{list}->size();
        for (my $index = $size - 1; $index >= 0; $index--) {
            $self->drop($allBinaryGameLayerManager, $index);
        }
}


# throws Exception
sub processTick {
    my ($self, $allBinaryLayerManager) = @_;
        if ($self->{timeDelayHelper}->isTime('org::allbinary::time::GameTickTimeDelayHelperFactory'->getInstance()->{startTime})) {
            my $index = $self->{basicArrayListUtil}->getRandomIndex($self->{list});
            $self->drop($allBinaryLayerManager, $index);
        }
}


# throws Exception
sub drop {
    my ($self, $allBinaryLayerManager, $index) = @_;
        die ('org::allbinary::string::CommonStrings'->getInstance()->{NOT_IMPLEMENTED});
}

use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::util::BasicArrayListUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::game::layer::AllBinaryGameLayerManager;
use org::allbinary::layer::AllBinaryLayerManager;
use org::allbinary::media::graphics::geography::map::BasicGeographicMap;
use org::allbinary::media::graphics::geography::map::GeographicMapCellHistory;
use org::allbinary::media::graphics::geography::map::GeographicMapCellPosition;
use org::allbinary::media::graphics::geography::map::GeographicMapCellTypeFactory;
use org::allbinary::media::graphics::geography::map::drop::BaseDropCellPositionGenerator;
use org::allbinary::media::graphics::geography::map::racetrack::BaseRaceTrackGeographicMap;
use org::allbinary::media::graphics::geography::map::racetrack::NullRaceTrackGeographicMap;
use org::allbinary::media::graphics::geography::map::racetrack::RaceTrackGeographicMapCellType;
use org::allbinary::media::graphics::geography::map::racetrack::RaceTrackGeographicMapCellTypeFactory;
use org::allbinary::media::graphics::geography::map::racetrack::RaceTrackGeographicMapInterface;
use org::allbinary::media::graphics::geography::map::racetrack::RaceTrackRoadsGeographicMapCellHistoryFactory;
use org::allbinary::time::GameTickTimeDelayHelperFactory;
use org::allbinary::time::TimeDelayHelper;

1;

