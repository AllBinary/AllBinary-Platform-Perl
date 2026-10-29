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

package org::allbinary::game::media::graphics::geography::map::racetrack::DynamicRaceTracksPathPrinter;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::media::graphics::geography::map::racetrack::RaceTracksPathPrinter';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}

sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
    return $self;
}


sub printAllPaths {
    my ($self, $raceTrackGeographicMapInterfaceFactoryInterface, $pathFindingInfo, $size) = @_;
        try {
            for (my $index = 0; $index < $size; $index++) {
                my $geographicMapInterface = $raceTrackGeographicMapInterfaceFactoryInterface->getTrackInstance('org::allbinary::logic::math::SmallIntegerSingletonFactory'->getInstance()->getAt($index));
                my $list = 'org::allbinary::media::graphics::geography::pathfinding::PathGenerator'->getInstance()->createList($geographicMapInterface, 'org::allbinary::media::graphics::geography::map::racetrack::RaceTrackRoadsGeographicMapCellHistoryFactory'->getInstance(), $pathFindingInfo, 10);
                print("Track " . $index, "\n");
                $self->printPaths($list);
            }
        } catch ($e) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            $self->{logUtil}->put($commonStrings->{EXCEPTION}, $self, $commonStrings->{PROCESS}, $e);
        }
}

use org::allbinary::util::BasicArrayList;
use org::allbinary::string::CommonStrings;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::math::SmallIntegerSingletonFactory;
use org::allbinary::media::graphics::geography::map::BasicGeographicMap;
use org::allbinary::media::graphics::geography::map::racetrack::RaceTrackGeographicMapInterfaceFactoryInterface;
use org::allbinary::media::graphics::geography::map::racetrack::RaceTrackRoadsGeographicMapCellHistoryFactory;
use org::allbinary::media::graphics::geography::map::racetrack::RaceTracksPathPrinter;
use org::allbinary::media::graphics::geography::pathfinding::PathFindingInfo;
use org::allbinary::media::graphics::geography::pathfinding::PathGenerator;
use java::lang::System;

1;

